from django.urls import path, include
from . import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register('users', views.UserViewSet)
router.register('categories', views.CategoryViewSet)
router.register('shops', views.ShopViewSet)
router.register('products', views.ProductViewSet)
router.register('comments', views.CommentViewSet)
router.register('reviews', views.ReviewViewSet)

urlpatterns = [
    path('', include(router.urls)),
]