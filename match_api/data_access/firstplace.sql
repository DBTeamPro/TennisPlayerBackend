SELECT M_TB.tourney_name,
	   ROUND(AVG(CAST((M_TB.w_bpFaced - M_TB.w_bpSaved)+
	   			(M_TB.l_SvGms - (M_TB.l_bpFaced - M_TB.l_bpSaved)) AS FLOAT)), 2) AS avg_lose_game_of_champ,
	   ROUND(AVG(M_TB.winner_rank), 2) AS avg_rank
FROM 
	(SELECT tourney_name, winner_rank, w_bpFaced, w_bpSaved, l_bpFaced, l_bpSaved, l_SvGms
	FROM Match2015
	WHERE tourney_level = 'G' AND match_num = 127
	UNION
	SELECT tourney_name, winner_rank, w_bpFaced, w_bpSaved, l_bpFaced, l_bpSaved, l_SvGms
	FROM Match2014
	WHERE tourney_level = 'G' AND match_num = 127
	UNION
	SELECT tourney_name, winner_rank, w_bpFaced, w_bpSaved, l_bpFaced, l_bpSaved, l_SvGms
	FROM Match2013
	WHERE tourney_level = 'G' AND match_num = 127
	UNION
	SELECT tourney_name, winner_rank, w_bpFaced, w_bpSaved, l_bpFaced, l_bpSaved, l_SvGms
	FROM Match2012
	WHERE tourney_level = 'G' AND match_num = 127
	UNION
	SELECT tourney_name, winner_rank, w_bpFaced, w_bpSaved, l_bpFaced, l_bpSaved, l_SvGms
	FROM Match2011
	WHERE tourney_level = 'G' AND match_num = 127) AS M_TB
GROUP BY M_TB.tourney_name
ORDER BY M_TB.tourney_name
FOR JSON AUTO;