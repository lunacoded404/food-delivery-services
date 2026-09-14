from django.contrib.auth import get_user_model

from rest_framework import (
    status,
    viewsets,
)

from rest_framework.decorators import action

from rest_framework.permissions import (
    AllowAny,
    IsAuthenticated,
)

from rest_framework.response import Response

from rest_framework_simplejwt.serializers import (
    TokenRefreshSerializer
)

from rest_framework_simplejwt.tokens import (
    RefreshToken
)

from .models import (
    UserSettings,
    Address,
)

from .serializers import (
    RegisterSerializer,
    LoginSerializer,
    ProfileSerializer,
    AddressSerializer,
    UserSettingsSerializer,
    ChangePasswordSerializer,
)

User = get_user_model()

class AuthViewSet(
    viewsets.GenericViewSet
):
    def get_permissions(self):
        if self.action in [
            "register",
            "login",
            "refresh",
        ]:
            return [AllowAny()]

        return [IsAuthenticated()]

    @action(
        detail=False,
        methods=["post"],
        url_path="register"
    )

    def register(
        self,
        request
    ):
        serializer = RegisterSerializer(
            data=request.data
        )

        serializer.is_valid(
            raise_exception=True
        )

        user = serializer.save()

        return Response(
            {
                "message":
                    "Registration successful.",

                "user": {
                    "id": user.id,
                    "username": user.username,
                    "email": user.email,
                }
            },
            status=status.HTTP_201_CREATED
        )

    @action(
        detail=False,
        methods=["post"],
        url_path="login"
    )

    def login(
        self,
        request
    ):
        serializer = LoginSerializer(
            data=request.data
        )

        serializer.is_valid(
            raise_exception=True
        )

        user = serializer.validated_data[
            "user"
        ]

        refresh = RefreshToken.for_user(
            user
        )

        return Response({
            "message": "Login successful.",

            "access": str(refresh.access_token),

            "refresh": str(refresh),

            "user": {
                "id": user.id,
                "username": user.username,
                "email": user.email,
                "first_name": user.first_name,
                "last_name": user.last_name,
                "phone": user.phone,
            }
        })

    @action(
        detail=False,
        methods=["post"],
        url_path="refresh"
    )

    def refresh(
        self,
        request
    ):
        serializer = TokenRefreshSerializer(
            data=request.data
        )

        serializer.is_valid(
            raise_exception=True
        )

        return Response(
            serializer.validated_data
        )

    @action(
        detail=False,
        methods=["get"],
        url_path="me"
    )

    def me(
        self,
        request
    ):
        user = request.user
        return Response({
            "id": user.id,
            "username": user.username,
            "email": user.email,
            "first_name": user.first_name,
            "last_name": user.last_name,
            "phone": user.phone,
            "avatar":
                (
                    request.build_absolute_uri(
                        user.avatar.url
                    )

                    if user.avatar
                    else None
                ),
        })


class AccountViewSet(viewsets.ViewSet):

    permission_classes = [IsAuthenticated]

    @action(
        detail=False,
        methods=["get", "patch"],
        url_path="profile"
    )

    def profile(self, request):
        user = request.user

        if request.method == "GET":
            serializer = ProfileSerializer(
                user,
                context={"request": request}
            )
            return Response(serializer.data)

        serializer = ProfileSerializer(
            user,
            data=request.data,
            partial=True,
            context={"request": request}
        )

        serializer.is_valid(raise_exception=True)
        serializer.save()
        user.refresh_from_db()

        serializer = ProfileSerializer(
            user,
            context={"request": request}
        )
        return Response(serializer.data)

    @action(
        detail=False,
        methods=["get", "patch"],
        url_path="settings"
    )

    def user_settings(self, request):
        settings, created = UserSettings.objects.get_or_create(
            user=request.user
        )

        if request.method == "GET":
            serializer = UserSettingsSerializer(settings)
            return Response(serializer.data)

        serializer = UserSettingsSerializer(
            settings,
            data=request.data,
            partial=True
        )

        serializer.is_valid(raise_exception=True)
        serializer.save()

        return Response(serializer.data)

    @action(
        detail=False,
        methods=["post"],
        url_path="change-password"
    )

    def change_password(self, request):
        serializer = ChangePasswordSerializer(
            data=request.data,
            context={"request": request}
        )

        serializer.is_valid(raise_exception=True)
        user = request.user
        user.set_password(
            serializer.validated_data["new_password"]
        )
        user.save(update_fields=["password"])

        return Response({
            "message": "Password changed successfully."
        })

    
class AddressViewSet(
    viewsets.ModelViewSet
):
    serializer_class = AddressSerializer
    permission_classes = [
        IsAuthenticated
    ]

    def get_queryset(self):
        return Address.objects.filter(
            user=self.request.user
        )

    def perform_create(
        self,
        serializer
    ):
        has_address = Address.objects.filter(
            user=self.request.user
        ).exists()

        serializer.save(
            user=self.request.user,
            is_default=not has_address
        )

    def perform_update(
        self,
        serializer
    ):
        instance = serializer.instance
        is_default = serializer.validated_data.get(
            "is_default",
            instance.is_default
        )

        if is_default:
            Address.objects.filter(
                user=self.request.user
            ).exclude(
                id=instance.id
            ).update(
                is_default=False
            )

        serializer.save()

    @action(
        detail=True,
        methods=["patch"],
        url_path="default"
    )

    def set_default(
        self,
        request,
        pk=None
    ):

        address = self.get_object()
        Address.objects.filter(
            user=request.user
        ).update(
            is_default=False
        )

        address.is_default = True
        address.save(
            update_fields=[
                "is_default"
            ]
        )

        serializer = self.get_serializer(
            address
        )

        return Response(
            serializer.data
        )