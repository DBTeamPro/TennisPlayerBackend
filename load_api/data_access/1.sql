SELECT M_TB.tourney_name,
	   # rank_diff < 20
	   ROUND(
	   AVG(CASE 
	   		WHEN ABS(M_TB.winner_rank-M_TB.loser_rank) < 20 AND
	   			 M_TB.minutes IS NOT NULL AND M_TB.winner_rank IS NOT NULL AND M_TB.loser_rank IS NOT NULL
	   		THEN M_TB.minutes END), 2) AS rank_diff20,
	   
	   ROUND(
	   SUM(CASE 
	   		WHEN ABS(M_TB.winner_rank-M_TB.loser_rank) < 20 AND
	   			 (M_TB.winner_rank > M_TB.loser_rank)AND 
	   			 M_TB.winner_rank IS NOT NULL AND M_TB.loser_rank IS NOT NULL
	   		THEN 1 ELSE 0 END)/
	   SUM(CASE
	   		WHEN ABS(M_TB.winner_rank-M_TB.loser_rank) < 20
	   		THEN 1 ELSE 0 END), 2) AS low_rank_win,

	   # rank_diff 20~50
	   ROUND(
	   AVG(CASE 
	   		WHEN ABS(M_TB.winner_rank-M_TB.loser_rank) > 20 AND ABS(M_TB.winner_rank-M_TB.loser_rank) < 50 AND
	   			 M_TB.minutes IS NOT NULL AND M_TB.winner_rank IS NOT NULL AND M_TB.loser_rank IS NOT NULL
	   		THEN M_TB.minutes END), 2) AS rank_diff2050,

	   ROUND(
	   SUM(CASE 
	   		WHEN ABS(M_TB.winner_rank-M_TB.loser_rank) > 20 AND ABS(M_TB.winner_rank-M_TB.loser_rank) < 50 AND
	   			 (M_TB.winner_rank > M_TB.loser_rank)AND
	   			 M_TB.winner_rank IS NOT NULL AND M_TB.loser_rank IS NOT NULL
	   		THEN 1 ELSE 0 END)/
	   SUM(CASE
	   		WHEN ABS(M_TB.winner_rank-M_TB.loser_rank) > 20 AND ABS(M_TB.winner_rank-M_TB.loser_rank) < 50 AND
	   			 M_TB.winner_rank IS NOT NULL AND M_TB.loser_rank IS NOT NULL
	   		THEN 1 ELSE 0 END), 2) AS low_rank_win,

	   # rank_diff > 50
	   ROUND(
	   AVG(CASE 
	   		WHEN ABS(M_TB.winner_rank-M_TB.loser_rank) > 50 AND
	   			 M_TB.minutes IS NOT NULL AND M_TB.winner_rank IS NOT NULL AND M_TB.loser_rank IS NOT NULL
	   		THEN M_TB.minutes END), 2) AS rank_diff50,

	   ROUND(
	   SUM(CASE 
	   		WHEN ABS(M_TB.winner_rank-M_TB.loser_rank) > 50 AND
	   			 (M_TB.winner_rank > M_TB.loser_rank)AND
	   			 M_TB.winner_rank IS NOT NULL AND M_TB.loser_rank IS NOT NULL
	   		THEN 1 ELSE 0 END)/
	   SUM(CASE
	   		WHEN ABS(M_TB.winner_rank-M_TB.loser_rank) > 50 AND
	   		M_TB.winner_rank IS NOT NULL AND M_TB.loser_rank IS NOT NULL
	   		THEN 1 ELSE 0 END), 2) AS low_rank_win
FROM 
	(SELECT tourney_name, minutes, winner_rank, loser_rank
	FROM Match2015
	WHERE tourney_level = 'G'
	UNION
	SELECT tourney_name, minutes, winner_rank, loser_rank
	FROM Match2014
	WHERE tourney_level = 'G'
	UNION
	SELECT tourney_name, minutes, winner_rank, loser_rank
	FROM Match2013
	WHERE tourney_level = 'G'
	UNION
	SELECT tourney_name, minutes, winner_rank, loser_rank
	FROM Match2012
	WHERE tourney_level = 'G'
	UNION
	SELECT tourney_name, minutes, winner_rank, loser_rank
	FROM Match2011
	WHERE tourney_level = 'G') AS M_TB
GROUP BY M_TB.tourney_name
ORDER BY M_TB.tourney_name;