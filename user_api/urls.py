from django.urls import path

from user_api import views

urlpatterns = [
    path('test', views.test),
]
