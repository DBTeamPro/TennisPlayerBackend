from os import stat
from django.http.response import JsonResponse
from rest_framework import status
from TennisBackend.db_connection import azure_connect
from config import config

def get_rank_analysis(request):
    file = open("match_api/data_access/rank.sql")
    line = file.read().replace("\n", " ")
    rank_result = azure_connect(line)
    return JsonResponse(rank_result, status=status.HTTP_200_OK, safe=False)

def get_seed_analysis(request):
    file = open("match_api/data_access/seed.sql")
    line = file.read().replace("\n", " ")
    seed_result = azure_connect(line)
    return JsonResponse(seed_result, status=status.HTTP_200_OK, safe=False)

def get_point_analysis(request):
    file = open("match_api/data_access/point.sql")
    line = file.read().replace("\n", " ")
    goal_result = azure_connect(line)
    return JsonResponse(goal_result, status=status.HTTP_200_OK, safe=False)

def get_underdog_analysis(request):
    file = open("match_api/data_access/underdog.sql")
    line = file.read().replace("\n", " ")
    underdog_result = azure_connect(line)
    return JsonResponse(underdog_result, status=status.HTTP_200_OK, safe=False)

def get_firstplace_analysis(request):
    file = open("match_api/data_access/firstplace.sql")
    line = file.read().replace("\n", " ")
    firstplace_result = azure_connect(line)
    return JsonResponse(firstplace_result, status=status.HTTP_200_OK, safe=False)

