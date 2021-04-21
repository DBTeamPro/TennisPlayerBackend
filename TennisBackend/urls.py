from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('user/', include('user_api.urls')),
]
