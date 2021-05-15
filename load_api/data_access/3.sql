SELECT CONCAT(tourney_name, '_1st') AS tourney_1st_2nd,
	   ROUND(w_1stIn/w_svpt, 2) AS 1stIn_rate,
	   ROUND(w_1stWon/w_1stIn, 2) AS 1stWon_rate,
	   ROUND(w_2ndWon/(w_svpt - w_1stIn), 2) AS 2ndWon_rate,
	   ROUND((l_bpFaced - l_bpSaved)/l_bpFaced, 2) AS break_rate,
	   ROUND((w_SvGms - (w_bpFaced - w_bpSaved))/w_SvGms, 2) AS serve_rate
FROM Match2015
WHERE tourney_name = 'US Open' AND match_num = 127
UNION
SELECT CONCAT(tourney_name, '_2nd') AS tourney_1st_2nd,
	   ROUND(l_1stIn/l_svpt, 2) AS 1stIn_rate,
	   ROUND(l_1stWon/l_1stIn, 2) AS 1stWon_rate,
	   ROUND(l_2ndWon/(l_svpt - l_1stIn), 2) AS 2ndWon_rate,
	   ROUND((w_bpFaced - w_bpSaved)/w_bpFaced, 2) AS break_rate,
	   ROUND((l_SvGms - (l_bpFaced - l_bpSaved))/l_SvGms, 2) AS serve_rate
FROM Match2015
WHERE tourney_name = 'US Open' AND match_num = 127
UNION
SELECT CONCAT(tourney_name, '_1st') AS tourney_1st_2nd,
	   ROUND(w_1stIn/w_svpt, 2) AS 1stIn_rate,
	   ROUND(w_1stWon/w_1stIn, 2) AS 1stWon_rate,
	   ROUND(w_2ndWon/(w_svpt - w_1stIn), 2) AS 2ndWon_rate,
	   ROUND((l_bpFaced - l_bpSaved)/l_bpFaced, 2) AS break_rate,
	   ROUND((w_SvGms - (w_bpFaced - w_bpSaved))/w_SvGms, 2) AS serve_rate
FROM Match2015
WHERE tourney_name = 'Australian Open' AND match_num = 127
UNION
SELECT CONCAT(tourney_name, '_2nd') AS tourney_1st_2nd,
	   ROUND(l_1stIn/l_svpt, 2) AS 1stIn_rate,
	   ROUND(l_1stWon/l_1stIn, 2) AS 1stWon_rate,
	   ROUND(l_2ndWon/(l_svpt - l_1stIn), 2) AS 2ndWon_rate,
	   ROUND((w_bpFaced - w_bpSaved)/w_bpFaced, 2) AS break_rate,
	   ROUND((l_SvGms - (l_bpFaced - l_bpSaved))/l_SvGms, 2) AS serve_rate
FROM Match2015
WHERE tourney_name = 'Australian Open' AND match_num = 127
UNION
SELECT CONCAT(tourney_name, '_1st') AS tourney_1st_2nd,
	   ROUND(w_1stIn/w_svpt, 2) AS 1stIn_rate,
	   ROUND(w_1stWon/w_1stIn, 2) AS 1stWon_rate,
	   ROUND(w_2ndWon/(w_svpt - w_1stIn), 2) AS 2ndWon_rate,
	   ROUND((l_bpFaced - l_bpSaved)/l_bpFaced, 2) AS break_rate,
	   ROUND((w_SvGms - (w_bpFaced - w_bpSaved))/w_SvGms, 2) AS serve_rate
FROM Match2015
WHERE tourney_name = 'Wimbledon' AND match_num = 127
UNION
SELECT CONCAT(tourney_name, '_2nd') AS tourney_1st_2nd,
	   ROUND(l_1stIn/l_svpt, 2) AS 1stIn_rate,
	   ROUND(l_1stWon/l_1stIn, 2) AS 1stWon_rate,
	   ROUND(l_2ndWon/(l_svpt - l_1stIn), 2) AS 2ndWon_rate,
	   ROUND((w_bpFaced - w_bpSaved)/w_bpFaced, 2) AS break_rate,
	   ROUND((l_SvGms - (l_bpFaced - l_bpSaved))/l_SvGms, 2) AS serve_rate
FROM Match2015
WHERE tourney_name = 'Wimbledon' AND match_num = 127
UNION
SELECT CONCAT(tourney_name, '_1st') AS tourney_1st_2nd,
	   ROUND(w_1stIn/w_svpt, 2) AS 1stIn_rate,
	   ROUND(w_1stWon/w_1stIn, 2) AS 1stWon_rate,
	   ROUND(w_2ndWon/(w_svpt - w_1stIn), 2) AS 2ndWon_rate,
	   ROUND((l_bpFaced - l_bpSaved)/l_bpFaced, 2) AS break_rate,
	   ROUND((w_SvGms - (w_bpFaced - w_bpSaved))/w_SvGms, 2) AS serve_rate
FROM Match2015
WHERE tourney_name = 'Roland Garros' AND match_num = 127
UNION
SELECT CONCAT(tourney_name, '_2nd') AS tourney_1st_2nd,
	   ROUND(l_1stIn/l_svpt, 2) AS 1stIn_rate,
	   ROUND(l_1stWon/l_1stIn, 2) AS 1stWon_rate,
	   ROUND(l_2ndWon/(l_svpt - l_1stIn), 2) AS 2ndWon_rate,
	   ROUND((w_bpFaced - w_bpSaved)/w_bpFaced, 2) AS break_rate,
	   ROUND((l_SvGms - (l_bpFaced - l_bpSaved))/l_SvGms, 2) AS serve_rate
FROM Match2015
WHERE tourney_name = 'Roland Garros' AND match_num = 127;

/*
AH : w_svpt
AI : w_1stIn
AJ : w_1stWon
AK : w_2ndWon
AL : w_SvGms
AM : w_bpSaved
AN : w_bpFaced	
AO : l_ace	
AP : l_df	
AQ : l_svpt	
AR : l_1stIn	
AS : l_1stWon	
AT : l_2ndWon	
AU : l_SvGms	
AV : l_bpSaved	
AW : l_bpFaced
*/