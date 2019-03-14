**Data Dictionary for nba2018-players.csv**


Variables:

**team name(character):** Name of the team that the player is on for the shot
**game date(character):** Date that player made the shot
**season(integer):** Year of Season that player made the shot
**period(integer):** Which quarter player made the shot
**minutes_remaining(integer):** How many minutes left to play in the quarter the shot was made
**seconds_remaining(integer):** Number of seconds, appended to minutes_remaining, left in the quarter the shot was made
**shot_made_flag(character):** A flag that symbolizes whether a shot was made or not
**action_type(character):** What type of movement the player did to shoot the shot/what type of shot it was
**shot_type(factor):** What type of shot the player took
**shot_distance(integer):** How far the shot was from the hoop 
**opponent(character):** Opposing team of the game the shot was made
**x(integer):** Number of inches horizontally the player is from the basket during the shot. Negative values mean the left side of the basket, and positive values mean the right side of the basket
**y(integer):** Number of inches vertically the player is from the middle of the half court. Negative values mean below the divider, and postive values mean above the divider.