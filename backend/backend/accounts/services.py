from django.core.mail import send_mail
from .models import User


def send_user_email(
    user,
    subject,
    message
):
    if not user.email: return
    settings = user.settings
    if not settings.email_notifications: return

    send_mail(
        subject,
        message,
        None,
        [user.email],
        fail_silently=False
    )