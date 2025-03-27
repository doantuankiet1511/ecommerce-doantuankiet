from rest_framework import permissions
import shops

class IsSellerOrShopOwner(permissions.IsAuthenticated):
    def has_permission(self, request, view):
        return shops.models.User.objects.filter(pk=request.user.id, role='Seller').exists() and request.user.is_verified is True or request.user.is_staff is True or shops.models.User.objects.filter(pk=request.user.id, role='Employee').exists()
    def has_object_permission(self, request, view, shop):
        return request.user and request.user == shop.user