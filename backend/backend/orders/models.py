from django.db import models

# Create your models here.
from django.db import models
from django.contrib.auth import get_user_model
from foods.models import Food

User = get_user_model()


class Order(models.Model):

    class Status(models.TextChoices):

        PENDING = "PENDING", "Pending"

        CONFIRMED = "CONFIRMED", "Confirmed"

        PREPARING = "PREPARING", "Preparing"

        OUT_FOR_DELIVERY = (
            "OUT_FOR_DELIVERY",
            "Out for delivery"
        )

        DELIVERED = "DELIVERED", "Delivered"

        CANCELLED = "CANCELLED", "Cancelled"


    class PaymentMethod(models.TextChoices):

        COD = "COD", "Cash on Delivery"

        WALLET = "WALLET", "Wallet"


    user = models.ForeignKey(
        User,
        on_delete=models.PROTECT,
        related_name="orders"
    )


    delivery_name = models.CharField(
        max_length=150
    )


    total_amount = models.DecimalField(
        max_digits=10,
        decimal_places=2
    )


    delivery_fee = models.DecimalField(
        max_digits=10,
        decimal_places=2,
        default=0
    )


    status = models.CharField(
        max_length=30,
        choices=Status.choices,
        default=Status.PENDING
    )


    payment_method = models.CharField(
        max_length=20,
        choices=PaymentMethod.choices,
        default=PaymentMethod.COD
    )


    delivery_address = models.TextField()


    phone = models.CharField(
        max_length=20
    )


    created_at = models.DateTimeField(
        auto_now_add=True
    )


    updated_at = models.DateTimeField(
        auto_now=True
    )


    def __str__(self):
        return f"Order #{self.id} - {self.user.username}"


class OrderItem(models.Model):

    order = models.ForeignKey(
        Order,
        on_delete=models.CASCADE,
        related_name="items"
    )


    food = models.ForeignKey(
        Food,
        on_delete=models.PROTECT
    )


    food_name = models.CharField(
        max_length=150
    )


    price = models.DecimalField(
        max_digits=10,
        decimal_places=2
    )


    quantity = models.PositiveIntegerField()


    subtotal = models.DecimalField(
        max_digits=10,
        decimal_places=2
    )


    def __str__(self):
        return f"{self.food_name} x{self.quantity}"