from django.db.models import Q

from rest_framework import viewsets
from rest_framework.permissions import AllowAny

from .models import Category, Food
from .serializers import CategorySerializer, FoodSerializer


class CategoryViewSet(viewsets.ReadOnlyModelViewSet):

    queryset = Category.objects.all()

    serializer_class = CategorySerializer

    permission_classes = [AllowAny]


class FoodViewSet(viewsets.ReadOnlyModelViewSet):

    queryset = Food.objects.filter(
        is_available=True
    )

    serializer_class = FoodSerializer

    permission_classes = [AllowAny]


    def get_queryset(self):

        queryset = Food.objects.filter(
            is_available=True
        )


        category = self.request.query_params.get(
                "category"
            )

        search = self.request.query_params.get(
                "search"
            )

        recommended = self.request.query_params.get(
                "recommended"
            )

        # Category filter

        if category:

            queryset = queryset.filter(
                category_id=category
            )


        # Search food name OR category name

        if search:

            queryset = queryset.filter(

                Q(
                    name__icontains=search
                )

                |

                Q(
                    category__name__icontains=search
                )

            )


        # Recommended filter

        if recommended == "true":

            queryset = queryset.filter(
                is_recommended=True
            )


        return queryset