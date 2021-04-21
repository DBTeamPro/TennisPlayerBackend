import pyodbc
from django.http.response import JsonResponse
from rest_framework import status

server = 'tennissqlserver.database.windows.net'
database = 'TennisPlayer'
username = 'tennisadmin'
password = 'tennisGG00'   
driver= '{ODBC Driver 17 for SQL Server}'


def test(request):
    with pyodbc.connect('DRIVER='+driver+';SERVER='+server+';PORT=1433;DATABASE='+database+';UID='+username+';PWD='+ password) as conn:
        with conn.cursor() as cursor:
            cursor.execute("SOURCE create_table.sql")
            row = cursor.fetchone()
            while row:
                print (str(row[0]) + " " + str(row[1]))
                row = cursor.fetchone()
    return JsonResponse({'message': 'OK'}, status=status.HTTP_200_OK)