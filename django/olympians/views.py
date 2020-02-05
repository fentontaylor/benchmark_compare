from django.shortcuts import render
from .models import Olympian
from .serializers import OlympiansSerializer
from rest_framework import generics

class Olympians(generics.ListAPIView):
    queryset = Olympian.objects.all()
    serializer_class = OlympiansSerializer
