from django.urls import path

from CRUD_api import controllers 

urlpatterns = [
    path('search_match', controllers.search_match),
    path('search_player', controllers.search_player),
    path('create', controllers.create_match),
    path('small_matches', controllers.get_all_my_match),
    path('update/<slug:id>', controllers.update_match),
    path('delete/<slug:id>', controllers.delete_match),
]