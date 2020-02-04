from django.urls import path
from .views import Olympians

urlpatterns = [
    path('olympians/', Olympians.as_view(), name="olympians-all")
]
