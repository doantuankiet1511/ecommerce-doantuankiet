from rest_framework import pagination

class ProductPaginator(pagination.PageNumberPagination):
    page_size = 9

class ProductShopPaginator(pagination.PageNumberPagination):
    page_size = 10
