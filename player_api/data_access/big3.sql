select table1.name, table1.age, table1.country, table1.champ_G, table1.champ_M, table1.champ_A, concat(table1.win, '-',table2.lose) as win_lose
from
(select winner_name as name, round(avg(winner_age),0) as age, winner_ioc as country,
	   SUM(CASE
	   		WHEN tourney_level = 'G' and 
	   			match_num = 127 and (winner_name like 'Novak D%' or winner_name like 'Roger Federer' or winner_name like 'Rafael Nadal')
	   		THEN 1 ELSE 0 END) as champ_G,
	   	SUM((CASE
	   		WHEN tourney_level = 'M' and 
	   			draw_size = 96 and match_num = 95 and (winner_name like 'Novak D%' or winner_name like 'Roger Federer' or winner_name like 'Rafael Nadal')
	   		THEN 1 ELSE 0 END) + 
	   		(CASE
	   		WHEN tourney_level = 'M' and 
	   			draw_size = 56 and match_num = 55 and (winner_name like 'Novak D%' or winner_name like 'Roger Federer' or winner_name like 'Rafael Nadal')
	   		THEN 1 ELSE 0 END) + 
	   		(CASE
	   		WHEN tourney_level = 'M' and 
	   			draw_size = 48 and match_num = 47 and (winner_name like 'Novak D%' or winner_name like 'Roger Federer' or winner_name like 'Rafael Nadal')
	   		THEN 1 ELSE 0 END)) as champ_M,
	   	SUM((CASE
	   		WHEN tourney_level = 'A' and 
	   			draw_size = 56 and match_num = 55 and (winner_name like 'Novak D%' or winner_name like 'Roger Federer' or winner_name like 'Rafael Nadal')
	   		THEN 1 ELSE 0 END) + 
	   		(CASE
	   		WHEN tourney_level = 'A' and 
	   			draw_size = 48 and match_num = 47 and (winner_name like 'Novak D%' or winner_name like 'Roger Federer' or winner_name like 'Rafael Nadal')
	   		THEN 1 ELSE 0 END) + 
	   		(CASE
	   		WHEN tourney_level = 'A' and 
	   			draw_size = 32 and match_num = 31 and (winner_name like 'Novak D%' or winner_name like 'Roger Federer' or winner_name like 'Rafael Nadal')
	   		THEN 1 ELSE 0 END) + 
	   		(CASE
	   		WHEN tourney_level = 'A' and 
	   			draw_size = 28 and match_num = 27 and (winner_name like 'Novak D%' or winner_name like 'Roger Federer' or winner_name like 'Rafael Nadal')
	   		THEN 1 ELSE 0 END)) as champ_A,
	   	SUM(CASE
	   		WHEN (winner_name like 'Novak D%' or winner_name like 'Roger Federer' or winner_name like 'Rafael Nadal')
	   		THEN 1 ELSE 0 END) as win

from Match2014
where winner_name like 'Novak D%' or winner_name like 'Roger Federer' or winner_name like 'Rafael Nadal'
group by winner_name, winner_ioc) as table1,
(select	loser_name as name,  	
	   	SUM(CASE
	   		WHEN (loser_name like 'Novak D%' or loser_name like 'Roger Federer' or loser_name like 'Rafael Nadal')
	   		THEN 1 ELSE 0 END) as lose
from Match2014
where loser_name like 'Novak D%' or loser_name like 'Roger Federer' or loser_name like 'Rafael Nadal'
group by loser_name) as table2
where table1.name = table2.name
FOR JSON AUTO;
