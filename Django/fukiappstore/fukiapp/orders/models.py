from django.db import models
import shops

# Create your models here.
class BaseModel(models.Model):
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True

class PaymentMethod(models.Model):
    name = models.CharField(max_length=50, unique=True)
    active = models.BooleanField(default=True)
    def __str__(self):
        return self.name

class Order(BaseModel):
    STATUS_CHOICES = [
        ("PENDING", "PENDING"),
        ("ACCEPTED", "ACCEPTED"),
        ("SUCCESSED", "SUCCESSED")
    ]

    name = models.CharField(max_length=255)
    user = models.ForeignKey(shops.models.User, on_delete=models.SET_NULL, null=True, blank=True)

    receiver_name = models.CharField(max_length=255)
    receiver_phone = models.CharField(max_length=10)
    receiver_address = models.CharField(max_length=255)

    total_price = models.DecimalField(max_digits=10, decimal_places=2)

    payment_method = models.ForeignKey(PaymentMethod, on_delete=models.PROTECT)
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='PENDING')
    def __str__(self):
        return self.name

class OrderDetail(BaseModel):
    order = models.ForeignKey(Order, on_delete=models.PROTECT, related_name='order_details')
    product = models.ForeignKey(shops.models.Product, on_delete=models.PROTECT)
    quantity = models.IntegerField(default=1)
    unit_price = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return self.order.name