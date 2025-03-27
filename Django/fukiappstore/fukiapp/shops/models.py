from django.db import models
from django.contrib.auth.models import AbstractUser
from ckeditor.fields import RichTextField

# Create your models here.

class BaseModel(models.Model):
    is_active = models.BooleanField(default=True)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True

class User(AbstractUser):
    avatar = models.ImageField(upload_to='users/%Y/%m/', null=True)
    role = models.CharField(choices=[('Seller', 'Seller'), ('Customer', 'Customer'), ('Employee', 'Employee')], max_length=10, default='Customer')
    is_verified = models.BooleanField(default=True)

class Category(models.Model):
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name

class Shop(BaseModel):
    name = models.CharField(max_length=255, unique=True)
    description = RichTextField(null=True)
    avatar = models.ImageField(upload_to='shops/%Y/%m/', null=True)
    user = models.OneToOneField(User, on_delete=models.RESTRICT)

    def __str__(self):
        return self.name

class Product(BaseModel):
    name = models.CharField(max_length=255)
    image = models.ImageField(upload_to='products/%Y/%m/', null=True, blank=True)
    description = RichTextField(null=True, blank=True)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    category = models.ForeignKey(Category, on_delete=models.RESTRICT, related_name='products')
    shop = models.ForeignKey(Shop, on_delete=models.RESTRICT)
    tags = models.ManyToManyField('Tag')

    class Meta:
        unique_together = ('name', 'shop')
    def __str__(self):
        return self.name

class Tag(BaseModel):
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name

class ActionBase(BaseModel):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    class Meta:
        abstract = True

class Like(ActionBase):
    liked = models.BooleanField(default=True)

    class Meta:
        unique_together = ('product', 'user')

class Review(ActionBase):
    rate = models.SmallIntegerField(default=0)
    content = models.CharField(max_length=255, null=True, blank=True)

    class Meta:
        unique_together = ('product', 'user')
    def __str__(self):
        return self.content

class Comment(ActionBase):
    content = models.CharField(max_length=255)
    reply_to = models.ForeignKey('self', on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return self.content

class Notification(models.Model):
    sender = models.IntegerField()
    content = models.CharField(max_length=255)
    recipient = models.ForeignKey(User, on_delete=models.CASCADE)
    created_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.content
