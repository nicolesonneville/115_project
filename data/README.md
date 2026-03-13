## About the data

Our data is composed of various statistics for season long NFL passing data. We collected the data from Pro Football Reference, one of the most expansive websites for NFL statistics. We collected data from 11 NFL seasons, from 2015 to the most recent season, 2025. We have a csv of the raw data for each season(YEAR_data.csv), and also cleaned the raw data to meet our needs(cleaned_data.csv), which will be the main file we use for analysis.

## What does the data mean?
Since we are looking at quarterback accuracy, the most useful columns for us are Completions, Attempts, and Completion Percentage. Each datapoint is identified by looking at the combination of the quarterback name and year.

- Attempts: The number of passes a quarterback has attempted. In football, an attempt is counted whenever the quarterback throws the ball to a receiver down the field.
- Completions: The number of passes a quarterback has completed. This counts the pass attempts which result in a catch.
- Completion Percentage: The percentage of passes completed(Attempts / Completions).

## Cleaning the Data
The CSV files obtained from the Pro Football Reference site had many columns, and we cut down on the ones which were not useful for our analysis.

We found that some rows in the dataset had a low number of passes attempted, so we decided to make sure each player had played in enough games to get a good sample size. Additionally, there was data from non-quarterbacks. Since quarterbacks are the main throwers of the ball, we excluded any player whose position was not quarterback. We also found that there were some inconsistencies when a player had switched teams in one year. We found that the row with the most amount of data(ex. most games played) referred to a player's season long stats(combining the tenures on multiple teams in 1 year), and removed all other rows from that year, since they referred to the partial tenure of the player on one team. 

## Source
- Pro Football Reference: https://www.pro-football-reference.com/
- Example Page: https://www.pro-football-reference.com/years/2024/passing.htm#passing::pass_cmp