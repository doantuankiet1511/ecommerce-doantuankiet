import json

from rest_framework import viewsets, generics, permissions, status
from rest_framework.decorators import action
from rest_framework.views import Response
from rest_framework.filters import OrderingFilter

from .models import User, Category, Shop, Product, Tag, Comment, Review, Notification, Like
from .serializers import (
    UserSerializer, ConfirmUserSerializer,
    CategorySerializer,
    ShopSerializer, ShopDetailSerializer,
    ProductSerializer, ProductDetailSerializer, ProductUpdateNoTagSerializer, AuthorizedProductDetailSerializer,
    CommentSerializer, UpdateCommentSerializer,
    ReviewSerializer,
    NotificationSerializer,
    LikeSerializer,
    ChangePasswordSerializer, WishListProductSerializer
)
from .paginators import ProductPaginator, ProductShopPaginator
from .permis import IsSellerOrShopOwner, IsSuperAdminOrEmployee, ProductOwner, CommentOwner, ReviewOwner
from django.db import IntegrityError
from rest_framework.exceptions import ValidationError
from django.db.models import Q
import orders
# Create your views here.

class UserViewSet(viewsets.ViewSet, generics.CreateAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer

    def get_serializer_class(self):
        if self.action in ['list-confirm-register', 'confirm']:
            return ConfirmUserSerializer
        elif self.action in ['shop']:
            return ShopDetailSerializer
        elif self.action in ['notifications']:
            return NotificationSerializer
        return self.serializer_class

    def get_permissions(self):
        if self.action in ['current-user', 'change_password', 'notifications', 'wishlist']:
            return [permissions.IsAuthenticated()]
        elif self.action in ['list_confirm_register', 'confirm']:
            return [IsSuperAdminOrEmployee()]
        elif self.action in ['my-shop']:
            return [IsSellerOrShopOwner()]
        return [permissions.AllowAny()]

    @action(methods=['get', 'put'], detail=False, url_path='current-user')
    def current_user(self, request):
        u = request.user
        if request.method.__eq__('PUT'):
            for k, v in request.data.items():
                setattr(u, k, v)
            u.save()
        return Response(UserSerializer(u).data)

    @action(methods=['post'], detail=False, url_path='change-password')
    def change_password(self, request):
        u = request.user
        serializer = ChangePasswordSerializer(data=request.data)
        try:
            if serializer.is_valid():
                old_password = serializer.validated_data['old_password']
                new_password = serializer.validated_data['new_password']
                if not u.check_password(old_password):
                    return Response({'message': 'Mật khẩu cũ không đúng!'}, status=status.HTTP_400_BAD_REQUEST)
                elif old_password == new_password:
                    return Response({'message': 'Mật khẩu mới bị trùng với mật khẩu cũ'}, status=status.HTTP_400_BAD_REQUEST)
                else:
                    u.set_password(new_password)
                    u.save()
                    return Response({'message': 'Mật khẩu đã thay đổi thành công.'}, status=status.HTTP_200_OK)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['get'], detail=False, url_path='notifications')
    def notifications(self, request):
        notifications = Notification.objects.filter(recipient=request.user.id)
        return Response(NotificationSerializer(notifications, many=True).data)

    @action(methods=['get'], detail=False, url_path='list-confirm-register')
    def list_confirm_register(self, request):
        u = User.objects.filter(role='Seller', is_verified=False)
        return Response(ConfirmUserSerializer(u, many=True).data)

    @action(methods=['patch'], detail=True, url_path='confirm')
    def confirm(self, request, pk):
        # u = request.user
        u = User.objects.get(pk=pk)
        if u.is_verified is False:
            u.is_verified = True
        else:
            return Response({'error': 'Tài khoản này đã xác nhận.'}, status=status.HTTP_400_BAD_REQUEST)
        u.save()

        notice = Notification(sender=request.user.id, content="Đã xác nhận tài khoản {} thành công.".format(u.username),
                              recipient=User.objects.filter(pk=pk).first())
        notice.save()
        return Response(ConfirmUserSerializer(u).data)

    @action(methods=['get'], detail=False, url_path='my-shop')
    def shop(self, request):
        try:
            shop = Shop.objects.filter(user=request.user).get()
            products = shop.product_set.filter(is_active=True)

            paginator = ProductShopPaginator()
            page = paginator.paginate_queryset(products, request)

            data = {
                'shop': ShopDetailSerializer(shop).data,
                'products': ProductDetailSerializer(page, many=True).data
            }

            return paginator.get_paginated_response(data)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['get'], detail=False, url_path='wish-list')
    def wishlist(self, request):
        user = request.user
        likeproduct = Like.objects.filter(user=user, liked=True)
        return Response(WishListProductSerializer(likeproduct, many=True).data)

    @action(methods=['get'], detail=False, url_path='orders')
    def orders(self, request):
        user = request.user
        if user:
            try:
                if user.is_superuser or user.role == 'Employee':
                    order = orders.models.Order.objects.all()
                else:
                    order = orders.models.Order.objects.filter(user=user)
                return Response(orders.serializers.OrderBaseSerializer(order, many=True).data)
            except:
                return Response({'error': 'Hệ thống đang bảo trì'}, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({'error': 'Bạn cần phải đăng nhập!!!'}, status=status.HTTP_400_BAD_REQUEST)

class CategoryViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer

class ShopViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView, generics.CreateAPIView, generics.UpdateAPIView, generics.DestroyAPIView):
    queryset = Shop.objects.filter(is_active=True)
    serializer_class = ShopSerializer

    def get_serializer_class(self):
        if self.action in ['retrieve']:
            return ShopDetailSerializer
        elif self.action in ['products']:
            return ProductSerializer
        return self.serializer_class

    def get_permissions(self):
        if self.action in ['create', 'update', 'partial_update', 'destroy']:
            return [IsSellerOrShopOwner()]
        return [permissions.AllowAny()]

    def create(self, request, *args, **kwargs):
        data = request.data
        user = request.user
        checkshop = Shop.objects.filter(user=user).exists()
        if checkshop:
            return Response({'error': 'Bạn đã sở hữu cửa hàng rồi'}, status=status.HTTP_400_BAD_REQUEST)
        else:
            # avatar = data['avatar']
            avatar = request.FILES.get('avatar', None)
            if not avatar:
                avatar = "/default/local-store_kj6ybp.png"
            if user.is_verified:
                shop = Shop.objects.create(name=data['name'], description=data['description'], avatar=avatar, user_id=user.id)
        return Response(ShopSerializer(shop).data)

    def destroy(self, request, *args, **kwargs):
        s = self.get_object()
        products = s.product_set.all()

        if products.exists():
            error_message = "Bạn không thể xóa cửa hàng này do bạn đang có {} sản phẩm.".format(products.count())
            return Response({'error': error_message}, status=status.HTTP_400_BAD_REQUEST)

        self.perform_destroy(s)
        return Response({'message': "Bạn đã xóa cửa hàng thành công"}, status=status.HTTP_204_NO_CONTENT)


    @action(methods=['get'], detail=True, url_path='products')
    def products(self, request, pk):
        # s = Shop.objects.get(pk=pk)
        shop = self.get_object()
        products = shop.product_set.filter(is_active=True)

        paginator = ProductPaginator()
        page = paginator.paginate_queryset(products, request)

        # data = {
        #     'shop': ShopDetailSerializer(shop).data,
        #     'products': ProductSerializer(page, many=True).data
        # }

        return paginator.get_paginated_response(ProductSerializer(page, many=True).data)


class ProductViewSet(viewsets.ViewSet, generics.ListAPIView, generics.CreateAPIView, generics.RetrieveAPIView, generics.UpdateAPIView, generics.DestroyAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductDetailSerializer
    pagination_class = ProductPaginator

    # Sắp xếp tăng giảm
    filter_backends = [OrderingFilter]
    ordering_fields = ['name', 'price']

    def get_serializer_class(self):
        if self.request.user.is_authenticated:
            return AuthorizedProductDetailSerializer
        elif self.action.__eq__('list'):
            return ProductSerializer
        elif self.action.__eq__('update'):
            return ProductUpdateNoTagSerializer
        elif self.action in ['comments']:
            return CommentSerializer
        return self.serializer_class

    def get_permissions(self):
        if self.action in ['create', 'update', 'partial_update', 'destroy', 'updated_tags']:
            return [ProductOwner()]
        elif self.action in ['like', 'comments', 'reviews'] and self.request.method == 'POST':
            return [permissions.IsAuthenticated()]
        return [permissions.AllowAny()]

    def get_queryset(self):
        q = self.queryset

        # Search: keyword
        kw = self.request.query_params.get('kw')
        if kw:
            q = q.filter(name__icontains=kw)

        # Search: shop
        shop_n = self.request.query_params.get('shop_name')
        if shop_n:
            q = q.filter(shop__name__icontains=shop_n)

        # Search:  category
        cate_id = self.request.query_params.get('category_id')
        if cate_id:
            q = q.filter(category_id=cate_id)

        # Search: min_max_price
        min_p = self.request.query_params.get('min_price')
        max_p = self.request.query_params.get('max_price')
        if min_p:
            q = q.filter(price__gte=min_p)
        if max_p:
            q = q.filter(price__lte=max_p)

        return q

    def create(self, request, *args, **kwargs):
        data = request.data
        tags = json.loads(data['tags'])
        try:
            category = Category.objects.get(id=data['category'])
            shop = Shop.objects.filter(user=request.user).first()
            product = Product(
                name=data['name'],
                price=data['price'],
                image=data['image'],
                description=data['description'],
                category=category,
                shop=shop
            )
            product.save()
        except IntegrityError:
            return Response({'error': 'Sản phẩm đã tồn tại trong cửa hàng.'}, status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response({'error': 'Bạn cần phải nhập đầy đủ thông tin'}, status=status.HTTP_400_BAD_REQUEST)

        for t in tags:
            tag, _ = Tag.objects.get_or_create(name=t)
            product.tags.add(tag)
        product.save()

        return Response(ProductDetailSerializer(product).data, status=status.HTTP_201_CREATED)

    def partial_update(self, request, *args, **kwargs):
        product = self.get_object()
        try:
            for k, v in request.data.items():
                if k == 'category':
                    # product.category_id = int(v)
                    v = Category.objects.get(id=v)
                setattr(product, k, v)
            product.save()
        except IntegrityError:
            return Response({'error': 'Sản phẩm đã tồn tại trong cửa hàng.'}, status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response({'error': 'Cập nhật sản phẩm không thành công.'}, status=status.HTTP_400_BAD_REQUEST)
        return Response(ProductUpdateNoTagSerializer(product).data)

    @action(methods=['get'], detail=True, url_path='related-products')
    def related_products(self, request, pk):
        product_current = self.get_object()
        related_products = Product.objects.filter(Q(name__icontains=product_current.name) & ~Q(shop__id=product_current.shop.id))

        return Response(ProductSerializer(related_products, many=True).data)

    @action(methods=['get'], detail=False, url_path='compare-product')
    def compare_product(self, request):
        products = self.queryset
        # cate_id = self.request.query_params.get('category_id')
        product1_id = self.request.query_params.get('product1')
        product2_id = self.request.query_params.get('product2')

        # if cate_id:
        #     products = products.filter(category_id=cate_id)

        if product1_id:
            product1 = products.filter(id=product1_id).first()
        else:
            return Response({'error': 'Vui lòng chọn sản phẩm để so sánh!'})

        if product2_id:
            product2 = products.filter(id=product2_id).first()
        else:
            return Response({'product1': ProductDetailSerializer(product1).data,
                             'error': 'Vui lòng chọn sản phẩm thứ 2 để so sánh!'})

        if product1.category.id != product2.category.id:
            return Response({'product1': ProductDetailSerializer(product1).data,
                             'error': 'Sản phẩm thứ 2 phải cùng loại! Vui lòng chọn sản phẩm khác!'})
        else:
            data = {
                'product1': ProductDetailSerializer(product1).data,
                'product2': ProductDetailSerializer(product2).data
            }
            return Response(data)

    @action(methods=['put'], detail=True, url_path='updated-tags')
    def updated_tags(self, request, pk):
        product = self.get_object()
        product.tags.clear()
        try:
            tags = request.data['tags']
            for t in tags:
                tag, _ = Tag.objects.get_or_create(name=t)
                product.tags.add(tag)
            product.save()
        except:
            return Response({'error': 'Trong sản phẩm không có tag'}, status=status.HTTP_400_BAD_REQUEST)
        return Response(ProductDetailSerializer(product).data)

    # @action(methods=['post'], detail=True, url_path='assign-tags')
    # def assign_tags(self, request, pk):
    #     product = self.get_object()
    #     tags = request.data['tags']
    #
    #     for t in tags:
    #         tag, _ = Tag.objects.get_or_create(name=t)
    #         product.tags.add(tag)
    #     product.save()
    #
    #     return Response(ProductDetailSerializer(product).data)

    # @action(methods=['put'], detail=True, url_path='remove-tags')
    # def remove_tag(self, request, pk):
    #     product = self.get_object()
    #     try:
    #         tag = request.data['tags']
    #         tag_name = Tag.objects.get(name=tag)
    #     except:
    #         return Response({'error': 'Trong sản phẩm không có tag'}, status=status.HTTP_400_BAD_REQUEST)
    #     product.tags.remove(tag_name)
    #
    #     return Response(ProductDetailSerializer(product).data)

    # @action(methods=['put'], detail=True, url_path='remove-all-tags')
    # def remove_tags(self, request, pk):
    #     product = self.get_object()
    #     product.tags.clear()
    #     return Response(ProductDetailSerializer(product).data)

    @action(methods=['post'], detail=True, url_path='like')
    def like(self, request, pk):
        l, created = Like.objects.get_or_create(product=self.get_object(), user=request.user)
        if not created:
            l.liked = not l.liked
        l.save()

        return Response(LikeSerializer(l).data)

    @action(methods=['post', 'get'], detail=True, url_path='comments')
    def comments(self, request, pk):
        product = self.get_object()

        if request.method.__eq__('GET'):
            comments = product.comment_set.filter(reply_to=None, is_active=True)
            return Response(CommentSerializer(comments, many=True).data)

        if request.method.__eq__('POST'):
            content = request.data['content']
            if content:
                comment = Comment(content=content, product=product, user=request.user)
                comment.save()
                return Response(CommentSerializer(comment).data, status=status.HTTP_201_CREATED)
            return Response({'error': 'Bạn cần phải nhập bình luận'}, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['post', 'get'], detail=True, url_path='reviews')
    def reviews(self, request, pk):
        product = self.get_object()

        if request.method.__eq__('GET'):
            reviews = product.review_set.filter(is_active=True)
            return Response(ReviewSerializer(reviews, many=True).data)

        if request.method.__eq__('POST'):
            rating = int(request.data['rate'])
            if rating >= 0 and rating <=5:
                try:
                    rating = rating
                    content = request.data['content']
                except:
                    return Response({'error': 'Bạn cần phải chọn rate và nhập nội dung'}, status=status.HTTP_400_BAD_REQUEST)
                else:
                    review, _ = Review.objects.get_or_create(product=product, user=request.user)
                    review.rate = rating
                    review.content = content
                    review.save()
                    return Response(ReviewSerializer(review).data, status=status.HTTP_201_CREATED)
            else:
                return Response({'error': 'Giá trị rate phải nằm trong khoảng từ 0 đến 5'}, status=status.HTTP_400_BAD_REQUEST)

class CommentViewSet(viewsets.ViewSet, generics.UpdateAPIView, generics.DestroyAPIView, generics.RetrieveAPIView):
    queryset = Comment.objects.filter(is_active=True)
    serializer_class = CommentSerializer
    # permission_classes = [CommentOwner,]

    def get_serializer_class(self):
        if self.action in ['update', 'partial_update']:
            return UpdateCommentSerializer
        return self.serializer_class

    def get_permissions(self):
        if self.action in ['update', 'partial_update']:
            return [CommentOwner()]
        elif self.action in ['destroy']:
            return [CommentOwner()]
        elif self.action in ['reply_comment']:
            return [permissions.IsAuthenticated()]
        return [permissions.AllowAny()]

    @action(methods=['post'], detail=True, url_path='reply-comment')
    def reply_comment(self, request, pk):
        reply_to = self.get_object()
        content = request.data['content']
        if content:
            comment = Comment(content=request.data['content'], product=reply_to.product, user=request.user, reply_to=reply_to)
            comment.save()
            return Response(CommentSerializer(comment).data, status=status.HTTP_201_CREATED)
        return Response({'error': 'Bạn cần phải nhập bình luận'}, status=status.HTTP_400_BAD_REQUEST)


class ReviewViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Review.objects.filter(is_active=True)
    serializer_class = ReviewSerializer
