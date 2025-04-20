# Examining the data
SELECT *
FROM nfl_plays.nfl_filtered;

# Seeing overall how often pass plays are run vs. run plays.
SELECT AVG(play_type)
FROM nfl_plays.nfl_filtered;

# Seeing how play type varies by down and distance.
SELECT down, ydstogo, AVG(play_type), COUNT(play_type)
FROM nfl_plays.nfl_filtered
GROUP BY down, ydstogo
HAVING COUNT(play_type) > 100
ORDER BY AVG(play_type) DESC;

# Seeing how play type varies by field position. 
SELECT yardline_100, AVG(play_type), COUNT(play_type)
FROM nfl_plays.nfl_filtered
GROUP BY yardline_100
HAVING COUNT(play_type) > 100
ORDER BY AVG(play_type) DESC;

# We can also make field position groups which illustrates this idea more clearly. 
SELECT CASE WHEN yardline_100 < 3 THEN "Group1" WHEN yardline_100 BETWEEN 3 AND 20 THEN "Group2" WHEN yardline_100 
BETWEEN 21 AND 40 THEN "Group3" WHEN yardline_100 BETWEEN 41 AND 60 THEN "Group4" WHEN yardline_100 BETWEEN 61 AND 80 THEN "Group5" WHEN
yardline_100 BETWEEN 81 AND 97 THEN "Group5" ELSE "Group6" END AS "Field Position", AVG(play_type)
FROM nfl_plays.nfl_filtered
GROUP BY CASE WHEN yardline_100 < 3 THEN "Group1" WHEN yardline_100 BETWEEN 3 AND 20 THEN "Group2" WHEN yardline_100 
BETWEEN 21 AND 40 THEN "Group3" WHEN yardline_100 BETWEEN 41 AND 60 THEN "Group4" WHEN yardline_100 BETWEEN 61 AND 80 THEN "Group5" WHEN
yardline_100 BETWEEN 81 AND 97 THEN "Group5" ELSE "Group6" END
ORDER BY AVG(play_type);

# Seeing how play type varies by score differential. 
SELECT score_differential, AVG(play_type), COUNT(play_type)
FROM nfl_plays.nfl_filtered
GROUP BY score_differential
HAVING COUNT(play_type) > 100
ORDER BY AVG(play_type) DESC;

# We can also make score differential groups which illustrates this idea more clearly. 
SELECT CASE WHEN score_differential > 28 THEN "Group1" WHEN score_differential BETWEEN 21 AND 28 THEN "Group2" WHEN score_differential 
BETWEEN 14 AND 20 THEN "Group3" WHEN score_differential BETWEEN 7 AND 13 THEN "Group4" WHEN score_differential BETWEEN 1 AND 6 THEN "Group5" 
WHEN score_differential = 0 THEN "Group6" WHEN score_differential BETWEEN -6 AND -1 THEN "Group7" WHEN score_differential BETWEEN -13 AND -7   
THEN "Group8" WHEN score_differential BETWEEN -20 AND -14 THEN "Group9" WHEN score_differential BETWEEN -28 AND -21 THEN "Group10" ELSE   
"Group11" END AS "Field Position", AVG(play_type)
FROM nfl_plays.nfl_filtered
GROUP BY CASE WHEN score_differential > 28 THEN "Group1" WHEN score_differential BETWEEN 21 AND 28 THEN "Group2" WHEN score_differential 
BETWEEN 14 AND 20 THEN "Group3" WHEN score_differential BETWEEN 7 AND 13 THEN "Group4" WHEN score_differential BETWEEN 1 AND 6 THEN "Group5" 
WHEN score_differential = 0 THEN "Group6" WHEN score_differential BETWEEN -6 AND -1 THEN "Group7" WHEN score_differential BETWEEN -13 AND -7   
THEN "Group8" WHEN score_differential BETWEEN -20 AND -14 THEN "Group9" WHEN score_differential BETWEEN -28 AND -21 THEN "Group10" ELSE   
"Group11" END
ORDER BY AVG(play_type);


