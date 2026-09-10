from rest_framework import serializers
from .models import Wallet, WalletTransaction


class WalletSerializer(serializers.ModelSerializer):

    class Meta:
        model = Wallet
        fields = [
            "id",
            "balance",
            "created_at",
            "updated_at",
        ]


class WalletTransactionSerializer(serializers.ModelSerializer):

    transaction_type_display = serializers.CharField(
        source="get_transaction_type_display",
        read_only=True
    )

    class Meta:
        model = WalletTransaction
        fields = [
            "id",
            "transaction_type",
            "transaction_type_display",
            "amount",
            "description",
            "order",
            "created_at",
        ]