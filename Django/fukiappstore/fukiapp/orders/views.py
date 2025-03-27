from rest_framework import viewsets, generics, status, permissions
from rest_framework.decorators import action, api_view
from rest_framework.views import Response, APIView
from django.db.models import Sum, Count, F, Q
from .models import Order, OrderDetail, PaymentMethod
import shops
from .serializers import (
    PaymentMethodSerializer,
    OrderDetailSerializer
)
import random
from datetime import datetime
from .permis import IsSellerOrShopOwner
import json
import urllib.request
import urllib
import uuid
import requests
import hmac
import hashlib

# Create your views here.
class PaymentMethodViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = PaymentMethod.objects.filter(active=True)
    serializer_class = PaymentMethodSerializer

class OrderViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.RetrieveAPIView, generics.ListAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderDetailSerializer

    def create(self, request, *args, **kwargs):
        user = request.user
        try:
            name_order = request.data.get('name_order')
            if name_order:
                name = name_order
            else:
                name = 'HD{}'.format(random.randint(100000, 900000))
            receiver_name = request.data.get('receiver_name')
            receiver_phone = request.data.get('receiver_phone')
            receiver_address = request.data.get('receiver_address')

            payment_method = PaymentMethod.objects.get(id=request.data.get('payment_method'), active=True)
            order_details = request.data.get('order_details')
        except:
            return Response({'error': 'Bạn cần phải điền đầy đủ thông tin'}, status=status.HTTP_400_BAD_REQUEST)

        order = Order.objects.create(
            name=name,
            receiver_name=receiver_name,
            receiver_phone=receiver_phone,
            receiver_address=receiver_address,
            total_price=sum(item['quantity'] * float(item['unit_price']) for item in order_details),
            payment_method=payment_method
        )
        if user.is_authenticated:
            order.user = user
        order.save()

        if order_details:
            for item in order_details:
                get_product = shops.models.Product.objects.get(id=item['product'])
                order_data = OrderDetail.objects.create(
                    order=order,
                    product=get_product,
                    quantity=item['quantity'],
                    unit_price=item['unit_price']
                )
                order_data.save()
        else:
            return Response({'error': 'Bạn không có sản phẩm nào tồn tại trong giỏ hàng!!!'}, status=status.HTTP_400_BAD_REQUEST)
        return Response(OrderDetailSerializer(order).data, status.HTTP_201_CREATED)

# Thống kê doanh thu từng danh mục và sản phẩm của cửa hàng theo tháng, quý, năm
class RevenueStatsMonth(APIView):
    permission_classes = [IsSellerOrShopOwner]

    def post(self, request):
        try:
            current_year = datetime.now().year
            month_str = int(request.data.get('month'))
            year_str = request.data.get('year')

            if not year_str:
                year = datetime.now().year
            elif int(year_str) > int(current_year):
                return Response({'error': ('Bạn vui lòng nhập từ năm {} trở về trước').format(current_year)}, status=status.HTTP_400_BAD_REQUEST)
            else:
                year = year_str

            if (month_str >= 1 and month_str <= 12):
                month = month_str
            else:
                return Response({'error': 'Nhập sai tháng'}, status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response({'error': "Invalid month format. Please use 'MM' format."}, status=status.HTTP_400_BAD_REQUEST)

        # Lấy các sản phẩm của cửa hàng người bán
        try:
            shop = shops.models.Shop.objects.get(user=request.user)
            # products = shops.models.Product.objects.filter(shop=shop).all()
        except:
            return Response({'error': "Vui lòng tạo một cửa hàng"}, status=status.HTTP_400_BAD_REQUEST)

        # total_revenue = 0
        #
        # # Doanh thu các sản phẩm
        # revenue_products = []
        # for product in products:
        #     product_order = OrderDetail.objects.filter(product=product, created_date__month=month, created_date__year=year).all()
        #     quantity_sold = product_order.aggregate(Sum('quantity'))['quantity__sum']
        #
        #     item = {
        #         'id': product.id,
        #         'name': product.name,
        #         'price': product.price,
        #         'quantity_sold': quantity_sold if quantity_sold else 0,
        #         'revenue_sold': quantity_sold * product.price if quantity_sold else 0,
        #         'month': '{} - {}'.format(month, year)
        #     }
        #     revenue_products.append(item)
        #
        #     # Doanh thu của cửa hàng
        #     total_revenue += quantity_sold * product.price if quantity_sold else 0

        # Tổng doanh thu cửa hàng
        total = OrderDetail.objects.filter(created_date__month=month, created_date__year=year, product__shop=shop)\
            .aggregate(total_revenue=Sum(F('quantity') * F('unit_price')))

        #Doanh thu các sản phẩm bán chạy
        revenue_best_products = shops.models.Product.objects.filter(shop=shop)\
            .values('id', 'name', 'price')\
            .annotate(total_quantity_sold=Sum('orderdetail__quantity', filter=Q(orderdetail__created_date__month=month) & Q(orderdetail__created_date__year=year)),
                      revenue_sold=Sum(F('orderdetail__quantity') * F('orderdetail__unit_price'), filter=Q(orderdetail__created_date__month=month) & Q(orderdetail__created_date__year=year)))\
            .order_by('-total_quantity_sold', '-revenue_sold')

        # Doanh thu của các danh mục loại sản phẩm
        revenue_category = shops.models.Category.objects.filter(products__shop=shop)\
            .annotate(total_revenue_cate=Sum(F('products__orderdetail__unit_price') * F('products__orderdetail__quantity'),
                                        filter=Q(products__orderdetail__order__created_date__month=month) & Q(products__orderdetail__order__created_date__year=year)))\
            .values('id', 'name', 'total_revenue_cate')

        data = {
            "shop_name": shop.name,
            "month": '{} - {}'.format(month, year),
            "total_revenue": total['total_revenue'] if total['total_revenue'] else 0,
            "revenue_category": revenue_category,
            "revenue_best_products": revenue_best_products
        }
        return Response(data, status=status.HTTP_200_OK)

class RevenueStatsQuarter(APIView):
    permission_classes = [IsSellerOrShopOwner]

    def post(self, request):
        try:
            quarter = int(request.data.get('quarter'))
            current_year = datetime.now().year
            year_str = request.data.get('year')

            if not year_str:
                year = datetime.now().year
            elif int(year_str) > int(current_year):
                return Response({'error': ('Bạn vui lòng nhập từ năm {} trở về trước').format(current_year)}, status=status.HTTP_400_BAD_REQUEST)
            else:
                year = year_str
        except:
            return Response({'error': "Invalid year or quarter format. Please use 'YYYY' format for year and '1', '2', '3', or '4' for quarter."}, status= status.HTTP_400_BAD_REQUEST)

        # Lấy các sản phẩm của cửa hàng người bán
        try:
            shop = shops.models.Shop.objects.get(user=request.user)
            # products = shops.models.Product.objects.filter(shop=shop).all()
        except:
            return Response({'error': "Vui lòng tạo một cửa hàng"}, status=status.HTTP_400_BAD_REQUEST)

        # total_revenue = 0
        #
        # # Doanh thu các sản phẩm
        # revenue_products = []
        # for product in products:
        #     product_order = OrderDetail.objects.filter(product=product, created_date__year=year, created_date__month__in=[(quarter-1)*3 + 1, (quarter-1)*3 + 2, (quarter-1)*3 + 3]).all()
        #     quantity_sold = product_order.aggregate(Sum('quantity'))['quantity__sum']
        #
        #     item = {
        #         'id': product.id,
        #         'name': product.name,
        #         'price': product.price,
        #         'quantity_sold': quantity_sold if quantity_sold else 0,
        #         'revenue_sold': quantity_sold * product.price if quantity_sold else 0,
        #         'year': year,
        #         'quarter': quarter
        #     }
        #     revenue_products.append(item)
        #
        #     # Doanh thu của cửa hàng
        #     total_revenue += quantity_sold * product.price if quantity_sold else 0

        # Tổng doanh thu cửa hàng
        total = OrderDetail.objects.filter(created_date__year=year, created_date__month__in=[(quarter-1)*3 + 1, (quarter-1)*3 + 2, (quarter-1)*3 + 3], product__shop=shop)\
            .aggregate(total_revenue=Sum(F('quantity') * F('unit_price')))

        #Doanh thu các sản phẩm bán chạy
        revenue_best_products = shops.models.Product.objects.filter(shop=shop)\
            .values('id', 'name', 'price')\
            .annotate(total_quantity_sold=Sum('orderdetail__quantity', filter=Q(orderdetail__created_date__year=year)&Q(orderdetail__created_date__month__in=[(quarter-1)*3 + 1,(quarter-1)*3 + 2, (quarter-1)*3 + 3])),
                      revenue_sold=Sum(F('orderdetail__quantity') * F('orderdetail__unit_price'), filter=Q(orderdetail__created_date__year=year)&Q(orderdetail__created_date__month__in=[(quarter-1)*3 + 1,(quarter-1)*3 + 2, (quarter-1)*3 + 3])))\
            .order_by('-total_quantity_sold', '-revenue_sold')

        # Doanh thu của các danh mục loại sản phẩm
        revenue_category = shops.models.Category.objects.filter(products__shop=shop)\
            .annotate(total_revenue_cate=Sum(F('products__orderdetail__unit_price') * F('products__orderdetail__quantity'),
                                        filter=Q(products__orderdetail__created_date__year=year)&Q(products__orderdetail__created_date__month__in=[(quarter-1)*3 + 1,(quarter-1)*3 + 2, (quarter-1)*3 + 3])))\
            .values('id', 'name', 'total_revenue_cate')

        data = {
            "shop_name": shop.name,
            "quarter": '{} - {}'.format(quarter, year),
            "total_revenue": total['total_revenue'] if total['total_revenue'] else 0,
            "revenue_category": revenue_category,
            "revenue_best_products": revenue_best_products
        }
        return Response(data, status=status.HTTP_200_OK)

class RevenueStatsYear(APIView):
    permission_classes = [IsSellerOrShopOwner]

    def post(self, request):
        try:
            current_year = datetime.now().year
            year_str = request.data.get('year')

            if not year_str:
                year = datetime.now().year
            elif int(year_str) > int(current_year):
                return Response({'error': ('Bạn vui lòng nhập từ năm {} trở về trước').format(current_year)}, status=status.HTTP_400_BAD_REQUEST)
            else:
                year = year_str
        except:
            return Response({'error': "Invalid year. Please use 'YYYY' format for year."}, status= status.HTTP_400_BAD_REQUEST)

        # Lấy các sản phẩm của cửa hàng người bán
        try:
            shop = shops.models.Shop.objects.get(user=request.user)
            # products = shops.models.Product.objects.filter(shop=shop).all()
        except:
            return Response({'error': "Vui lòng tạo một cửa hàng"}, status=status.HTTP_400_BAD_REQUEST)

        # total_revenue = 0

        # # Doanh thu các sản phẩm
        # revenue_products = []
        # for product in products:
        #     product_order = OrderDetail.objects.filter(product=product, created_date__year=year).all()
        #     quantity_sold = product_order.aggregate(Sum('quantity'))['quantity__sum']
        #
        #     item = {
        #         'id': product.id,
        #         'name': product.name,
        #         'price': product.price,
        #         'quantity_sold': quantity_sold if quantity_sold else 0,
        #         'revenue_sold': quantity_sold * product.price if quantity_sold else 0,
        #         'year': year
        #     }
        #     revenue_products.append(item)
        #
        #     # Doanh thu của cửa hàng
        #     total_revenue += quantity_sold * product.price if quantity_sold else 0

        # Tổng doanh thu cửa hàng
        total = OrderDetail.objects.filter(created_date__year=year, product__shop=shop)\
            .aggregate(total_revenue=Sum(F('quantity') * F('unit_price')))

        #Doanh thu các sản phẩm bán chạy
        revenue_best_products = shops.models.Product.objects.filter(shop=shop)\
            .values('id', 'name', 'price')\
            .annotate(total_quantity_sold=Sum('orderdetail__quantity', filter=Q(orderdetail__created_date__year=year)),
                      revenue_sold=Sum(F('orderdetail__quantity') * F('orderdetail__unit_price'), filter=Q(orderdetail__created_date__year=year)))\
            .order_by('-total_quantity_sold', '-revenue_sold')

        # Doanh thu của các danh mục loại sản phẩm
        revenue_category = shops.models.Category.objects.filter(products__shop=shop)\
            .annotate(total_revenue_cate=Sum(F('products__orderdetail__unit_price') * F('products__orderdetail__quantity'),
                                        filter=Q(products__orderdetail__created_date__year=year)))\
            .values('id', 'name', 'total_revenue_cate')

        data = {
            "shop_name": shop.name,
            "year": year,
            "total_revenue": total['total_revenue'] if total['total_revenue'] else 0,
            "revenue_category": revenue_category,
            "revenue_best_products": revenue_best_products
        }
        return Response(data, status=status.HTTP_200_OK)

class PaymentView(APIView):
    # permission_classes = [permissions.IsAuthenticated()]
    def post(self, request):
        # Lấy dữ liệu từ request của client
        data_amount = request.data['amount']
        order_info = request.data['order_info']
        data_redirectUrl = request.data['redirectUrl']
        data_ipnUrl = request.data['ipnUrl']
        extra_data = request.data['extraData']

        # parameters send to MoMo get get payUrl
        endpoint = "https://test-payment.momo.vn/v2/gateway/api/create"
        partnerCode = "MOMO"
        accessKey = "F8BBA842ECF85"
        secretKey = "K951B6PE1waDMi640xX08PD3vg6EkVlz"
        orderInfo = "Payment for order {}".format(order_info)
        redirectUrl = data_redirectUrl
        ipnUrl = data_ipnUrl
        amount = data_amount
        orderId = partnerCode + str(random.randint(100000, 900000))
        requestId = orderId
        requestType = "captureWallet"
        extraData = json.dumps(extra_data) # pass empty value or Encode base64 JsonString

        # before sign HMAC SHA256 with format: accessKey=$accessKey&amount=$amount&extraData=$extraData&ipnUrl=$ipnUrl
        # &orderId=$orderId&orderInfo=$orderInfo&partnerCode=$partnerCode&redirectUrl=$redirectUrl&requestId=$requestId
        # &requestType=$requestType
        rawSignature = "accessKey=" + accessKey + \
                       "&amount=" + amount + \
                       "&extraData=" + extraData + \
                       "&ipnUrl=" + ipnUrl + \
                       "&orderId=" + orderId + \
                       "&orderInfo=" + orderInfo + \
                       "&partnerCode=" + partnerCode + \
                       "&redirectUrl=" + redirectUrl + \
                       "&requestId=" + requestId + \
                       "&requestType=" + requestType

        # puts raw signature
        print("--------------------RAW SIGNATURE----------------")
        print(rawSignature)

        # signature
        h = hmac.new(bytes(secretKey, 'ascii'), bytes(rawSignature, 'ascii'), hashlib.sha256)
        signature = h.hexdigest()
        print("--------------------SIGNATURE----------------")
        print(signature)

        # json object send to MoMo endpoint

        data = {
            'partnerCode': partnerCode,
            'partnerName': "Test",
            'storeId': "MomoTestStore",
            'requestId': requestId,
            'amount': amount,
            'orderId': orderId,
            'orderInfo': orderInfo,
            'redirectUrl': redirectUrl,
            'ipnUrl': ipnUrl,
            'lang': "vi",
            'extraData': extraData,
            'requestType': requestType,
            'signature': signature
        }
        print("--------------------JSON REQUEST----------------\n")
        data = json.dumps(data)
        print(data)

        clen = len(data)
        response = requests.post(endpoint, data=data,
                                 headers={'Content-Type': 'application/json', 'Content-Length': str(clen)})
        response_data = response.json()

        # f.close()
        print("--------------------JSON response----------------\n")
        print(response_data)

        # Kiểm tra phản hồi từ Momo và trả về URL thanh toán
        pay_url = response_data['payUrl']
        if pay_url:
            print(response_data['payUrl'])
            return Response({'pay_url': pay_url, 'message': response_data['message'], 'orderId': response_data['orderId']})
        else:
            return Response({'error_message': response_data['message']}, status=400)