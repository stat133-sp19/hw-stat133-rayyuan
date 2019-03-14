workout01-ray-yuan
================
Ray Yuan
March 13, 2019

Introduction
------------

The Golden State Warriors have established themselves as arguably the best team in the NBA. A lot of that is attributed to their three core stares, Stephen Curry, Klay Thompson, and Kevin Durant. Stephen Curry and Klay Thompson, in particular, are known as the "Splash Brothers". Many opposing teams in the league focus their defense a lot on pressuring Curry to challenge his incredibly long range. However, Curry obviously can't score all the points, and thus an analysis of the shooting of the five Golden State Warrior starters can highlight the key locations where certain players take and make the most shots, as well as how accurate the starters are from different ranges on the basketball court. The purpose of this analysis is to explore the shooting patterns and percentages of the Golden State Warrior starters, and to create visualizations of their shooting locations.

Motivation
----------

The motivation of this analysis is to provide a detailed description of the shooting locations and accuracies of the Golden State Warrior starters. It is incredibly useful to analyze the core statistics of the Golden State Warrior starter shooting, such as their shooting percentages from 2-point range, shooting percentage from 3-point range, and overall shooting percentage. This is useful to see, since even if it seems like a player makes a good amount of threes, if their shooting percentage is low, it means their efficiency from three point range is not very productive. Thus, other teams might choose to not pressure that player as much from three if he has a lower three point percentage, since if you pressure someone really far out, you spread your defense out too much. Then, another motivation is for some more visualizations and some more detailed analysis. Thus, we included charts for each of the Golden State Warrior starters to elucidate the places where they shot from. This is helpful for us since even if we know the percentages, we don't really know where the shots are coming from, since a 2-point field goal is any shot from within the 3-point arc. So, if we include these shot charts, we can analyze more closely where in the entire ranges the players are shooting from, but also analyze and observe if there are locations where certain players like shooting from and are more accurate from, and places where they are not.

Background
----------

All of our analysis is performed in R. The tables we will include show the shooting percentages for 2-point field goals, 3-point field goals, and total field goals for each of the Golden State Warrior starters in 2016. All of the data we have collected is from the 2016 season, and this data stays relevant since each of the players in our analysis are still currently on the team today. Some more background on our visualization: Each players shot chart is overlayed on a basketball court image. Each dot represents the relative location on the court where the player took the shot.

Data and Analysis
-----------------

The first piece of data we will present are the tables detailing the various shooting percentages of the 5 Golden State Warriors players. Here is first the code I used to generate the tables.

``` r
gsw_shot_data <- read.csv("../data/shots-data.csv", stringsAsFactors = FALSE)
two_pt_data <- gsw_shot_data[gsw_shot_data$shot_type == "2PT Field Goal",]
three_pt_data <- gsw_shot_data[gsw_shot_data$shot_type == "3PT Field Goal",]


grouped_2pt_data <- group_by(two_pt_data, name)
twopt_effective <- arrange(summarise(grouped_2pt_data, total = n(), made = sum(shot_made_flag == "shot_yes"), percentage = made/total), desc(percentage))
grouped_3pt_data <- group_by(three_pt_data, name)
threept_effective <- arrange(summarise(grouped_3pt_data, total = n(), made = sum(shot_made_flag == "shot_yes"), percentage = made/total), desc(percentage))
grouped_shot_data <- group_by(gsw_shot_data, name)
total_effective <- arrange(summarise(grouped_shot_data, total = n(), made = sum(shot_made_flag == "shot_yes"), percentage = made/total), desc(percentage))
```

### Shooting percentage tables

| name           |  total|  made|  percentage|
|:---------------|------:|-----:|-----------:|
| Andre Iguodala |    210|   134|   0.6380952|
| Kevin Durant   |    643|   390|   0.6065319|
| Stephen Curry  |    563|   304|   0.5399645|
| Klay Thompson  |    640|   329|   0.5140625|
| Draymond Green |    346|   171|   0.4942197|

| name           |  total|  made|  percentage|
|:---------------|------:|-----:|-----------:|
| Klay Thompson  |    580|   246|   0.4241379|
| Stephen Curry  |    687|   280|   0.4075691|
| Kevin Durant   |    272|   105|   0.3860294|
| Andre Iguodala |    161|    58|   0.3602484|
| Draymond Green |    232|    74|   0.3189655|

| name           |  total|  made|  percentage|
|:---------------|------:|-----:|-----------:|
| Kevin Durant   |    915|   495|   0.5409836|
| Andre Iguodala |    371|   192|   0.5175202|
| Klay Thompson  |   1220|   575|   0.4713115|
| Stephen Curry  |   1250|   584|   0.4672000|
| Draymond Green |    578|   245|   0.4238754|
| Below          |       |      |            |
