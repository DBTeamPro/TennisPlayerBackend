from os import stat
from django.http.response import JsonResponse
from rest_framework import status
from TennisBackend.db_connection import azure_parse_gotten_data
from config import config
import json
from rest_framework.parsers import JSONParser


def search_match(request):
    # user will enter 2011(year) 5(month)
    year = request.GET['year']
    month = request.GET['month']

    # syntax
    select = 'SELECT * FROM '
    match = 'Match' + year + ' '
    where = "WHERE tourney_date like " + "'" + year + month + "%'"

    # result string
    line = select + match + where + ";"

    search_matches_result = azure_parse_gotten_data(line)
    return JsonResponse(search_matches_result, status=status.HTTP_200_OK, safe=False)

def search_player(request):
    # user will enter: 2011(year) Novak Djokovic(name)
    year = request.GET['year']
    name = request.GET['name']

    # syntax
    select = 'SELECT * FROM '
    match = 'Match' + year + ' '
    where = "WHERE winner_name = " + "'" + name + "' OR loser_name = " + "'" + name + "';"

    # result string
    line = select + match + where

    search_matches_result = azure_parse_gotten_data(line)
    return JsonResponse(search_matches_result, status=status.HTTP_200_OK, safe=False)
