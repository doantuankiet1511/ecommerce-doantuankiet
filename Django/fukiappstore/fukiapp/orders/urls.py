from . import views
from rest_framework import routers
from django.urls import path, include

router = routers.DefaultRouter()
router.register('payment-methods', views.PaymentMethodViewSet)
router.register('orders', views.OrderViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('revenue-stats-month/', views.RevenueStatsMonth.as_view(), name='revenue-stats-month'),
    path('revenue-stats-quarter/', views.RevenueStatsQuarter.as_view(), name='revenue-stats-quarter'),
    path('revenue-stats-year/', views.RevenueStatsYear.as_view(), name='revenue-stats-quarter'),
    path('payment/', views.PaymentView.as_view(), name='payment')
]