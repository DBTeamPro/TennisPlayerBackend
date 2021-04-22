from django.urls import path

from load_api import views

urlpatterns = [
    path('create', views.create_table),
    path('load', views.load_data),
]
