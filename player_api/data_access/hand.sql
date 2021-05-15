SELECT *
FROM	
	(SELECT SUBSTRING('G', 1, 1) AS level,

			ROUND(
		    CAST(SUM(CASE WHEN H_TB.hand = 'L' THEN 1 END) AS FLOAT)/
            CAST(
		    (SUM(CASE WHEN H_TB.hand = 'L' THEN 1 END)+
		    SUM(CASE WHEN H_TB.hand = 'R' THEN 1 END)) AS FLOAT), 2) AS rate_of_left_hand
	FROM 
		(SELECT DISTINCT winner_name AS name
		FROM Match2015
		WHERE tourney_level = 'G'
		UNION
		SELECT DISTINCT loser_name AS name
		FROM Match2015
		WHERE tourney_level = 'G'
		UNION
		SELECT DISTINCT winner_name AS name
		FROM Match2014
		WHERE tourney_level = 'G'
		UNION
		SELECT DISTINCT loser_name AS name
		FROM Match2014
		WHERE tourney_level = 'G'
		UNION
		SELECT DISTINCT winner_name AS name
		FROM Match2013
		WHERE tourney_level = 'G'
		UNION
		SELECT DISTINCT loser_name AS name
		FROM Match2013
		WHERE tourney_level = 'G'
		UNION
		SELECT DISTINCT winner_name AS name
		FROM Match2012
		WHERE tourney_level = 'G'
		UNION
		SELECT DISTINCT loser_name AS name
		FROM Match2012
		WHERE tourney_level = 'G'
		UNION
		SELECT DISTINCT winner_name AS name
		FROM Match2011
		WHERE tourney_level = 'G'
		UNION
		SELECT DISTINCT loser_name AS name
		FROM Match2011
		WHERE tourney_level = 'G') AS N_TB, 

		(SELECT M_TB.name AS name, MIN(M_TB.hand) AS hand
		FROM
			(SELECT tourney_level, winner_name AS name, winner_hand AS hand
			FROM Match2015
			UNION
			SELECT tourney_level, winner_name AS name, winner_hand AS hand
			FROM Match2014
			UNION
			SELECT tourney_level, winner_name AS name, winner_hand AS hand
			FROM Match2013
			UNION
			SELECT tourney_level, winner_name AS name, winner_hand AS hand
			FROM Match2012
			UNION
			SELECT tourney_level, winner_name AS name, winner_hand AS hand
			FROM Match2011
			UNION
			SELECT tourney_level, loser_name AS name, loser_hand AS hand
			FROM Match2015
			UNION
			SELECT tourney_level, loser_name AS name, loser_hand AS hand
			FROM Match2014
			UNION
			SELECT tourney_level, loser_name AS name, loser_hand AS hand
			FROM Match2013
			UNION
			SELECT tourney_level, loser_name AS name, loser_hand AS hand
			FROM Match2012
			UNION
			SELECT tourney_level, loser_name AS name, loser_hand AS hand
			FROM Match2011) AS M_TB
		WHERE M_TB.hand = 'L' OR M_TB.hand = 'R'
		GROUP BY M_TB.name) AS H_TB
	WHERE N_TB.name = H_TB.name) AS ONE,

	(SELECT ROUND(
			CAST(SUM(CASE WHEN M_TB.winner_hand = 'L' THEN 1 END) AS FLOAT)/
            CAST(
		    (SUM(CASE WHEN M_TB.winner_hand = 'L' THEN 1 END)+
		    SUM(CASE WHEN M_TB.loser_hand = 'L' THEN 1 END)) AS FLOAT), 2) AS win_rate,

			ROUND(
            CAST(
		    (SUM(CASE WHEN M_TB.winner_hand = 'L' THEN M_TB.winner_rank END)+
		    SUM(CASE WHEN M_TB.loser_hand = 'L' THEN M_TB.loser_rank END)) AS FLOAT)/
            CAST(
		    (SUM(CASE WHEN M_TB.winner_hand = 'L' THEN 1 END)+
		    SUM(CASE WHEN M_TB.loser_hand = 'L' THEN 1 END)) AS FLOAT), 2) AS avg_rank
	FROM 
		(SELECT winner_hand, loser_hand, winner_rank, loser_rank
		FROM Match2015
		WHERE tourney_level = 'G'
		UNION
		SELECT winner_hand, loser_hand, winner_rank, loser_rank
		FROM Match2014
		WHERE tourney_level = 'G'
		UNION
		SELECT winner_hand, loser_hand, winner_rank, loser_rank
		FROM Match2013
		WHERE tourney_level = 'G'
		UNION
		SELECT winner_hand, loser_hand, winner_rank, loser_rank
		FROM Match2012
		WHERE tourney_level = 'G'
		UNION
		SELECT winner_hand, loser_hand, winner_rank, loser_rank
		FROM Match2011
		WHERE tourney_level = 'G') AS M_TB) AS TWO
UNION
SELECT *
FROM	
	(SELECT SUBSTRING('A', 1, 1) AS level,

			ROUND(
		    CAST(SUM(CASE WHEN H_TB.hand = 'L' THEN 1 END) AS FLOAT)/
            CAST(
		    (SUM(CASE WHEN H_TB.hand = 'L' THEN 1 END)+
		    SUM(CASE WHEN H_TB.hand = 'R' THEN 1 END)) AS FLOAT), 2) AS rate_of_left_hand
	FROM 
		(SELECT DISTINCT winner_name AS name
		FROM Match2015
		WHERE tourney_level = 'A'
		UNION
		SELECT DISTINCT loser_name AS name
		FROM Match2015
		WHERE tourney_level = 'A'
		UNION
		SELECT DISTINCT winner_name AS name
		FROM Match2014
		WHERE tourney_level = 'A'
		UNION
		SELECT DISTINCT loser_name AS name
		FROM Match2014
		WHERE tourney_level = 'A'
		UNION
		SELECT DISTINCT winner_name AS name
		FROM Match2013
		WHERE tourney_level = 'A'
		UNION
		SELECT DISTINCT loser_name AS name
		FROM Match2013
		WHERE tourney_level = 'A'
		UNION
		SELECT DISTINCT winner_name AS name
		FROM Match2012
		WHERE tourney_level = 'A'
		UNION
		SELECT DISTINCT loser_name AS name
		FROM Match2012
		WHERE tourney_level = 'A'
		UNION
		SELECT DISTINCT winner_name AS name
		FROM Match2011
		WHERE tourney_level = 'A'
		UNION
		SELECT DISTINCT loser_name AS name
		FROM Match2011
		WHERE tourney_level = 'A') AS N_TB, 

		(SELECT M_TB.name AS name, MIN(M_TB.hand) AS hand
		FROM
			(SELECT tourney_level, winner_name AS name, winner_hand AS hand
			FROM Match2015
			UNION
			SELECT tourney_level, winner_name AS name, winner_hand AS hand
			FROM Match2014
			UNION
			SELECT tourney_level, winner_name AS name, winner_hand AS hand
			FROM Match2013
			UNION
			SELECT tourney_level, winner_name AS name, winner_hand AS hand
			FROM Match2012
			UNION
			SELECT tourney_level, winner_name AS name, winner_hand AS hand
			FROM Match2011
			UNION
			SELECT tourney_level, loser_name AS name, loser_hand AS hand
			FROM Match2015
			UNION
			SELECT tourney_level, loser_name AS name, loser_hand AS hand
			FROM Match2014
			UNION
			SELECT tourney_level, loser_name AS name, loser_hand AS hand
			FROM Match2013
			UNION
			SELECT tourney_level, loser_name AS name, loser_hand AS hand
			FROM Match2012
			UNION
			SELECT tourney_level, loser_name AS name, loser_hand AS hand
			FROM Match2011) AS M_TB
		WHERE M_TB.hand = 'L' OR M_TB.hand = 'R'
		GROUP BY M_TB.name) AS H_TB
	WHERE N_TB.name = H_TB.name) AS ONE,

	(SELECT ROUND(
			CAST(SUM(CASE WHEN M_TB.winner_hand = 'L' THEN 1 END) AS FLOAT)/
            CAST(
		    (SUM(CASE WHEN M_TB.winner_hand = 'L' THEN 1 END)+
		    SUM(CASE WHEN M_TB.loser_hand = 'L' THEN 1 END)) AS FLOAT), 2) AS win_rate,

			ROUND(
            CAST(
		    (SUM(CASE WHEN M_TB.winner_hand = 'L' THEN M_TB.winner_rank END)+
		    SUM(CASE WHEN M_TB.loser_hand = 'L' THEN M_TB.loser_rank END)) AS FLOAT)/
            CAST(
		    (SUM(CASE WHEN M_TB.winner_hand = 'L' THEN 1 END)+
		    SUM(CASE WHEN M_TB.loser_hand = 'L' THEN 1 END)) AS FLOAT), 2) AS avg_rank
	FROM 
		(SELECT winner_hand, loser_hand, winner_rank, loser_rank
		FROM Match2015
		WHERE tourney_level = 'A'
		UNION
		SELECT winner_hand, loser_hand, winner_rank, loser_rank
		FROM Match2014
		WHERE tourney_level = 'A'
		UNION
		SELECT winner_hand, loser_hand, winner_rank, loser_rank
		FROM Match2013
		WHERE tourney_level = 'A'
		UNION
		SELECT winner_hand, loser_hand, winner_rank, loser_rank
		FROM Match2012
		WHERE tourney_level = 'A'
		UNION
		SELECT winner_hand, loser_hand, winner_rank, loser_rank
		FROM Match2011
		WHERE tourney_level = 'A') AS M_TB) AS TWO
UNION
SELECT *
FROM	
	(SELECT SUBSTRING('M', 1, 1) AS level,

			ROUND(
		    CAST(SUM(CASE WHEN H_TB.hand = 'L' THEN 1 END) AS FLOAT)/
            CAST(
		    (SUM(CASE WHEN H_TB.hand = 'L' THEN 1 END)+
		    SUM(CASE WHEN H_TB.hand = 'R' THEN 1 END)) AS FLOAT), 2) AS rate_of_left_hand
	FROM 
		(SELECT DISTINCT winner_name AS name
		FROM Match2015
		WHERE tourney_level = 'M'
		UNION
		SELECT DISTINCT loser_name AS name
		FROM Match2015
		WHERE tourney_level = 'M'
		UNION
		SELECT DISTINCT winner_name AS name
		FROM Match2014
		WHERE tourney_level = 'M'
		UNION
		SELECT DISTINCT loser_name AS name
		FROM Match2014
		WHERE tourney_level = 'M'
		UNION
		SELECT DISTINCT winner_name AS name
		FROM Match2013
		WHERE tourney_level = 'M'
		UNION
		SELECT DISTINCT loser_name AS name
		FROM Match2013
		WHERE tourney_level = 'M'
		UNION
		SELECT DISTINCT winner_name AS name
		FROM Match2012
		WHERE tourney_level = 'M'
		UNION
		SELECT DISTINCT loser_name AS name
		FROM Match2012
		WHERE tourney_level = 'M'
		UNION
		SELECT DISTINCT winner_name AS name
		FROM Match2011
		WHERE tourney_level = 'M'
		UNION
		SELECT DISTINCT loser_name AS name
		FROM Match2011
		WHERE tourney_level = 'M') AS N_TB, 

		(SELECT M_TB.name AS name, MIN(M_TB.hand) AS hand
		FROM
			(SELECT tourney_level, winner_name AS name, winner_hand AS hand
			FROM Match2015
			UNION
			SELECT tourney_level, winner_name AS name, winner_hand AS hand
			FROM Match2014
			UNION
			SELECT tourney_level, winner_name AS name, winner_hand AS hand
			FROM Match2013
			UNION
			SELECT tourney_level, winner_name AS name, winner_hand AS hand
			FROM Match2012
			UNION
			SELECT tourney_level, winner_name AS name, winner_hand AS hand
			FROM Match2011
			UNION
			SELECT tourney_level, loser_name AS name, loser_hand AS hand
			FROM Match2015
			UNION
			SELECT tourney_level, loser_name AS name, loser_hand AS hand
			FROM Match2014
			UNION
			SELECT tourney_level, loser_name AS name, loser_hand AS hand
			FROM Match2013
			UNION
			SELECT tourney_level, loser_name AS name, loser_hand AS hand
			FROM Match2012
			UNION
			SELECT tourney_level, loser_name AS name, loser_hand AS hand
			FROM Match2011) AS M_TB
		WHERE M_TB.hand = 'L' OR M_TB.hand = 'R'
		GROUP BY M_TB.name) AS H_TB
	WHERE N_TB.name = H_TB.name) AS ONE,

	(SELECT ROUND(
            CAST(
			SUM(CASE WHEN M_TB.winner_hand = 'L' THEN 1 END) AS FLOAT)/
            CAST(
		    (SUM(CASE WHEN M_TB.winner_hand = 'L' THEN 1 END)+
		    SUM(CASE WHEN M_TB.loser_hand = 'L' THEN 1 END)) AS FLOAT), 2) AS win_rate,

		   	ROUND(
            CAST(
		    (SUM(CASE WHEN M_TB.winner_hand = 'L' THEN M_TB.winner_rank END)+
		    SUM(CASE WHEN M_TB.loser_hand = 'L' THEN M_TB.loser_rank END)) AS FLOAT)/
            CAST(
		    (SUM(CASE WHEN M_TB.winner_hand = 'L' THEN 1 END)+
		    SUM(CASE WHEN M_TB.loser_hand = 'L' THEN 1 END)) AS FLOAT), 2) AS avg_rank
	FROM 
		(SELECT winner_hand, loser_hand, winner_rank, loser_rank
		FROM Match2015
		WHERE tourney_level = 'M'
		UNION
		SELECT winner_hand, loser_hand, winner_rank, loser_rank
		FROM Match2014
		WHERE tourney_level = 'M'
		UNION
		SELECT winner_hand, loser_hand, winner_rank, loser_rank
		FROM Match2013
		WHERE tourney_level = 'M'
		UNION
		SELECT winner_hand, loser_hand, winner_rank, loser_rank
		FROM Match2012
		WHERE tourney_level = 'M'
		UNION
		SELECT winner_hand, loser_hand, winner_rank, loser_rank
		FROM Match2011
		WHERE tourney_level = 'M') AS M_TB) AS TWO
ORDER BY level
FOR JSON AUTO;