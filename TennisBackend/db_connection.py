import pyodbc
from config import config
import json


def azure_connect(command_line):
    with pyodbc.connect(
                'DRIVER=' + config["driver"] + \
                ';SERVER='+config["server"] + \
                ';PORT=1433;DATABASE=' + config["database"] + \
                ';UID='+config["username"] + 
                ';PWD='+ config["password"]
                ) as conn:
        with conn.cursor() as cursor:
            rows = cursor.execute(command_line).fetchall()
            for row in rows:
                for x in row:
                    temp = x

            return json.loads(temp)
