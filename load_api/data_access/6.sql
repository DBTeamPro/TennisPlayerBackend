SELECT M_TB.tourney_level AS level,
	   ROUND(COUNT(M_TB.tourney_name)/5, 2) AS num_of_touney, 

	   SUM(CASE WHEN M_TB.winner_rank < 100 THEN 1 ELSE 0 END)+
	   SUM(CASE WHEN M_TB.loser_rank < 100 THEN 1 ELSE 0 END) AS less_than_100,

	   SUM(CASE WHEN M_TB.winner_rank > 100 AND M_TB.winner_rank < 200 THEN 1 ELSE 0 END)+
	   SUM(CASE WHEN M_TB.loser_rank > 100 AND M_TB.loser_rank < 200 THEN 1 ELSE 0 END) AS 100_to_200,

	   SUM(CASE WHEN M_TB.winner_rank > 200 AND M_TB.winner_rank < 300 THEN 1 ELSE 0 END)+
	   SUM(CASE WHEN M_TB.loser_rank > 200 AND M_TB.loser_rank < 300 THEN 1 ELSE 0 END) AS 200_to_300
FROM 
	(SELECT tourney_name, tourney_level, winner_rank, loser_rank
	FROM Match2015
	UNION
	SELECT tourney_name, tourney_level, winner_rank, loser_rank
	FROM Match2014
	UNION
	SELECT tourney_name, tourney_level, winner_rank, loser_rank
	FROM Match2013
	UNION
	SELECT tourney_name, tourney_level, winner_rank, loser_rank
	FROM Match2012
	UNION
	SELECT tourney_name, tourney_level, winner_rank, loser_rank
	FROM Match2011) AS M_TB
GROUP BY M_TB.tourney_level
ORDER BY M_TB.tourney_level;