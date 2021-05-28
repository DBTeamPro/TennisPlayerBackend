SELECT CONCAT(tourney_name, '_1st') AS tourney_first_second,
	   ROUND(CAST(w_1stIn AS FLOAT)/CAST(w_svpt AS FLOAT), 2) AS firstIn_rate,
	   ROUND(CAST(w_1stWon AS FLOAT)/CAST(w_1stIn AS FLOAT), 2) AS firstWon_rate,
	   ROUND(CAST(w_2ndWon AS FLOAT)/CAST((w_svpt - w_1stIn) AS FLOAT), 2) AS secondWon_rate,
	   ROUND(CAST((l_bpFaced - l_bpSaved) AS FLOAT)/CAST(l_bpFaced AS FLOAT), 2) AS break_rate,
	   ROUND(CAST((w_SvGms - (w_bpFaced - w_bpSaved)) AS FLOAT)/CAST(w_SvGms AS FLOAT), 2) AS serve_rate
FROM Match2015
WHERE tourney_name = 'US Open' AND match_num = 127
UNION
SELECT CONCAT(tourney_name, '_2nd') AS tourney_first_second,
	   ROUND(CAST(l_1stIn AS FLOAT)/CAST(l_svpt AS FLOAT), 2) AS firstIn_rate,
	   ROUND(CAST(l_1stWon AS FLOAT)/CAST(l_1stIn AS FLOAT), 2) AS firstWon_rate,
	   ROUND(CAST(l_2ndWon AS FLOAT)/CAST((l_svpt - l_1stIn) AS FLOAT), 2) AS secondWon_rate,
	   ROUND(CAST((w_bpFaced - w_bpSaved) AS FLOAT)/CAST(w_bpFaced AS FLOAT), 2) AS break_rate,
	   ROUND(CAST((l_SvGms - (l_bpFaced - l_bpSaved)) AS FLOAT)/CAST(l_SvGms AS FLOAT), 2) AS serve_rate
FROM Match2015
WHERE tourney_name = 'US Open' AND match_num = 127
UNION
SELECT CONCAT(tourney_name, '_1st') AS tourney_first_second,
	   ROUND(CAST(w_1stIn AS FLOAT)/CAST(w_svpt AS FLOAT), 2) AS firstIn_rate,
	   ROUND(CAST(w_1stWon AS FLOAT)/CAST(w_1stIn AS FLOAT), 2) AS firstWon_rate,
	   ROUND(CAST(w_2ndWon AS FLOAT)/CAST((w_svpt - w_1stIn) AS FLOAT), 2) AS secondWon_rate,
	   ROUND(CAST((l_bpFaced - l_bpSaved) AS FLOAT)/CAST(l_bpFaced AS FLOAT), 2) AS break_rate,
	   ROUND(CAST((w_SvGms - (w_bpFaced - w_bpSaved)) AS FLOAT)/CAST(w_SvGms AS FLOAT), 2) AS serve_rate
FROM Match2015
WHERE tourney_name = 'Australian Open' AND match_num = 127
UNION
SELECT CONCAT(tourney_name, '_2nd') AS tourney_first_second,
	   ROUND(CAST(l_1stIn AS FLOAT)/CAST(l_svpt AS FLOAT), 2) AS firstIn_rate,
	   ROUND(CAST(l_1stWon AS FLOAT)/CAST(l_1stIn AS FLOAT), 2) AS firstWon_rate,
	   ROUND(CAST(l_2ndWon AS FLOAT)/CAST((l_svpt - l_1stIn) AS FLOAT), 2) AS secondWon_rate,
	   ROUND(CAST((w_bpFaced - w_bpSaved) AS FLOAT)/CAST(w_bpFaced AS FLOAT), 2) AS break_rate,
	   ROUND(CAST((l_SvGms - (l_bpFaced - l_bpSaved)) AS FLOAT)/CAST(l_SvGms AS FLOAT), 2) AS serve_rate
FROM Match2015
WHERE tourney_name = 'Australian Open' AND match_num = 127
UNION
SELECT CONCAT(tourney_name, '_1st') AS tourney_first_second,
	   ROUND(CAST(w_1stIn AS FLOAT)/CAST(w_svpt AS FLOAT), 2) AS firstIn_rate,
	   ROUND(CAST(w_1stWon AS FLOAT)/CAST(w_1stIn AS FLOAT), 2) AS firstWon_rate,
	   ROUND(CAST(w_2ndWon AS FLOAT)/CAST((w_svpt - w_1stIn) AS FLOAT), 2) AS secondWon_rate,
	   ROUND(CAST((l_bpFaced - l_bpSaved) AS FLOAT)/CAST(l_bpFaced AS FLOAT), 2) AS break_rate,
	   ROUND(CAST((w_SvGms - (w_bpFaced - w_bpSaved)) AS FLOAT)/CAST(w_SvGms AS FLOAT), 2) AS serve_rate
FROM Match2015
WHERE tourney_name = 'Wimbledon' AND match_num = 127
UNION
SELECT CONCAT(tourney_name, '_2nd') AS tourney_first_second,
	   ROUND(CAST(l_1stIn AS FLOAT)/CAST(l_svpt AS FLOAT), 2) AS firstIn_rate,
	   ROUND(CAST(l_1stWon AS FLOAT)/CAST(l_1stIn AS FLOAT), 2) AS firstWon_rate,
	   ROUND(CAST(l_2ndWon AS FLOAT)/CAST((l_svpt - l_1stIn) AS FLOAT), 2) AS secondWon_rate,
	   ROUND(CAST((w_bpFaced - w_bpSaved) AS FLOAT)/CAST(w_bpFaced AS FLOAT), 2) AS break_rate,
	   ROUND(CAST((l_SvGms - (l_bpFaced - l_bpSaved)) AS FLOAT)/CAST(l_SvGms AS FLOAT), 2) AS serve_rate
FROM Match2015
WHERE tourney_name = 'Wimbledon' AND match_num = 127
UNION
SELECT CONCAT(tourney_name, '_1st') AS tourney_first_second,
	   ROUND(CAST(w_1stIn AS FLOAT)/CAST(w_svpt AS FLOAT), 2) AS firstIn_rate,
	   ROUND(CAST(w_1stWon AS FLOAT)/CAST(w_1stIn AS FLOAT), 2) AS firstWon_rate,
	   ROUND(CAST(w_2ndWon AS FLOAT)/CAST((w_svpt - w_1stIn) AS FLOAT), 2) AS secondWon_rate,
	   ROUND(CAST((l_bpFaced - l_bpSaved) AS FLOAT)/CAST(l_bpFaced AS FLOAT), 2) AS break_rate,
	   ROUND(CAST((w_SvGms - (w_bpFaced - w_bpSaved)) AS FLOAT)/CAST(w_SvGms AS FLOAT), 2) AS serve_rate
FROM Match2015
WHERE tourney_name = 'Roland Garros' AND match_num = 127
UNION
SELECT CONCAT(tourney_name, '_2nd') AS tourney_first_second,
	   ROUND(CAST(l_1stIn AS FLOAT)/CAST(l_svpt AS FLOAT), 2) AS firstIn_rate,
	   ROUND(CAST(l_1stWon AS FLOAT)/CAST(l_1stIn AS FLOAT), 2) AS firstWon_rate,
	   ROUND(CAST(l_2ndWon AS FLOAT)/CAST((l_svpt - l_1stIn) AS FLOAT), 2) AS secondWon_rate,
	   ROUND(CAST((w_bpFaced - w_bpSaved) AS FLOAT)/CAST(w_bpFaced AS FLOAT), 2) AS break_rate,
	   ROUND(CAST((l_SvGms - (l_bpFaced - l_bpSaved)) AS FLOAT)/CAST(l_SvGms AS FLOAT), 2) AS serve_rate
FROM Match2015
WHERE tourney_name = 'Roland Garros' AND match_num = 127
ORDER BY tourney_first_second
FOR JSON AUTO;