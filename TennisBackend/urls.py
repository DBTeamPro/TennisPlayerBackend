from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('init/', include('load_api.urls')),
    path('match/', include('match_api.urls')),
]
