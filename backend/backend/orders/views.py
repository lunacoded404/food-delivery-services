from decimal import Decimal
from django.db import transaction

from rest_framework import (
    status,
    viewsets
)

from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from .models import Order, OrderItem
from .serializers import OrderSerializer
from cart.models import CartItem
from wallet.models import Wallet, WalletTransaction

DELIVERY_FEE = Decimal("5.00")


class OrderViewSet(viewsets.ModelViewSet):
    permission_classes = [
        IsAuthenticated
    ]
    
    serializer_class = OrderSerializer

    def get_queryset(self):

        return (
            Order.objects
            .filter(user=self.request.user)
            .prefetch_related(
                "items__food"
            )
            .order_by("-created_at")
        )

    def create(self, request):

        cart_item_ids = request.data.get(
            "cart_item_ids"
        )

        delivery_name = request.data.get(
            "delivery_name"
        )

        phone = request.data.get(
            "phone"
        )

        delivery_address = request.data.get(
            "delivery_address"
        )

        payment_method = request.data.get(
            "payment_method",
            Order.PaymentMethod.COD
        )

        if not cart_item_ids:

            return Response(
                {
                    "detail":
                    "Please select at least one item."
                },
                status=status.HTTP_400_BAD_REQUEST
            )

        if not delivery_name:

            return Response(
                {
                    "detail":
                    "Delivery name is required."
                },
                status=status.HTTP_400_BAD_REQUEST
            )

        if not phone:

            return Response(
                {
                    "detail":
                    "Phone is required."
                },
                status=status.HTTP_400_BAD_REQUEST
            )

        if not delivery_address:

            return Response(
                {
                    "detail":
                    "Delivery address is required."
                },
                status=status.HTTP_400_BAD_REQUEST
            )


        if payment_method not in [
            Order.PaymentMethod.COD,
            Order.PaymentMethod.WALLET
        ]:

            return Response(
                {
                    "detail":
                    "Invalid payment method."
                },
                status=status.HTTP_400_BAD_REQUEST
            )

        cart_items = (
            CartItem.objects
            .filter(
                id__in=cart_item_ids,
                cart__user=request.user
            )
            .select_related("food")
        )

        if cart_items.count() != len(cart_item_ids):

            return Response(
                {
                    "detail":
                    "Some cart items are invalid."
                },
                status=status.HTTP_400_BAD_REQUEST
            )
        
        unavailable_items = [
            item.food.name
            for item in cart_items
            if not item.food.is_available
        ]

        if unavailable_items:
            return Response(
                {
                    "detail":
                    "Some foods are no longer available.",
                    "foods":
                    unavailable_items
                },
                status=status.HTTP_400_BAD_REQUEST
            )

        subtotal = Decimal("0.00")

        for item in cart_items:

            subtotal += (
                item.food.price *
                item.quantity
            )

        delivery_fee = (
            DELIVERY_FEE
            if cart_items.exists()
            else Decimal("0.00")
        )

        total_amount = (
            subtotal +
            delivery_fee
        )

        with transaction.atomic():
            if payment_method == Order.PaymentMethod.WALLET:
                wallet, created = (
                    Wallet.objects
                    .select_for_update()
                    .get_or_create(
                        user=request.user
                    )
                )

                if wallet.balance < total_amount:
                    return Response(
                        {
                            "detail":
                            "Insufficient wallet balance.",
                            "balance":
                            str(wallet.balance),
                            "required":
                            str(total_amount)
                        },
                        status=status.HTTP_400_BAD_REQUEST
                    )

                wallet.balance -= total_amount

                wallet.save(
                    update_fields=[
                        "balance",
                        "updated_at"
                    ]
                )

            order = Order.objects.create(

                user=request.user,

                delivery_name=
                    delivery_name,

                phone=phone,

                delivery_address=
                    delivery_address,

                payment_method=
                    payment_method,

                delivery_fee=
                    delivery_fee,

                total_amount=
                    total_amount,

                status=
                    Order.Status.PENDING
            )

            for item in cart_items:
                food = item.food
                item_subtotal = (
                    food.price *
                    item.quantity
                )

                OrderItem.objects.create(
                    order=order,
                    food=food,
                    food_name=food.name,
                    price=food.price,
                    quantity=item.quantity,
                    subtotal=item_subtotal
                )

            if payment_method == Order.PaymentMethod.WALLET:
                WalletTransaction.objects.create(
                    wallet=wallet,
                    transaction_type=(
                        WalletTransaction
                        .TransactionType
                        .PAYMENT
                    ),

                    amount=total_amount,
                    description=(
                        f"Payment for Order #{order.id}"
                    ),
                    order=order
                )

            cart_items.delete()


        serializer = OrderSerializer(
            order,
            context={
                "request": request
            }
        )


        return Response(
            {
                "message":
                    "Order placed successfully.",

                "order":
                    serializer.data
            },
            status=status.HTTP_201_CREATED
        )