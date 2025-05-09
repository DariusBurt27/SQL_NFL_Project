# Analyzing NFL Data in SQL
In this project I use SQL to analyze data on NFL plays from the 2009 NFL season to the 2018 NFL season. I downloaded the dataset from Kaggle which can be found [here](https://www.kaggle.com/datasets/kendallgillies/nflstatistics). I first cleaned and formatted the data using the Pandas library in Python. I was primarily focused on what factors contributed to a team either running or passing the ball, so I removed many unnecessary columns, leaving only 9 that I thought were relevant. I also filtered the data to only pass and run plays, leaving out other play types like kickoffs and field goals. Finally, I changed the "play_type" column to be a "1" for pass plays and a "0" for run plays.

 ## Dataset Overiew

First, let us examine the first few rows of the dataset:

![Screenshot 2025-04-20 155824](https://github.com/user-attachments/assets/28a85791-3297-4498-b34e-d85c0ae127bd)
![Screenshot 2025-04-20 155833](https://github.com/user-attachments/assets/d4c2a98e-0443-4f23-8131-801c1811d4cc)

Each row of the dataset gives us information on one play, with 318668 plays in total. The first column, "yardline_100", tells us about the field position, with values ranging from 1-99. A value of 1 would mean the team is 1 yard away from the opposing team's endzone, while a value of 99 would mean they are 1 yard from their own endzone. "half_seconds_remaining" and "game_seconds_remaining" tell us how many seconds are left in the half and in the game, respectively. There are 3600 seconds in and NFL game, and thus 1800 seconds in a half. "down" tells us what down it is, ranging from 1-4. "ydstogo" tells us how many yard until a first down. "posteam_timeouts_remaining" and "defteam_timeouts_remaining" tell us how many timeouts each team has, from 0-3. Finally, the "score_differential" column tells us how many points the team with the ball is up or down by.

## Analyzing the Data

First, let us see how common pass and run plays are overall:

![Screenshot 2025-04-20 160545](https://github.com/user-attachments/assets/1f22dba7-428f-46ec-81b8-24597d1bbe54)
![Screenshot 2025-04-20 160555](https://github.com/user-attachments/assets/6de8c3cf-e4d0-4874-82bb-708f8812ce7c)

It appears that pass plays are more common, comprising about 58% of plays. This makes sense as pass plays result in more yards gained on average, although they are a bit less consistent at gaining yards than run plays.

Next, we will examine how down and distance affect play type. I filter the data to only show groups with counts over 100 so that we have a decent sample size to make conclusions from:

![Screenshot 2025-04-20 160829](https://github.com/user-attachments/assets/f959e745-ce18-4ba2-8b61-084a155932e5)
![Screenshot 2025-04-20 160853](https://github.com/user-attachments/assets/adcfe549-2a99-49a8-bf29-b1a7c4220c98)

We can see from the first few rows that later downs with more yards to go tend to correspond to a higher percentage of passing plays. If we scroll to the bottom we can see many of the plays with the highest percentage of run plays correspond to earlier downs with less yards to go. This is likely due to pass plays having a higher average result in yards gained. When a lot of yards are needed and there are not many chances left to get those yards, teams opt to pass. The opposite is true for run plays. Since they are more consistent at gaining yards, if only a few are needed and there are many chances left for a first down, teams opt to run. 

Next, we will examine how field position affects play type. Once again I have filtered the data to only show groups with counts over 100:

![Screenshot 2025-04-20 175240](https://github.com/user-attachments/assets/c9c362f3-c6de-482b-abac-50c46817067b)
![Screenshot 2025-04-20 175318](https://github.com/user-attachments/assets/f8bf4f30-4b9a-4bd5-848e-a51cf613216a)

The most obvious theme we see in the results is that situations with high percentages of run plays tend to be near either goal line. Once again we can attribute this to the consistancy of run plays. If only a few yards are needed to get into the endzone and score, run plays are often chosen. Similarly, if a team is backed up near its own goal line, they want to avoid losing yards as much as possible as they might end up getting a safety, so they opt for the more consistant choice of a run play.

We can further illustrate this idea by making field position groups, showing the percent of pass/run plays in each group:

![Screenshot 2025-04-20 180140](https://github.com/user-attachments/assets/f3829659-54d9-459f-98c4-209982934d18)
![Screenshot 2025-04-20 180153](https://github.com/user-attachments/assets/f21d00b8-d3fb-46a2-9ef2-eaf921eba5c4)

The results show Group1 and Group6, the 2 groups where the team is close to either goal line, have the highest percentage of run plays. 

Next, we will examine how score differential affects play type: 

![Screenshot 2025-04-20 180424](https://github.com/user-attachments/assets/0757eeb4-b8ca-403c-82ad-bb7bcbff021a)
![Screenshot 2025-04-20 180457](https://github.com/user-attachments/assets/391bf3fd-4a33-4cdb-afc4-fa4bfa84b81b)

We can see that many of the situations with the highest percentage of pass plays happen when the team is down by a lot. Pass plays tend to result in more yards, so if a team needs to score a lot, they will be more likely to pass. Though they are less consistent, teams are willing to take the risk due to the deficit they must overcome. When teams are up by a lot, they will be more likely to run the ball. Since they are already winning, they just want to preserve their lead and run out the clock. Running the ball helps keep the clock moving, so teams that are ahead are more likely to run than pass. 

Finally, similarily to the field position situation, we can make different groups for different score differential ranges:

![Screenshot 2025-04-20 181557](https://github.com/user-attachments/assets/8be06e67-26db-4c81-8e31-d30bdd2ee42c)
![Screenshot 2025-04-20 181609](https://github.com/user-attachments/assets/f4495fd5-787f-49d5-a1c7-deb66261853e)

The results further illustrate our point, although there is an interesting situation with Group11, the group where the team is down by the most. Strangely, it does not correspond to the highest likelihood of a pass play, with Group9 and Group10 corresponding to a higher likelihood of passing. I think we can attribute this to teams being more likely to just give up. Sometimes, if it is near the end of the game and the team with the ball is losing by a lot, they might realize they have little chance of winning and just run the ball to end the game as soon as possible and move on. 

## Conclusions

We have observed many interesting trends in play selection for NFL games. Teams tend to choose pass plays when they need a lot of yards, whether being due to them being down by a lot of points or needing a lot of yards to get a first down and keep the drive alive. Passing plays, however, are not as consistent as run plays. Running the ball has a higher chance of gaining yards than a pass play, although the yards gained are often not extremely high. Teams thus tend to leverage run plays when they only need a few yards, whether that be until a first down or until they reach the opponent's endzone. Teams also utilize run plays to run down the clock. If they are already winning by a lot, they don't need the potential upside that passing plays offer, preferring to run the clock down and end the game as quick as possible. 

