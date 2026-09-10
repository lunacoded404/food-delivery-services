from django.db.models.signals import pre_save, post_save
from django.dispatch import receiver

from orders.models import Order

from .models import Notification
from .services import create_notification


@receiver(pre_save, sender=Order)
def order_pre_save(
    sender,
    instance,
    **kwargs
):
    if not instance.pk:
        instance._old_status = None
        return

    try:
        old_order = Order.objects.get(
            pk=instance.pk
        )

        instance._old_status = old_order.status

    except Order.DoesNotExist:
        instance._old_status = None


@receiver(post_save, sender=Order)
def order_post_save(
    sender,
    instance,
    created,
    **kwargs
):

    if created:

        create_notification(
            user=instance.user,
            notification_type=Notification.NotificationType.ORDER,
            title="Order placed",
            message=(
                f"Your order #{instance.id} "
                "has been placed successfully."
            ),
            order=instance
        )

        return


    old_status = getattr(
        instance,
        "_old_status",
        None
    )

    if (
        old_status
        and old_status != instance.status
    ):

        status_messages = {
            Order.Status.CONFIRMED:
                "Your order has been confirmed.",

            Order.Status.PREPARING:
                "Your order is being prepared.",

            Order.Status.OUT_FOR_DELIVERY:
                "Your order is out for delivery.",

            Order.Status.DELIVERED:
                "Your order has been delivered.",

            Order.Status.CANCELLED:
                "Your order has been cancelled.",
        }

        message = status_messages.get(
            instance.status
        )

        if message:

            create_notification(
                user=instance.user,
                notification_type=Notification.NotificationType.ORDER,
                title="Order update",
                message=(
                    f"Order #{instance.id}: "
                    f"{message}"
                ),
                order=instance
            )