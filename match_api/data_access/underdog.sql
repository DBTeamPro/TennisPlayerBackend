SELECT M_TB.tourney_name,

	   ROUND(
        CAST(
	   SUM(CASE
	   		WHEN M_TB.winner_rank - M_TB.loser_rank > 100
	   		THEN 1 ELSE 0 END) AS FLOAT)/
        CAST(
	   (SUM(CASE
	   		WHEN M_TB.winner_rank - M_TB.loser_rank > 100
	   		THEN 1 ELSE 0 END)+
	   SUM(CASE
	   		WHEN M_TB.loser_rank - M_TB.winner_rank > 100
	   		THEN 1 ELSE 0 END)) AS FLOAT), 2) AS rank_diff_100,

	   ROUND(
	   AVG(CASE
	   		WHEN M_TB.winner_rank - M_TB.loser_rank > 100
	   		THEN M_TB.winner_age END), 2) AS avg_age
FROM 
	(SELECT tourney_name, winner_rank, loser_rank, winner_age, loser_age
	FROM Match2015
	WHERE tourney_level = 'G'
	UNION
	SELECT tourney_name, winner_rank, loser_rank, winner_age, loser_age
	FROM Match2014
	WHERE tourney_level = 'G'
	UNION
	SELECT tourney_name, winner_rank, loser_rank, winner_age, loser_age
	FROM Match2013
	WHERE tourney_level = 'G'
	UNION
	SELECT tourney_name, winner_rank, loser_rank, winner_age, loser_age
	FROM Match2012
	WHERE tourney_level = 'G'
	UNION
	SELECT tourney_name, winner_rank, loser_rank, winner_age, loser_age
	FROM Match2011
	WHERE tourney_level = 'G') AS M_TB
GROUP BY M_TB.tourney_name
ORDER BY M_TB.tourney_name
FOR JSON AUTO;