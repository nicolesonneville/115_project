library(tidyverse)

files <- list.files(path = "./data/", pattern = "*.csv", full.names = TRUE)

raw_data <- map_df(files, ~read_csv(.x, show_col_types = FALSE) %>% 
                     mutate(year = str_extract(.x, "\\d{4}")), # Extracts the 4-digit year from filename
                   .id = "source")

clean_data <- data %>% 
  filter(Pos == 'QB') %>% # filter to keep only quarterbacks
  filter(GS > 3) %>% # filter out players who have played only a few games
  separate(QBrec, into = c("Wins"), sep = "-", extra = "drop", convert = TRUE) %>% # extract number of wins
  select(
    c("year", "Player", "Age", "GS", "Wins", "Cmp", "Att", "Yds...12", "TD", "Int", "Succ%", "Rate", "QBR", "Sk")
  ) %>% 
  rename(Yards = Yds...12, Completions = Cmp, Attempts = Att, Interceptions = Int, Sacks = Sk) # rename column for cleanliness

