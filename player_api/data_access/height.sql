select CONCAT('200_up') AS height,
(up200.w_1stIn + up200.L_1stIn)/(up200.w_svpt + up200.l_svpt) as rate_of_1stIn,
(up200.w_1stWon + up200.L_1stWon)/(up200.w_1stIn + up200.L_1stIn) as rate_of_1st_win
from
(select W.w_1stWon, L.L_1stWon, W.w_1stIn, L.L_1stIn, W.w_svpt, L.l_svpt
from
(select sum(wm.w_1stWon) as w_1stWon, sum(wm.w_1stIn) as w_1stIn, sum(wm.w_svpt) as w_svpt, sum(wm.l_svpt) as l_svpt
from 
(SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2015
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2014
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2013
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2012
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2011) AS wm
where wm.winner_ht > 200) as W,
(select sum(lm.L_1stWon) as L_1stWon, sum(lm.L_1stIn) as L_1stIn, sum(lm.w_svpt) as w_svpt, sum(lm.l_svpt) as l_svpt
from 
(SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2015
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2014
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2013
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2012
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2011) AS lm
where lm.loser_ht > 200) as L) as up200
union
select CONCAT('180-200') AS height,
(bet200_180.w_1stIn + bet200_180.L_1stIn)/(bet200_180.w_svpt + bet200_180.l_svpt) as rate_of_1stIn,
(bet200_180.w_1stWon + bet200_180.L_1stWon)/(bet200_180.w_1stIn + bet200_180.L_1stIn) as rate_of_1st_win
from
(select W.w_1stWon, L.L_1stWon, W.w_1stIn, L.L_1stIn, W.w_svpt, L.l_svpt
from
(select sum(wm.w_1stWon) as w_1stWon, sum(wm.w_1stIn) as w_1stIn, sum(wm.w_svpt) as w_svpt, sum(wm.l_svpt) as l_svpt
from 
(SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2015
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2014
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2013
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2012
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2011) AS wm
where wm.winner_ht <= 200 and wm.winner_ht > 180) as W,
(select sum(lm.L_1stWon) as L_1stWon, sum(lm.L_1stIn) as L_1stIn, sum(lm.w_svpt) as w_svpt, sum(lm.l_svpt) as l_svpt
from 
(SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2015
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2014
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2013
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2012
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2011) AS lm
where lm.loser_ht <= 200 and lm.loser_ht > 180) as L) as bet200_180
union
select CONCAT('under180') AS height,
(below180.w_1stIn + below180.L_1stIn)/(below180.w_svpt + below180.l_svpt) as rate_of_1stIn,
(below180.w_1stWon + below180.L_1stWon)/(below180.w_1stIn + below180.L_1stIn) as rate_of_1st_win
from
(select W.w_1stWon, L.L_1stWon, W.w_1stIn, L.L_1stIn, W.w_svpt, L.l_svpt
from
(select sum(wm.w_1stWon) as w_1stWon, sum(wm.w_1stIn) as w_1stIn, sum(wm.w_svpt) as w_svpt, sum(wm.l_svpt) as l_svpt
from 
(SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2015
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2014
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2013
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2012
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2011) AS wm
where wm.winner_ht <= 180 ) as W,
(select sum(lm.L_1stWon) as L_1stWon, sum(lm.L_1stIn) as L_1stIn, sum(lm.w_svpt) as w_svpt, sum(lm.l_svpt) as l_svpt
from 
(SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2015
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2014
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2013
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2012
		UNION
		SELECT winner_ht, loser_ht, w_1stWon, w_1stIn, L_1stWon, L_1stIn, w_svpt, l_svpt
		FROM Match2011) AS lm
where lm.loser_ht <= 180) as L) as below180
FOR JSON PATH;