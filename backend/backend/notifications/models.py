from django.db import models
from accounts.models import User


class Notification(models.Model):

    class NotificationType(models.TextChoices):
        ORDER = "ORDER", "Order"
        PAYMENT = "PAYMENT", "Payment"
        PROMOTION = "PROMOTION", "Promotion"
        SYSTEM = "SYSTEM", "System"

    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name="notifications"
    )

    notification_type = models.CharField(
        max_length=20,
        choices=NotificationType.choices,
        default=NotificationType.SYSTEM
    )

    title = models.CharField(
        max_length=150
    )

    message = models.TextField()

    order = models.ForeignKey(
        "orders.Order",
        on_delete=models.CASCADE,
        null=True,
        blank=True,
        related_name="notifications"
    )

    is_read = models.BooleanField(
        default=False
    )

    created_at = models.DateTimeField(
        auto_now_add=True
    )

    class Meta:
        ordering = ["-created_at"]

    def __str__(self):
        return f"{self.user.email} - {self.title}"