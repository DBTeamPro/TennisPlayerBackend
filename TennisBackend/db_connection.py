import pyodbc
from config import config
import json

def azure_exe(command_line):
    with pyodbc.connect(
                'DRIVER=' + config["driver"] + \
                ';SERVER='+config["server"] + \
                ';PORT=1433;DATABASE=' + config["database"] + \
                ';UID='+config["username"] + 
                ';PWD='+ config["password"]
                ) as conn:
        with conn.cursor() as cursor:
            cursor.execute(command_line)
   

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

def azure_parse_gotten_data(command_line):
   with pyodbc.connect(
                'DRIVER=' + config["driver"] + \
                ';SERVER='+config["server"] + \
                ';PORT=1433;DATABASE=' + config["database"] + \
                ';UID='+config["username"] + 
                ';PWD='+ config["password"]
                ) as conn:
        with conn.cursor() as cursor:
            rows = cursor.execute(command_line).fetchall()
            data = []
            for row in rows:
                temp = {}
                temp["tourney_date"] = row.tourney_date
                temp["tourney_name"] = row.tourney_name
                temp["tourney_level"] = row.tourney_level
                temp["surface"] = row.surface
                temp["winner_seed"] = row.winner_seed
                temp["winner_name"] = row.winner_name
                temp["loser_seed"] = row.loser_seed
                temp["loser_name"] = row.loser_name
                temp["score"] = row.score
                temp["round"] = row.round
                temp["minutes"] = row.minutes
                data.append(temp)
            return data








