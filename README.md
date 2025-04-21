# Analyzing NFL Data in SQL
 In this project I use SQL to analyze data on NFL plays from the 2009 NFL season to the 2018 NFL season. I downloaded the dataset from Kaggle which can be found [here](https://www.kaggle.com/datasets/kendallgillies/nflstatistics). I first cleaned and formatted the data using the Pandas library in Python. I was primarily focused on what factors contributed to a team either running or passing the ball, so I removed many unnecessary columns, leaving only 9 that I thought were relevant. I also filtered the data to only pass and run plays, leaving out other play types like kickoffs and field goals. Finally, I changed the "play_type" column to be a "1" for pass plays and a "0" for run plays.

 ## Dataset Overiew

First, let us examine the first few rows of the dataset:

![Screenshot 2025-04-20 155824](https://github.com/user-attachments/assets/28a85791-3297-4498-b34e-d85c0ae127bd)
![Screenshot 2025-04-20 155833](https://github.com/user-attachments/assets/d4c2a98e-0443-4f23-8131-801c1811d4cc)

Each row of the dataset gives us information on one play, with 318668 plays in total. The first column, "yardline_100", tells us about the field position, with values ranging from 1-99. A value of 1 would mean the team is 1 yard away from the opposing team's endzone, while a value of 99 would mean they are 1 yard from their own endzone. "half_seconds_remaining" and "game_seconds_remaining" tell us how many seconds are left in the half and in the game, respectively. There are 3600 seconds in and NFL game, and thus 1800 seconds in a half. "down" tells us what down it is, ranging from 1-4. "ydstogo" tells us how many yard to a first down. "posteam_timeouts_remaining" and "defteam_timeouts_remaining" tells us how many timeouts each team has, from 0-3. Finally, the "score_differential" column tells us how many points the team with the ball is up or down by.

## Analyzing the Data

First, let us see how common pass and run plays are overall:

![Screenshot 2025-04-20 160545](https://github.com/user-attachments/assets/1f22dba7-428f-46ec-81b8-24597d1bbe54)
![Screenshot 2025-04-20 160555](https://github.com/user-attachments/assets/6de8c3cf-e4d0-4874-82bb-708f8812ce7c)

It appears that pass plays are more common, comprising about 58% of plays. This makes sense as pass plays result in more yards gained on average, although they are a bit less consistent at gaining yards than run plays.

Next, we will examine how down and distance affect play type. I filter the data to only show groups with counts over 100 so that we have a decent sample size to make conclusions from:

![Screenshot 2025-04-20 160829](https://github.com/user-attachments/assets/f959e745-ce18-4ba2-8b61-084a155932e5)
![Screenshot 2025-04-20 160853](https://github.com/user-attachments/assets/adcfe549-2a99-49a8-bf29-b1a7c4220c98)

We can see from the first few rows that later down with more yards to go tend to correspond a higher percentage of passing plays. If we scroll to the bottom we can see many of the plays with the highest percentage of run plays correspond to earlier downs with less yards to go. This is likely due to pass plays having a higher average result in yards gained. When a lot of yards are needed and there are not many chances left to get those yards, teams opt to pass. The opposite is true for run plays. Since they are more consistent at gaining yards, if only a few are needed and there are many chances left for a first down, teams opt to run. 

Next, we will examine how field position affects play type. Once again I have filtered the data to only show groups with counts over 100:

![Screenshot 2025-04-20 175240](https://github.com/user-attachments/assets/c9c362f3-c6de-482b-abac-50c46817067b)
![Screenshot 2025-04-20 175318](https://github.com/user-attachments/assets/f8bf4f30-4b9a-4bd5-848e-a51cf613216a)

The most obvious theme we see in the results is that situations with high percentages of run plays tend to be near either goal line. Once again we can attribute this to the consistancy of run plays. If only a few yards are needed to get into the endzone and score, run plays are often chosen. Similarly, if a team is backed up near its own goal line, they want to avoid losing yards as much as possible as they might end up getting a safety, so they opt for the more consistant choice of a run play.
