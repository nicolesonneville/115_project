library(tidyverse)

files <- list.files(path = "./data/", pattern = "*.csv", full.names = TRUE)

raw_data <- map_df(files, ~read_csv(.x, 
                                    show_col_types = FALSE,
                                    col_select = -Rk) %>%  # This drops 'Rk' immediately
                     mutate(year = str_extract(.x, "\\d{4}")))

clean_data <- raw_data %>% 
  filter(Pos == 'QB') %>% # filter to keep only quarterbacks
  filter(GS > 3) %>% # filter out players who have played only a few games
  filter(Att > 50) %>% # filter out players who did not attempt many passes
  # this portion removes players who appear multiple times in the same year, because they were on 2 teams
  # the row with the most games started will have the entire season long data, so we keep that
  group_by(Player, year) %>% 
  slice_max(order_by = GS, n = 1, with_ties = FALSE) %>% 
  ungroup() %>%
  separate(QBrec, into = c("Wins"), sep = "-", extra = "drop", convert = TRUE) %>% # extract number of wins
  select(
    c("year", "Player", "Age", "GS", "Wins", "Cmp", "Att", "Cmp%","Yds...11", "TD", "Int", "Succ%", "Rate", "QBR", "Sk")
  ) %>% 
  rename(Yards = Yds...11, Completions = Cmp, Attempts = Att, Comp_Percentage = `Cmp%`,Interceptions = Int, Sacks = Sk) # rename column for cleanliness

# write clean data to a csv file for usage in other files
write_csv(clean_data, "./data/cleaned_data.csv")

# read_csv("./data/cleaned_data.csv")
