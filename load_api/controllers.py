from os import curdir
from typing import Counter
import pyodbc
from django.http.response import JsonResponse
from rest_framework import status
from TennisBackend.db_connection import azure_exe
from config import config
import pandas as pd

COLUMN = ['tourney_id','tourney_name','surface','draw_size','tourney_level','tourney_date','match_num','winner_id','winner_seed','winner_entry','winner_name','winner_hand','winner_ht','winner_ioc','winner_age','winner_rank','winner_rank_points','loser_id','loser_seed','loser_entry','loser_name','loser_hand','loser_ht','loser_ioc','loser_age','loser_rank','loser_rank_points','score','best_of','round','minutes','w_ace','w_df','w_svpt','w_1stIn','w_1stWon','w_2ndWon','w_SvGms','w_bpSaved','w_bpFaced','l_ace','l_df','l_svpt','l_1stIn','l_1stWon','l_2ndWon','l_SvGms','l_bpSaved','l_bpFaced']

def create_table(request):
    file = open("load_api/data_access/create_table.sql")
    line = file.read().replace("\n", " ")
    azure_exe(line)

    return JsonResponse({'message': 'Table created successfully.'}, status=status.HTTP_200_OK)

def load_data(request):
    conn = pyodbc.connect(
                'DRIVER=' + config["driver"] + \
                ';SERVER=' + config["server"] + \
                ';PORT=1433;DATABASE=' + config["database"] + \
                ';UID=' + config["username"] + 
                ';PWD=' + config["password"]
                )

    data = pd.read_csv (r'load_api/files/2015.csv')   
    df = pd.DataFrame(data, columns = COLUMN)
    df = df.fillna(0)
    print(df)

    cursor = conn.cursor()
    t = 0
    for row in df.itertuples():
        t += 1
        print(t)
        cursor.execute('''
                    INSERT INTO Match2015 (tourney_id,tourney_name,surface,draw_size,tourney_level,tourney_date,match_num,
                    winner_id,winner_seed,winner_entry,winner_name,winner_hand,winner_ht,winner_ioc,winner_age,winner_rank,
                    winner_rank_points,loser_id,loser_seed,loser_entry,loser_name,loser_hand,loser_ht,loser_ioc,loser_age,loser_rank,
                    loser_rank_points,score,best_of,round,minutes,w_ace,w_df,w_svpt,w_1stIn,w_1stWon,w_2ndWon,w_SvGms,w_bpSaved,w_bpFaced,
                    l_ace,l_df,l_svpt,l_1stIn,l_1stWon,l_2ndWon,l_SvGms,l_bpSaved,l_bpFaced)
                    VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
                    ''',
                    row.tourney_id,row.tourney_name,row.surface,row.draw_size,
                    row.tourney_level,row.tourney_date,row.match_num,row.winner_id,
                    row.winner_seed,row.winner_entry,row.winner_name,row.winner_hand,
                    row.winner_ht,row.winner_ioc,row.winner_age,row.winner_rank,row.winner_rank_points,
                    row.loser_id,row.loser_seed,row.loser_entry,row.loser_name,row.loser_hand,
                    row.loser_ht,row.loser_ioc,row.loser_age,row.loser_rank,row.loser_rank_points,
                    row.score,row.best_of,row.round,row.minutes,row.w_ace,row.w_df,row.w_svpt,
                    row.w_1stIn,row.w_1stWon,row.w_2ndWon,row.w_SvGms,row.w_bpSaved,row.w_bpFaced,
                    row.l_ace,row.l_df,row.l_svpt,row.l_1stIn,row.l_1stWon,row.l_2ndWon,row.l_SvGms,
                    row.l_bpSaved,row.l_bpFaced
                    )
    conn.commit()
    return JsonResponse({'message': 'Data loaded successfully.'}, status=status.HTTP_200_OK)