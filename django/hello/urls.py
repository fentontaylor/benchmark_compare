from django.urls import include, path
from .views import hello
# from rest_framework import routers

urlpatterns = [
    path('', hello, name='hello')
]