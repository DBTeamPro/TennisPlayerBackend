from django.urls import path

from match_api import views

urlpatterns = [
    path('rank', views.get_rank_analysis),
    path('seed', views.get_seed_analysis),
]