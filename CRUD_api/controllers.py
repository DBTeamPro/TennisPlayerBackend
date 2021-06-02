from os import stat
from django.http.response import Http404, JsonResponse
from rest_framework import status
from TennisBackend.db_connection import azure_exe, azure_parse_gotten_data, azure_parse_small_matches
from config import config
import json
from rest_framework.parsers import JSONParser
from rest_framework.decorators import api_view

@api_view(['GET'])
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

@api_view(['GET'])
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

@api_view(['GET'])
def get_all_my_match(request):
    line = "SELECT * FROM MyMatch;"
    my_match_result = azure_parse_small_matches(line)
    return JsonResponse(my_match_result, status=status.HTTP_200_OK, safe=False)

@api_view(['POST'])
def create_match(request):
    dic = JSONParser().parse(request)
    match = 'MyMatch' + ' '

    # string manipulate
    col_name = '('
    parameter = '('
    for i in dic.keys():
        if i == list(dic.keys())[-1]:
            col_name += (i + ') ')
            parameter += (str(dic[i]) + ');')
        else:
            col_name += (i + ', ')
            if isinstance(dic[i], int):
                parameter += (str(dic[i]) + ', ')
            else:
                parameter += ("'" + dic[i] + "'" + ", ")

    # syntax
    insert = 'INSERT INTO '
    values = 'VALUES ' 

    # contact
    line = insert + match + col_name + values + parameter
    azure_exe(line)

    return JsonResponse({"message": "Match created!"}, status=status.HTTP_201_CREATED)

@api_view(['PUT'])
def update_match(request, id):
    # given json
    dic_parameter = JSONParser().parse(request)
    match = 'MyMatch' + ' '

    # string manipulate
    parameter = 'SET '
    for i in dic_parameter.keys():
        if i == list(dic_parameter.keys())[-1]:
            if isinstance(dic_parameter[i], int):
                parameter += (i + ' = ' + str(dic_parameter[i]) + ' ')
            else:
                parameter += (i + " = '" + dic_parameter[i] + "' ")
        else:
            if isinstance(dic_parameter[i], int):
                parameter += (i + ' = ' + str(dic_parameter[i]) + ', ')
            else:
                parameter += (i + " = '" + dic_parameter[i] + "', ")

    condition = 'WHERE id=' + str(id) + ";"

    # syntax
    update = 'UPDATE '

    # contact
    line = update + match + parameter + condition
    azure_exe(line)
    return JsonResponse({"message": "Update successful!"}, status=status.HTTP_200_OK, safe=False)

@api_view(['DELETE'])
def delete_match(request, id):
    line = "DELETE FROM MyMatch WHERE id=" + str(id) + ";"
    azure_exe(line)
    return JsonResponse({"message": "Delete successful!"}, status=status.HTTP_200_OK, safe=False)