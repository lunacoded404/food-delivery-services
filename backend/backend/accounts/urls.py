from django.urls import include, path

from rest_framework.routers import DefaultRouter

from .views import (
    AuthViewSet,
    AccountViewSet,
    AddressViewSet,
)


router = DefaultRouter()


# =====================================
# AUTH
# =====================================

router.register(
    r"auth",
    AuthViewSet,
    basename="auth"
)


# =====================================
# ACCOUNT
# =====================================

router.register(
    r"account",
    AccountViewSet,
    basename="account"
)


# =====================================
# ADDRESSES
# =====================================

router.register(
    r"addresses",
    AddressViewSet,
    basename="addresses"
)


urlpatterns = [

    path(
        "",
        include(router.urls)
    ),

]