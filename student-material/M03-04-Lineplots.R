## Lineplots -------------------------------------------------------------------

# Lineplots usually connect values by time. Users often need to specific groups
# and do some data preparation to ensure separate lines are drawn.

# Replace _ to complete expressions and return the correct answer

# Restart R to remove previous results using: Ctrl/Cmd + shift + F10

# Remember - try to use google to help you answer questions



# Packages required
library(dplyr)
library(ggplot2)


## 1. Line plots ----

# madrid-weather-monthly-2010-2020.csv contains daily temperature, humidity and
# precipitation every two years from 2010 to 2020.

# 1.1 Import madrid-weather-monthly-2010-2020.csv ----
madrid_weather <-
  readr::read_csv("data/madrid-weather-monthly-2010-2020.csv")

# Examine the first 10 rows of the data
madrid_weather

# Create a new dataset that is the mean temperature by year and month
# That is, summarise Temperature_C by year and month
madrid_weather_monthly <-
  madrid_weather %>% 
  group_by(year, month) %>% 
  summarise(
    Temperature_C = mean(Temperature_C),
    .groups = 'drop'
  )

# 1.2 Create a line plot ----
# Create a line plot of monthly temperatures for each year in the dataset
madrid_weather_monthly %>% 
  ggplot(aes(x = month, y = Temperature_C, group = year)) +
  geom_line()

# Try using the colour aesthetic instead of group
# What went wrong? What type of column is year?
# How can you make a grouping column?
madrid_weather_monthly %>% 
  ggplot(aes(x = month, y = Temperature_C, colour = factor(year))) +
  geom_line()

# 1.3 Edit the x axis breaks ----
# We want to make the values on the x axis the numbers of the month

# Use scale_x_continuous to update the breaks to be 1 to 12.
madrid_weather_monthly %>% 
  ggplot(aes(x = month, y = Temperature_C, colour = factor(year))) +
  geom_line() +
  scale_x_continuous(breaks = 1:12)


# 1.4 Change the x axis labels ----
# We can further provide what values should go at the 12 axis breaks
# Remember the Constants built into R? Month names are one of them
# ?Constants

# Update scale_x_continuous to include the labels argument with the month.abb
# vector
madrid_weather_monthly %>% 
  ggplot(aes(x = month, y = Temperature_C, colour = factor(year))) +
  geom_line() +
  scale_x_continuous(breaks = 1:12,
                     labels = month.abb)


# 1.5 Finalise the plot ----
# Update the labels for x, y and colour
madrid_weather_monthly %>% 
  ggplot(aes(x = month, y = Temperature_C, colour = factor(year))) +
  geom_line() +
  scale_x_continuous(breaks = 1:12,
                     labels = month.abb) +
  labs(colour = 'Year',
       x = "Month",
       y = 'Temperature (\u00B0 C)')



# 2 Extra exercises
# lung_disease_deaths.tsv contains monthly deaths from bronchitis, emphysema and 
# asthma in the UK, 1974–1979, for males and females

# Make a line plot of the month deaths by year and gender
# You will need think about
# - dataset shape
# - unique groups
# - controlling value ordering .. month.abb can help you here

# What trend in the data do you see?
# Which months do most deaths occur?
# Is it different between sexes?
# Are there differences across years?
deaths <-
  read_delim('data/lung_disease_deaths.tsv')



## Conclusion ----
# We looked at
# - line plots
# - grouping with group and colour
# - creating groups (factors) out of numeric data
# - altering the xaxis
