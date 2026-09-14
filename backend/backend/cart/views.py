from rest_framework import status
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import viewsets

from .models import Cart, CartItem
from .serializers import CartSerializer, CartItemSerializer


class CartViewSet(
    viewsets.ViewSet
):
    permission_classes = [
        IsAuthenticated
    ]

    def get_cart(self, request):
        cart, created = Cart.objects.get_or_create(
            user=request.user
        )

        return cart


    def list(self, request):
        cart = self.get_cart(request)
        serializer = CartSerializer(
            cart,
            context={
                "request": request
            }
        )

        return Response(
            serializer.data
        )

    @action(
        detail=False,
        methods=["delete"],
        url_path="clear"
    )

    def clear(self, request):
        cart = self.get_cart(request)
        cart.items.all().delete()

        return Response({
            "message":
            "Cart cleared successfully."
        })


class CartItemViewSet(
    viewsets.ViewSet
):
    permission_classes = [
        IsAuthenticated
    ]

    def get_cart(
        self,
        request
    ):
        cart, created = Cart.objects.get_or_create(
            user=request.user
        )

        return cart

    def create(
        self,
        request
    ):
        food_id = request.data.get(
            "food_id"
        )

        quantity = int(
            request.data.get(
                "quantity",
                1
            )
        )

        if not food_id:
            return Response(
                {
                    "detail":
                    "food_id is required."
                },

                status=status.HTTP_400_BAD_REQUEST
            )

        if quantity < 1:
            return Response(
                {
                    "detail":
                    "Quantity must be at least 1."
                },

                status=status.HTTP_400_BAD_REQUEST
            )

        cart = self.get_cart(
            request
        )

        item, created = CartItem.objects.get_or_create(
            cart=cart,
            food_id=food_id,
            defaults={
                "quantity": quantity
            }
        )

        if not created:
            item.quantity += quantity
            item.save(
                update_fields=[
                    "quantity",
                    "updated_at"
                ]
            )

        serializer = CartItemSerializer(
            item,
            context={
                "request": request
            }
        )

        return Response(
            serializer.data,
            status=status.HTTP_200_OK
        )

    def partial_update(
        self,
        request,
        pk=None
    ):
        cart = self.get_cart(
            request
        )

        try:
            item = CartItem.objects.get(
                id=pk,
                cart=cart
            )

        except CartItem.DoesNotExist:
            return Response(
                {
                    "detail":
                    "Cart item not found."
                },
                status=status.HTTP_404_NOT_FOUND
            )

        quantity = request.data.get(
            "quantity"
        )

        if quantity is None:
            return Response(
                {
                    "detail":
                    "quantity is required."
                },
                status=status.HTTP_400_BAD_REQUEST
            )

        try:
            quantity = int(
                quantity
            )

        except (
            TypeError,
            ValueError
        ):
            return Response(
                {
                    "detail":
                    "Quantity must be a valid number."
                },
                status=status.HTTP_400_BAD_REQUEST
            )

        quantity = max(1, quantity)
        item.quantity = quantity
        item.save(
            update_fields=[
                "quantity",
                "updated_at"
            ]
        )

        serializer = CartItemSerializer(
            item,
            context={
                "request": request
            }
        )

        return Response(
            serializer.data
        )

    def destroy(
        self,
        request,
        pk=None
    ):
        cart = self.get_cart(
            request
        )

        try:
            item = CartItem.objects.get(
                id=pk,
                cart=cart
            )

        except CartItem.DoesNotExist:
            return Response(
                {
                    "detail":
                    "Cart item not found."
                },
                status=status.HTTP_404_NOT_FOUND
            )

        item.delete()

        return Response(
            status=status.HTTP_204_NO_CONTENT
        )