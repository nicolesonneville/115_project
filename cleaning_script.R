data <- read_csv('../data/2025.csv')

head(data)

clean_data <- data %>% 
  filter(Pos == 'QB') %>% # filter to keep only quarterbacks
  filter(GS > 3) %>% # filter out players who have played only a few games
  separate(QBrec, into = c("Wins"), sep = "-", extra = "drop", convert = TRUE) %>% # extract number of wins
  select(
    c("Rk", "Player", "Age", "GS", "Wins", "Cmp", "Att", "Yds...12", "TD", "Int", "Succ%", "Rate", "QBR", "Sk")
  ) %>% 
  rename(Yards = Yds...12) # rename column for cleanliness
