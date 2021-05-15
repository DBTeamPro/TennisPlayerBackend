SELECT M_TB.tourney_name,
	    ROUND(
        CAST(
        SUM(CASE
	   		 WHEN M_TB.winner_seed = 0 AND M_TB.loser_seed > 0
	   		 THEN 1 ELSE 0 END) AS FLOAT)/
	    CAST((SUM(CASE
	   		 WHEN (M_TB.winner_seed = 0 AND M_TB.loser_seed > 0)
	   		 THEN 1 ELSE 0 END)+
	    SUM(CASE
	   		 WHEN (M_TB.loser_seed = 0 AND M_TB.winner_seed > 0)
	   		 THEN 1 ELSE 0 END)) AS FLOAT), 2) AS unseed_defeat_seed,

        ROUND(
	   	(SUM(CASE
	   		WHEN M_TB.winner_seed = 0
	   		THEN M_TB.winner_rank ELSE 0 END)+
	   	SUM(CASE
	   		WHEN M_TB.loser_seed = 0
	   		THEN M_TB.loser_rank ELSE 0 END))/
	   	(SUM(CASE
	   		WHEN M_TB.winner_seed = 0
	   		THEN 1 ELSE 0 END)+
	   	SUM(CASE
	   		WHEN M_TB.loser_seed = 0
	   		THEN 1 ELSE 0 END)), 2) AS avg_unseed_rank

FROM 
	(SELECT tourney_name, winner_rank, loser_rank, winner_seed, loser_seed
	FROM Match2015
	WHERE tourney_level = 'G'
	UNION
	SELECT tourney_name, winner_rank, loser_rank, winner_seed, loser_seed
	FROM Match2014
	WHERE tourney_level = 'G'
	UNION
	SELECT tourney_name, winner_rank, loser_rank, winner_seed, loser_seed
	FROM Match2013
	WHERE tourney_level = 'G'
	UNION
	SELECT tourney_name, winner_rank, loser_rank, winner_seed, loser_seed
	FROM Match2012
	WHERE tourney_level = 'G'
	UNION
	SELECT tourney_name, winner_rank, loser_rank, winner_seed, loser_seed
	FROM Match2011
	WHERE tourney_level = 'G') AS M_TB
GROUP BY M_TB.tourney_name
ORDER BY M_TB.tourney_name
FOR JSON AUTO;