from rest_framework import mixins, viewsets
from rest_framework.permissions import AllowAny

from .models import ContactMessage
from .serializers import ContactMessageSerializer


class ContactMessageViewSet(
    mixins.CreateModelMixin,
    viewsets.GenericViewSet
):

    serializer_class = ContactMessageSerializer
    permission_classes = [AllowAny]

    def get_queryset(self):

        return ContactMessage.objects.all()

    def perform_create(self, serializer):

        user = (
            self.request.user
            if self.request.user.is_authenticated
            else None
        )

        serializer.save(
            user=user
        )