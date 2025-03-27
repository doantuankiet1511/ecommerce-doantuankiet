from rest_framework import permissions
from .models import User, Shop

class IsSellerOrShopOwner(permissions.IsAuthenticated):
    def has_permission(self, request, view):
        return User.objects.filter(pk=request.user.id, role='Seller').exists() and request.user.is_verified is True or request.user.is_staff is True
    def has_object_permission(self, request, view, shop):
        return request.user and request.user == shop.user

class ProductOwner(permissions.IsAuthenticated):
    def has_object_permission(self, request, view, product):
        shop = Shop.objects.filter(user=request.user).first()
        return product.shop == shop

class IsSuperAdminOrEmployee(permissions.IsAuthenticated):
    def has_permission(self, request, view):
        return request.user.is_staff is True or request.user.role == "Employee"
class CommentOwner(permissions.IsAuthenticated):
    def has_object_permission(self, request, view, comment):
        return request.user and request.user == comment.user

class ReviewOwner(permissions.IsAuthenticated):
    def has_object_permission(self, request, view, review):
        return request.user and request.user == review.user

