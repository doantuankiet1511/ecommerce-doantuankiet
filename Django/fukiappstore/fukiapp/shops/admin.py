from django.contrib import admin
from .models import User, Category, Shop, Product, Tag
from django import forms
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from django.utils.html import mark_safe
from cloudinary import CloudinaryImage
from django.contrib.auth.hashers import make_password

#Tùy chỉnh trang admin

class UserAdmin(admin.ModelAdmin):
    list_display = ['id', 'username', 'first_name', 'last_name', 'is_staff']
    def save_model(self, request, user, form, change):
        # Băm mật khẩu người dùng trước khi lưu vào cơ sở dữ liệu
        user.password = make_password(form.cleaned_data["password"])

        super().save_model(request, user, form, change)

    class Meta:
        model = User
        fields = '__all__'
class ShopForm(forms.ModelForm):
    description = forms.CharField(widget=CKEditorUploadingWidget)

    class Meta:
        model = Shop
        fields = '__all__'
class ShopAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'description']
    search_fields = ['name', 'description']
    form = ShopForm

class TagInlineAdmin(admin.StackedInline):
    model = Product.tags.through
class ProductForm(forms.ModelForm):
    description = forms.CharField(widget=CKEditorUploadingWidget)

    class Meta:
        model = Product
        fields = '__all__'

class ProductAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'price', 'category', 'shop', 'image']
    search_fields = ['name']
    list_filter = ['category', 'shop']
    form = ProductForm
    readonly_fields = ['avatar']
    inlines = [TagInlineAdmin, ]

    def avatar(self, product):
        image_url = CloudinaryImage(product.image.name).build_url(width=120)
        return mark_safe("<img src='{}' width='120' >".format(image_url))
        # return mark_safe("<img src='/static/{}' width='120' >".format(product.image.name))

# Register your models here.
admin.site.register(User, UserAdmin)
admin.site.register(Category)
admin.site.register(Shop, ShopAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(Tag)