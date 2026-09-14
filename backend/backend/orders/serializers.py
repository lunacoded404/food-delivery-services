from rest_framework import serializers
from .models import Order, OrderItem


class OrderItemSerializer(serializers.ModelSerializer):
    food_image = serializers.SerializerMethodField()
    
    class Meta:
        model = OrderItem

        fields = [
            "id",
            "food",
            "food_name",
            "food_image",
            "price",
            "quantity",
            "subtotal",
        ]

    def get_food_image(self, obj):
        if obj.food.image:
            return obj.food.image

        return None


class OrderSerializer(serializers.ModelSerializer):

    items = OrderItemSerializer(
        many=True,
        read_only=True
    )

    status_display = serializers.CharField(
        source="get_status_display",
        read_only=True
    )

    payment_method_display = serializers.CharField(
        source="get_payment_method_display",
        read_only=True
    )

    class Meta:
        model = Order

        fields = [
            "id",
            "delivery_name",
            "phone",
            "delivery_address",
            "payment_method",
            "payment_method_display",
            "status",
            "status_display",
            "delivery_fee",
            "total_amount",
            "created_at",
            "updated_at",
            "items",
        ]