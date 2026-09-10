from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):

    email = models.EmailField(
        unique=True
    )

    phone = models.CharField(
        max_length=20,
        blank=True
    )

    avatar = models.ImageField(
        upload_to="avatars/",
        blank=True,
        null=True
    )

    created_at = models.DateTimeField(
        auto_now_add=True
    )

    updated_at = models.DateTimeField(
        auto_now=True
    )

    def __str__(self):
        return self.username


class UserSettings(models.Model):

    user = models.OneToOneField(
        User,
        on_delete=models.CASCADE,
        related_name="settings"
    )

    email_notifications = models.BooleanField(
        default=True
    )

    order_notifications = models.BooleanField(
        default=True
    )

    promotional_notifications = models.BooleanField(
        default=True
    )

    created_at = models.DateTimeField(
        auto_now_add=True
    )

    updated_at = models.DateTimeField(
        auto_now=True
    )

    def __str__(self):
        return f"Settings - {self.user.username}"


class Address(models.Model):

    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name="addresses"
    )

    receiver_name = models.CharField(
        max_length=150
    )

    phone = models.CharField(
        max_length=20
    )

    address = models.TextField()

    is_default = models.BooleanField(
        default=False
    )

    created_at = models.DateTimeField(
        auto_now_add=True
    )

    updated_at = models.DateTimeField(
        auto_now=True
    )

    class Meta:
        ordering = [
            "-is_default",
            "-created_at"
        ]

    def __str__(self):
        return (
            f"{self.receiver_name} - "
            f"{self.address}"
        )