## Manipulation of data.frame columns ------------------------------------------

# We have seen how select and create columns in dplyr. Now it is your turn.

# Replace _ to complete expressions and return the correct answer

# Restart R to remove previous results using: Ctrl/Cmd + shift + F10

# Packages required
library(dplyr)

# Update the minimum number rows printed in a tibble (so we can see all the data here)
options(pillar.print_min = 20) 


# 1. Import datasets ----

# Herbivores is a datasets examining the counts of amphipods on macroalgae
# marine environment during the day and night
#
#  MacroalgaeHabitat - host macroalgae species
#  DayNight - day or night
#  Replicate - replicate number
#  MacroalgaeMass - mass of macroalgae sampled   
#  Ampithoe_caddi - count of amphipod species
#  Ampithoe_kava - count of amphipod species   
#  Ampithoe_ngana - count of amphipod species

herbivores <-
  readr::read_csv("data/herbivore_specialisation.csv")

# Hospital is a hospital administration dataset

# episode_start_date - date of admission
# gender - patient gender
# age - patient age
# area_residence - area of residence code
# diagnosis_code1 - diagnosis_code10 - Codes for reasons for entry to hospital
# procedure_code1 - procedure_code110 - Codes for procedures conducted in hospital

hospital <-
  readr::read_delim('data/hospital2.txt', delim = '\t')


students <-
  readr::read_csv("data/students.csv")


## 2. Mutate ----

# 2.1 ----

# Remember:
# data %>% 
#   mutate(column_name = ...,
#          column_name2 = ...,)

# A researcher wants to calculate the total abundance of the genus Ampithoe
# per gram of macroalgae

# a. Create column that is the sum of the three Ampithoe species counts
# b. Create a column that is the total count / the mass of the macroalgae
herbivores %>% 
  _


# There are two factors in this experiment: MacroalgaeHabitat, DayNight.
# A researcher wants to combine the values so they are in a single column. 
# We can paste those column values together using paste()
# Paste the two columns together with ":" as the separator
herbivores %>% 
  mutate(MacHabDayNight = paste(_, _, sep = _))
    

# 2.2 ----

# There are some typographic errors in the gender column of hospital. The values
# should be 'F', 'M' and 'U' only. We can use mutate and case_when to update those 
# values.
hospital %>% 
  count(gender)

hospital_fixed <-
  hospital %>% 
  mutate(gender = case_when(
    gender == 'Fem' ~ 'F',  # if gender is "Fem" replace with F 
    gender == _ ~ _,        # do the same for the error with Ma and M
    .default = gender       # If the above is not found, return the value of gender
  )) 

# did it work?
hospital_fixed %>% 
  count(gender)             

# 2.3 ----
# We can repeatedly alter the same column within mutate()

# Fix the AGE column in students
# - convert 'five' to '5', then
# - convert to a numeric column using as.numeric()
students %>% 
  mutate(
    AGE = _,
    AGE = _
  )


## 3. Select ----

# Remember
# data %>% 
#   select(column_name1, column_name2)

# Select the gender, age and weight columns
hospital


# A researcher wants the first 4 columns of patient data and first 5 (of 10) 
# diagnosis columns before moving on with their analysis.

# There are 2 different ways to select the diagnosis columns, 1 using helper functions
?dplyr::select # help for select
?tidyselect::language # help for the helper functions

# Note: values need to be in quotation ""
# data %>% 
#   select(any_of("column_name1", "column_name2"))

hospital %>% 
  dplyr::select(_)

hospital %>% 
  dplyr::select(_)

# Another researcher just wants all the columns with diagnosis_code and procedure_code.

# How could you select them using a helper function?
_




## Conclusion ----
# We have explored
# - column creation with mutate()
# - value updating with mutate()
# - ways to select columns

