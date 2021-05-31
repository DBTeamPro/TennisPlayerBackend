from django.urls import path

from CRUD_api import controllers 

urlpatterns = [
    path('search_match', controllers.search_match),
    path('search_player', controllers.search_player),
]