from django.urls import path

from player_api import controllers 

urlpatterns = [
    path('num_of_matches', controllers.get_num_of_matches_analysis),
    path('match_time', controllers.get_match_time_analysis),
    path('hand', controllers.get_hand_analysis),
    path('big3', controllers.get_big3_analysis),
    path('height', controllers.get_height_analysis),
]