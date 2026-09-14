from rest_framework import status, viewsets
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from .models import Notification
from .serializers import NotificationSerializer


class NotificationViewSet(
    viewsets.GenericViewSet
):
    serializer_class = NotificationSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):

        return (
            Notification.objects
            .filter(user=self.request.user)
            .select_related("order")
            .order_by("-created_at")
        )

    def list(self, request):

        notifications = self.get_queryset()

        serializer = self.get_serializer(
            notifications,
            many=True
        )

        return Response(serializer.data)

    @action(
        detail=True,
        methods=["patch"],
        url_path="read"
    )
    def mark_as_read(
        self,
        request,
        pk=None
    ):
        notification = self.get_object()

        notification.is_read = True
        notification.save(
            update_fields=["is_read"]
        )

        serializer = self.get_serializer(
            notification
        )

        return Response(serializer.data)

    @action(
        detail=False,
        methods=["patch"],
        url_path="read-all"
    )

    def mark_all_as_read(
        self,
        request
    ):
        self.get_queryset().filter(
            is_read=False
        ).update(
            is_read=True
        )

        return Response(
            {
                "message":
                    "All notifications marked as read."
            }
        )

    @action(
        detail=False,
        methods=["get"],
        url_path="unread-count"
    )

    def unread_count(
        self,
        request
    ):
        count = self.get_queryset().filter(
            is_read=False
        ).count()

        return Response(
            {
                "count": count
            }
        )

    def destroy(
        self,
        request,
        *args,
        **kwargs
    ):
        notification = self.get_object()

        notification.delete()

        return Response(
            status=status.HTTP_204_NO_CONTENT
        )