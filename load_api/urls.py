from django.urls import path

from load_api import controllers

urlpatterns = [
    path('create', controllers.create_table),
    path('load', controllers.load_data),
]
