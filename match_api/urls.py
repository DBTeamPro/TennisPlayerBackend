from django.urls import path

from match_api import controllers

urlpatterns = [
    path('rank', controllers.get_rank_analysis),
    path('seed', controllers.get_seed_analysis),
    path('point', controllers.get_point_analysis),
    path('underdog', controllers.get_underdog_analysis),
    path('firstplace', controllers.get_firstplace_analysis),
]