from os import stat
import pyodbc
from django.http.response import JsonResponse
from rest_framework import status
from TennisBackend.db_connection import azure_connect
from config import config

def get_num_of_matches_analysis(request):
    file = open("player_api/data_access/num_of_matches.sql")
    line = file.read().replace("\n", " ")
    num_of_matches_result = azure_connect(line)
    return JsonResponse(num_of_matches_result, status=status.HTTP_200_OK, safe=False)

def get_match_time_analysis(request):
    file = open("player_api/data_access/match_time.sql")
    line = file.read().replace("\n", " ")
    match_time_result = azure_connect(line)
    return JsonResponse(match_time_result, status=status.HTTP_200_OK, safe=False)

def get_hand_analysis(request):
    file = open("player_api/data_access/hand.sql")
    line = file.read().replace("\n", " ")
    hand_result = azure_connect(line)
    return JsonResponse(hand_result, status=status.HTTP_200_OK, safe=False)

def get_big3_analysis(request):
    file = open("player_api/data_access/big3.sql")
    line = file.read().replace("\n", " ")
    big3_result = azure_connect(line)
    return JsonResponse(big3_result, status=status.HTTP_200_OK, safe=False)

def get_height_analysis(request):
    file = open("player_api/data_access/height.sql")
    line = file.read().replace("\n", " ")
    print(line)
    height_result = azure_connect(line)
    return JsonResponse(height_result, status=status.HTTP_200_OK, safe=False)