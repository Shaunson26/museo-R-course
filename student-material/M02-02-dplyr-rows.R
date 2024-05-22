## Manipulation of data.frame rows ---------------------------------------------

# We examined some dplyr functions to manipulate the rows of a data.frame. Now 
# it is your turn

# Replace _ to complete expressions and return the correct answer

# Restart R to remove previous results using: Ctrl/Cmd + shift + F10


# Packages required
library(dplyr)

# 1. Import data ----
# We will use a COVID-19 dataset to examine dplyr row functions
# Each row/entry contains the number of new cases and deaths reported per day and per country in the EU/EEA.
#
#  dateRep = Date of reporting
#  day
#  month
#  year
#  cases - Number of newly reported cases
#  deaths = Number of newly reported deaths
#  countriesAndTerritories = Name of country or territory
#  geoId = 2-letter country code
#  countryterritoryCode = 3-letter ISO country code
#  popData2020 = Eurostat 2020 population estimate
#  continentExp = Name of continent reporting

covid <- 
  readr::read_csv("data/covid.csv", col_types = cols(dateRep = col_date(format = '%d/%m/%Y')))

covid

## 1. First steps in dplyr ----
#
# verb(data, actions, ...)

# 1.1 ----
# data[ rows, columns]
# data[ data$column_name == 'value', ]
#
# filter(data, column_name == 'value')

# Filter the covid dataset for countriesAndTerritories == 'France' using:
# 1. indexing
# 2. dplyr filter()
covid[,]
filter()

# Select the columns dateRep, cases, countriesAndTerritories, using:
# 1. indexing
# 2. dplyr select()
covid[,]
select()

# 1.2 Using the pipe ----

# data %>% function(arguments)
# covid %>% filter(column_name == 'value')

# Use the pipe operator to filter for countriesAndTerritories == 'France'
_

# Use the pipe operator to select the columns dateRep, cases, countriesAndTerritories
_

# Use the pipe operator to count the number of different countriesAndTerritories.
_



## 2. Filter rows ----

# We use conditional section for filtering rows

# > - "greater than"
# < -"less than"
# >= -"greater than or equal to"
# <= -"less than or equal to"
# == - "equal to"
# != -"not equal to." The ! is used in many programming languages to indicate "not."

# Furthermore, you can combine multiple criteria using operators that make comparisons:
  
## | "or"
# & - "and"

# Remember:
# covid %>% filter(column_name == 'value')

# How many rows of data had `deaths` greater than 1000?
covid %>% 
  _

# How many rows of data had greater than 1000 deaths and greater than 10000 cases?
covid %>% 
  _


# How many rows are from Spain? Use the `countriesAndTerritories` column
covid %>% 
  _

# How many rows are from the Scandinavian Peninsula?
# In includes the countries: Sweden, Norway and Finland
covid %>% 
 _


## 3. Arrange ----

# Remember:
# covid %>% arrange(column_name)

# What is the earliest report date in the data?
_


# What is the latest report date in the data?


# Which country had the most cases, and on what date?
_


# What dates had the most cases in Spain?
_


## 4. Distinct ----

# Remember:
# covid %>% distinct(column_name)

# Obtain the unique values of country names and their 3-letter ISO country code
_


# Obtain the last report date data row for each country
_





## Conclusion ----
# We have explored
# - filtering rows using conditional selection
# - re-arranging the data
# - obtaining distinct values from the data
# - combining these operations

