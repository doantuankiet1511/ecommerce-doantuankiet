from rest_framework import serializers
from django.db.models import Sum
from .models import PaymentMethod, Order, OrderDetail
import shops

class PaymentMethodSerializer(serializers.ModelSerializer):
    class Meta:
        model = PaymentMethod
        fields = '__all__'

class OrderItemDetailSerializer(serializers.ModelSerializer):
    product = shops.serializers.ProductSerializer()
    total_item_price = serializers.SerializerMethodField()

    def get_total_item_price(self, orderdetail):
        return orderdetail.unit_price * orderdetail.quantity
    class Meta:
        model = OrderDetail
        fields = ['id', 'product', 'unit_price', 'quantity', 'total_item_price']

class OrderBaseSerializer(serializers.ModelSerializer):
    payment_method = PaymentMethodSerializer()
    class Meta:
        model = Order
        fields = ['id', 'name', 'receiver_name', 'receiver_phone', 'receiver_address', 'total_price', 'payment_method', 'status']

class OrderDetailSerializer(OrderBaseSerializer):
    order_details = OrderItemDetailSerializer(many=True, read_only=True)
    class Meta:
        model = OrderBaseSerializer.Meta.model
        fields = OrderBaseSerializer.Meta.fields + ['total_price', 'order_details']