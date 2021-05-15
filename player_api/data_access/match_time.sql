SELECT *
FROM
	(SELECT DISTINCT SUBSTRING(tourney_id, 1, 4) AS year
	FROM Match2011
	WHERE tourney_id = '2011-440') AS Y_TB,

	(SELECT ROUND(
            CAST(
			SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100 AND minutes < 120
				THEN 1 ELSE 0 END) AS FLOAT)/
            CAST(
		    (SUM(CASE 
				 WHEN winner_age > 30 AND winner_rank < 100 AND minutes < 120
				 THEN 1 ELSE 0 END)+ 
		    SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100 AND minutes < 120
				THEN 1 ELSE 0 END)) AS FLOAT), 2) AS less_than_2h,

		    ROUND(
            CAST(
		    SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100 AND minutes > 120
				THEN 1 ELSE 0 END) AS FLOAT)/
            CAST(
		    (SUM(CASE 
				 WHEN winner_age > 30 AND winner_rank < 100 AND minutes > 120
				 THEN 1 ELSE 0 END)+ 
		    SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100 AND minutes > 120
				THEN 1 ELSE 0 END)) AS FLOAT), 2) AS over_2h,

			ROUND(
            CAST(
		    (SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100
				THEN winner_rank ELSE 0 END)+
		   	SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100
				THEN loser_rank ELSE 0 END)) AS FLOAT)/
            CAST(
		   	(SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100
				THEN 1 ELSE 0 END)+
		   	SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100
				THEN 1 ELSE 0 END)) AS FLOAT), 2) AS avg_rank
	FROM Match2011) AS M_TB
UNION
SELECT *
FROM
	(SELECT DISTINCT SUBSTRING(tourney_id, 1, 4) AS year
	FROM Match2012
	WHERE tourney_id = '2012-418') AS Y_TB,

	(SELECT ROUND(
            CAST(
			SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100 AND minutes < 120
				THEN 1 ELSE 0 END) AS FLOAT)/
            CAST(
		    (SUM(CASE 
				 WHEN winner_age > 30 AND winner_rank < 100 AND minutes < 120
				 THEN 1 ELSE 0 END)+ 
		    SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100 AND minutes < 120
				THEN 1 ELSE 0 END)) AS FLOAT), 2) AS less_than_2h,

			ROUND(
            CAST(
		    SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100 AND minutes > 120
				THEN 1 ELSE 0 END) AS FLOAT)/
            CAST(
		    (SUM(CASE 
				 WHEN winner_age > 30 AND winner_rank < 100 AND minutes > 120
				 THEN 1 ELSE 0 END)+ 
		    SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100 AND minutes > 120
				THEN 1 ELSE 0 END)) AS FLOAT), 2) AS over_2h,

			ROUND(
            CAST(
		    (SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100
				THEN winner_rank ELSE 0 END)+
		    SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100
				THEN loser_rank ELSE 0 END)) AS FLOAT)/
            CAST(
		    (SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100
				THEN 1 ELSE 0 END)+
		    SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100
				THEN 1 ELSE 0 END)) AS FLOAT), 2) AS avg_rank
	FROM Match2012) AS M_TB
UNION
SELECT *
FROM
	(SELECT DISTINCT SUBSTRING(tourney_id, 1, 4) AS year
	FROM Match2013
	WHERE tourney_id = '2013-319') AS Y_TB,

	(SELECT ROUND(
            CAST(
			SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100 AND minutes < 120
				THEN 1 ELSE 0 END) AS FLOAT)/
            CAST(
		   (SUM(CASE 
				 WHEN winner_age > 30 AND winner_rank < 100 AND minutes < 120
				 THEN 1 ELSE 0 END)+ 
		   SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100 AND minutes < 120
				THEN 1 ELSE 0 END)) AS FLOAT), 2) AS less_than_2h,

			ROUND(
            CAST(
		   SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100 AND minutes > 120
				THEN 1 ELSE 0 END) AS FLOAT)/
            CAST(
		   (SUM(CASE 
				 WHEN winner_age > 30 AND winner_rank < 100 AND minutes > 120
				 THEN 1 ELSE 0 END)+ 
		   SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100 AND minutes > 120
				THEN 1 ELSE 0 END)) AS FLOAT), 2) AS over_2h,

			ROUND(
            CAST(
		   (SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100
				THEN winner_rank ELSE 0 END)+
		   SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100
				THEN loser_rank ELSE 0 END)) AS FLOAT)/
            CAST(
		   (SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100
				THEN 1 ELSE 0 END)+
		   SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100
				THEN 1 ELSE 0 END)) AS FLOAT), 2) AS avg_rank
	FROM Match2013) AS M_TB
UNION
SELECT *
FROM
	(SELECT DISTINCT SUBSTRING(tourney_id, 1, 4) AS year
	FROM Match2014
	WHERE tourney_id = '2014-301') AS Y_TB,

	(SELECT ROUND(
            CAST(
			SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100 AND minutes < 120
				THEN 1 ELSE 0 END) AS FLOAT)/
            CAST(
		   (SUM(CASE 
				 WHEN winner_age > 30 AND winner_rank < 100 AND minutes < 120
				 THEN 1 ELSE 0 END)+ 
		   SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100 AND minutes < 120
				THEN 1 ELSE 0 END)) AS FLOAT), 2) AS less_than_2h,

			ROUND(
            CAST(
		   SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100 AND minutes > 120
				THEN 1 ELSE 0 END) AS FLOAT)/
            CAST(
		   (SUM(CASE 
				 WHEN winner_age > 30 AND winner_rank < 100 AND minutes > 120
				 THEN 1 ELSE 0 END)+ 
		   SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100 AND minutes > 120
				THEN 1 ELSE 0 END)) AS FLOAT), 2) AS over_2h,

			ROUND(
            CAST(
		   (SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100
				THEN winner_rank ELSE 0 END)+
		   SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100
				THEN loser_rank ELSE 0 END)) AS FLOAT)/
            CAST(
		   (SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100
				THEN 1 ELSE 0 END)+
		   SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100
				THEN 1 ELSE 0 END)) AS FLOAT), 2) AS avg_rank
	FROM Match2014) AS M_TB
UNION
SELECT *
FROM
	(SELECT DISTINCT SUBSTRING(tourney_id, 1, 4) AS year
	FROM Match2015
	WHERE tourney_id = '2015-329') AS Y_TB,

	(SELECT ROUND(
            CAST(
			SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100 AND minutes < 120
				THEN 1 ELSE 0 END) AS FLOAT)/
            CAST(
		   (SUM(CASE 
				 WHEN winner_age > 30 AND winner_rank < 100 AND minutes < 120
				 THEN 1 ELSE 0 END)+ 
		   SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100 AND minutes < 120
				THEN 1 ELSE 0 END)) AS FLOAT), 2) AS less_than_2h,

			ROUND(
            CAST(
		   SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100 AND minutes > 120
				THEN 1 ELSE 0 END) AS FLOAT)/
            CAST(
		   (SUM(CASE 
				 WHEN winner_age > 30 AND winner_rank < 100 AND minutes > 120
				 THEN 1 ELSE 0 END)+ 
		   SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100 AND minutes > 120
				THEN 1 ELSE 0 END)) AS FLOAT), 2) AS over_2h,

			ROUND(
            CAST(
		   (SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100
				THEN winner_rank ELSE 0 END)+
		   SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100
				THEN loser_rank ELSE 0 END)) AS FLOAT)/
            CAST(
		   (SUM(CASE 
				WHEN winner_age > 30 AND winner_rank < 100
				THEN 1 ELSE 0 END)+
		   SUM(CASE 
				WHEN loser_age > 30 AND loser_rank < 100
				THEN 1 ELSE 0 END)) AS FLOAT), 2) AS avg_rank
	FROM Match2015) AS M_TB
    FOR JSON AUTO;