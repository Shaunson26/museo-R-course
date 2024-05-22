## Join data -------------------------------------------------------------------

# We had a look at joining data and some issues associated with them. Apply your
# knowledge in these exercises.

# Replace _ to complete expressions and return the correct answer

# Restart R to remove previous results using: Ctrl/Cmd + shift + F10


# Packages required
library(readr)
library(dplyr)

# 1. Data ----

# There are 3 datasets relating the the nuber of foraging bats at different sites
# and dates, the geographical coordinates of the sites, and the weather for the month
# that samples were obtained

# Import bats_data.csv, bats_geography.csv, bats_weather.csv

bats <- read_csv('data/bats_data.csv')
bats_geo <- read_csv('data/bats_geography.csv')
bats_weather <- read_csv('data/bats_weather.csv')

# 1.2 Examine ----

# Examine the 3 datasets. Which columns contain the keys to link the datasets together?
# bats & bats_geo = _
# bats & bats_weather = _
# bats_geo & bats_weather = _
bats
bats_geo
bats_weather

# 1.3 First join ----

# Remember
# data_main %>%
#   left_join(data_meta, by = 'column_name')
  

# We will use left_join to join the 'bats_geo' and 'bats_weather' to the 'bats'.
# The primary dataset is 'bats' and we are adding metadata to it (geography and weather).
# We should quality check the join - there should be no additional rows after the join

# left_join 'bats_geo' to bats
bats_and_geo <-
  bats %>% 
  left_join(_)

# How can you check if the number of rows have changed?
_

# left_join 'bats_weather' to bats_and_geo
bats_and_geo_and_weather <-
  bats_and_geo %>% 
  _

# Have the number of rows changed?
_

# 1.4 Quality checking ----

# We should have to checked the keys (values in the joining columns) in the datasets 
# before joining. 

# Use count() to examine if keys are unique (one value per key)
bats %>% 
  count(_, _, sort = TRUE)

bats_geo %>% 
  count(_)

bats_weather %>% 
  _

# How could you fix the issue you have encountered?
# First examine the rows that have created the problem, and then find a solution
# to fix the issue and assign the output to 'bats_weather_unique'
bats_weather %>% 
  _

bats_weather_unique <-
  bats_weather %>% 
  _

# 1.5 Final join ----

# Now repeat the join. This time we will do them 1 set of chained operations
bats_geo_weather <-
  bats %>% 
  left_join(bats_geo, by = _) %>% 
  left_join(_, by = _)

nrow(bats_geo_weather) == nrow(bats) 

# 1.6 Final quality check ----
# The last step is to check we have data for all the rows we joined.

# We can use summarise() with anyNA() to check is there are any missing values
# Complete the following to check if there are any missing values
bats_geo_weather %>% 
  summarise(
    Latitude = anyNA(Latitude),
    Longitude = _,
    _ = _,
    _ = _
  )


# That took a lot of typing! 

# We can use a shortcut with across()
# Across applies a function across multiple columns
# ?across()
# Input the 4 columns of interest and see the same result
# Note: we used "anyNA" without ()
bats_geo_weather %>% 
  summarise(
    across(.cols = c(_, _, _, _),
           .fns = anyNA
    )
  )

## Conclusion ---
# We explored
# - left_join
# - conducting quality checks on joins

