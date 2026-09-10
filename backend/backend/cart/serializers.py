from rest_framework import serializers

from .models import Cart, CartItem


class CartItemSerializer(
    serializers.ModelSerializer
):

    food_name = serializers.CharField(
        source="food.name",
        read_only=True
    )

    food_price = serializers.DecimalField(
        source="food.price",
        max_digits=10,
        decimal_places=2,
        read_only=True
    )

    food_image = serializers.SerializerMethodField()

    subtotal = serializers.SerializerMethodField()


    class Meta:

        model = CartItem

        fields = [
            "id",
            "food",
            "food_name",
            "food_price",
            "food_image",
            "quantity",
            "subtotal",
        ]


    def get_food_image(
        self,
        obj
    ):

        if obj.food.image:
            return obj.food.image

        return None


    def get_subtotal(
        self,
        obj
    ):

        return (
            obj.food.price *
            obj.quantity
        )


class CartSerializer(
    serializers.ModelSerializer
):

    items = CartItemSerializer(
        many=True,
        read_only=True
    )

    total = serializers.SerializerMethodField()


    class Meta:

        model = Cart

        fields = [
            "id",
            "items",
            "total",
        ]


    def get_total(
        self,
        obj
    ):

        return sum(
            item.food.price * item.quantity
            for item in obj.items.select_related("food")
        )