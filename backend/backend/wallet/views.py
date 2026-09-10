from decimal import Decimal, InvalidOperation

from django.db import transaction

from rest_framework import status, viewsets
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from notifications.models import Notification
from notifications.services import create_notification

from .models import Wallet, WalletTransaction
from .serializers import (
    WalletSerializer,
    WalletTransactionSerializer,
)


class WalletViewSet(viewsets.ViewSet):

    permission_classes = [IsAuthenticated]

    def get_wallet(self, request):
        wallet, created = Wallet.objects.get_or_create(
            user=request.user
        )

        return wallet

    # GET /api/wallet/
    def list(self, request):
        wallet = self.get_wallet(request)

        serializer = WalletSerializer(wallet)

        return Response(serializer.data)

    # GET /api/wallet/transactions/
    @action(
        detail=False,
        methods=["get"],
        url_path="transactions"
    )
    def transactions(self, request):

        wallet = self.get_wallet(request)

        transactions = (
            WalletTransaction.objects
            .filter(wallet=wallet)
            .select_related("order")
            .order_by("-created_at")
        )

        serializer = WalletTransactionSerializer(
            transactions,
            many=True
        )

        return Response(serializer.data)

    # POST /api/wallet/deposit/
    @action(
        detail=False,
        methods=["post"],
        url_path="deposit"
    )
    def deposit(self, request):

        amount = request.data.get("amount")

        # Không nhập amount
        if amount is None:
            return Response(
                {
                    "detail": "Amount is required."
                },
                status=status.HTTP_400_BAD_REQUEST
            )

        # Chuyển amount sang Decimal
        try:
            amount = Decimal(str(amount))
        except (InvalidOperation, ValueError):
            return Response(
                {
                    "detail": "Invalid amount."
                },
                status=status.HTTP_400_BAD_REQUEST
            )

        # Không cho số tiền <= 0
        if amount <= 0:
            return Response(
                {
                    "detail": "Amount must be greater than 0."
                },
                status=status.HTTP_400_BAD_REQUEST
            )

        # Làm tròn 2 chữ số thập phân
        amount = amount.quantize(
            Decimal("0.01")
        )

        with transaction.atomic():

            # Lấy wallet hoặc tạo mới
            wallet = Wallet.objects.get_or_create(
                user=request.user
            )[0]

            # Cộng tiền vào wallet
            wallet.balance += amount

            wallet.save(
                update_fields=[
                    "balance",
                    "updated_at"
                ]
            )

            # Tạo transaction
            WalletTransaction.objects.create(
                wallet=wallet,
                transaction_type=(
                    WalletTransaction
                    .TransactionType
                    .DEPOSIT
                ),
                amount=amount,
                description="Wallet deposit"
            )

            # Tạo notification
            create_notification(
                user=request.user,
                notification_type=(
                    Notification
                    .NotificationType
                    .PAYMENT
                ),
                title="Wallet deposit",
                message=(
                    f"${amount} has been added "
                    "to your wallet successfully."
                )
            )

        # Trả về wallet mới
        serializer = WalletSerializer(wallet)

        return Response(
            serializer.data,
            status=status.HTTP_200_OK
        )