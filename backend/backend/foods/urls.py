from rest_framework.routers import DefaultRouter
from .views import CategoryViewSet, FoodViewSet


router = DefaultRouter()

router.register(
    r"categories",
    CategoryViewSet,
    basename="category"
)

router.register(
    r"foods",
    FoodViewSet,
    basename="food"
)

urlpatterns = router.urls