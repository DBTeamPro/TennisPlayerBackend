from os import stat
import pyodbc
from django.http.response import JsonResponse
from rest_framework import status
from TennisBackend.db_connection import azure_connect
from config import config

def get_rank_analysis(request):
    file = open("match_api/data_access/rank.sql")
    line = file.read().replace("\n", " ")
    rank_result = azure_connect(line)
    return JsonResponse(rank_result, status=status.HTTP_200_OK)

def get_seed_analysis(request):
    file = open("match_api/data_access/seed.sql")
    line = file.read().replace("\n", " ")
    seed_result = azure_connect(line)
    return JsonResponse(seed_result, status=status.HTTP_200_OK, safe=False)
