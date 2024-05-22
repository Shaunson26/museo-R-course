## Summarise and group_by ------------------------------------------------------

# We have seen how to group data and then summarise values. Now it's your turn!

# Replace _ to complete expressions and return the correct answer

# Restart R to remove previous results using: Ctrl/Cmd + shift + F10


library(readr)
library(dplyr)

# We will use 3 datasets. Two you are already familiar with.
herbivores <-
  read_csv("data/herbivore_specialisation.csv")

covid <-
  read_csv("data/covid.csv", col_types = cols(dateRep = col_date(format="%d/%m/%Y")))

# Patient visits and whether they had illness symptoms
#
# subject - subject identifier
# visit_date - date of visit
# had_symptoms - whether the patient had illness symptoms

patient_visits <-
  read_csv(file = 'data/patient_visits.csv')


## 1. Summarising data by groups ---

# Remember
# data %>% 
#   group_by(column_name) %>% 
#   summarise(x = ...)

# Obtain the mean value of MacroalgaeMass by MacroalgaeHabitat
herbivores %>% 
  _

# Obtain the mean value of MacroalgaeMass by MacroalgaeHabitat and DayNight
herbivores %>% 
  _


# Obtain the mean and sd for the total number of Ampithoe species
# per gram of macroalgae by MacroalgaeHabitat and DayNight. 
# Note: You will need to mutate the data before summarising
herbivores %>% 
  _


# Obtain the total cases and deaths by country and year. There should not be any
# NA values
covid %>% 
  _


## 2. Other uses for group_by ---

# We do not always need to summarise data with group_by. We may need to just do
# calculations per group

# Remember
# data %>% 
#   group_by(column_name) %>% 
#   mutate(column3 = column1 + column2_

# Calculate the follow up time for each subject in patient_visits. This is the
# difference between the current visit date and the first visit date. Remember to
# ungroup() when you're finished
patient_visits %>% 
  group_by(_) %>% 
  mutate(follow_up = _)

# Obtain the cumulative case and death counts for each country and report date.
# 1.Return only the columns: dateRep, countriesAndTerritories, cases, deaths and the
# two new cumulative counts columns you make.
# 2. Return the data arranged by countriesAndTerritories and then dateRep
# Note: the data should be arranged first. Remember to ungroup() when you're finished
covid %>% 
 _




## Conclusion ---
# We have explored
# - grouping by different variables
# - summarising values
# - using grouping to do calculations within groups