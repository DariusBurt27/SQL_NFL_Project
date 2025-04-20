# Analyzing NFL Data in SQL
 In this project I use SQL to analyze data on NFL plays from the 2009 NFL season to the 2018 NFL season. I downloaded the dataset from Kaggle which can be found [here](https://www.kaggle.com/datasets/kendallgillies/nflstatistics). I first cleaned and formatted the data using the Pandas library in Python. I was primarily focused on what factors contributed to a team either running or passing the ball, so I removed many unnecessary columns, leaving only 9 that I thought were relevant. I also filtered the data to only pass and run plays, leaving out other play types like kickoffs and field goals. Finally, I changed the "play_type" column to be a "1" for pass plays and a "0" for run plays.

 ## Dataset Overiew

First, let us examine the first few rows of the dataset:

![Screenshot 2025-04-20 155824](https://github.com/user-attachments/assets/28a85791-3297-4498-b34e-d85c0ae127bd)
![Screenshot 2025-04-20 155833](https://github.com/user-attachments/assets/d4c2a98e-0443-4f23-8131-801c1811d4cc)

Each row of the dataset gives us information on one play, with 318668 plays in total. The first column, "yardline_100", tells us about the field position, with values ranging from 1-99. A value of 1 would mean the team is 1 yard away from the opposing team's endzone, while a value of 99 would mean they are 1 yard from their own endzone. "half_seconds_remaining" and "game_seconds_remaining" tell us how many seconds are left in the half and in the game, respectively. There are 3600 seconds in and NFL game, and thus 1800 seconds in a half. "down" tells us what down it is, ranging from 1-4. "ydstogo" tells us how many yard to a first down. "posteam_timeouts_remaining" and "defteam_timeouts_remaining" tells us how many timeouts each team has, from 0-3. Finally, the "score_differential" column tells us how many points the team with the ball is up or down by.

## Analyzing the Data

First, let us see how common pass and run plays are overall. 

