import pyodbc
from django.http.response import JsonResponse
from rest_framework import status
import bcpy
from TennisBackend.db_connection import azure_connect
from config import config

def create_table(request):
    file = open("load_api/data_access/create_table.sql")
    line = file.read().replace("\n", " ")
    azure_connect(line)

    return JsonResponse({'message': 'Table created successfully.'}, status=status.HTTP_200_OK)

def load_data(request):
    sql_config = {
        'server': config["server"],
        'database': config["database"],
        'username': config["username"],
        'password': config["password"],
    }
    sql_table_name = 'Match2001'
    csv_file_path = 'load_api/files/2001.csv'
    flat_file = bcpy.FlatFile(qualifier='', path=csv_file_path)
    sql_table = bcpy.SqlTable(sql_config, table=sql_table_name)
    flat_file.to_sql(sql_table)
    return JsonResponse({'message': 'Data loaded successfully.'}, status=status.HTTP_200_OK)