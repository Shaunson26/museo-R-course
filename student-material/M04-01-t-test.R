## Two sample t-test------------------------------------------------------------

# Let's compare the means of two samples using independent t-test and paired t-test.

# Replace _ to complete expressions and return the correct answer

# Restart R to remove previous results using: Ctrl/Cmd + shift + F10

# Remember - try to use google to help you answer questions


# Packages required
library(dplyr)
library(tidyr)
library(ggplot2)

## 1. Two-sample t-test ----

# River_pH.csv contains pH measurements between two rivers. A researcher is 
# interested if the mean pH is different between the two rivers.

# 1.1 Import data ---- 
# Import River_pH.csv from the data folder
river_ph <-
  readr::read_csv(_)

# Examine the dataset in the console
# How many columns are there?
# How many values of River_name are there?
# How many samples in each group?
_


# 1.2 Visualise ---- 
# Visualise the data using a boxplot
# Does there appear to be a difference in pH?
river_ph %>% 
  ggplot(aes(x = _, y = _)) +
  _()

# Update the axes labels, add a title, and export the plot as a png with 
# dimensions 100 x 100 mm to the outputs folder
ggsave(_)


# 1.3 Summarise ---- 
# Obtain a data summary including
# - the number of samples
# - mean
# - standard deviation (sd)
# - standard error ( sd / sqrt(n) )
river_ph_data_summary <-
  river_ph %>% 
  group_by(_) %>% 
  summarise(
    n_samples = n(),
    mean_pH = _(_),
    sd_pH = _(_),
    se_pH = sd_pH / sqrt(n_samples)
  )

river_ph_data_summary


# 1.4 Conduct t-test ----

# What is the null hypothesis here?


# Conduct a t.test of pH between rivers.
# Assume equal variances (var.equal = T)
# Rememeber to use a formula y ~ x
t.test(, data = _, var.equal = _)

# Write a short summary sentence
#



# The following is to be completed in your own time, or if you finish the above
# in class.


## 2. Paired t-test ----

# madrid-weather-monthly-2010-2020.csv contains daily temperature, humidity and
# precipitation every two years from 2010 to 2020.

# A researcher wants to know if there is a difference in monthly temperature, on
# average, between the year 2010 and the year 2020. We will pair the months from
# each year and conduct a paired t-test.

# 2.1 Import data ----
madrid_weather <-
  readr::read_csv(_)

# 2.2 Prepare data ---
# Filter the data for the years 2010 and 2020
# Summarise the daily data by year and month to obtain mean monthly Temperature_C
madrid_weather_monthly_2010_2020 <-
  madrid_weather %>% 
  filter(year %in% c(_)) %>% 
  group_by(_, _) %>% 
  summarise(
    Temperature_C = mean(_),
    .groups = 'drop'
  )

# Next you need to pivot the data so there are 2 columns of monthly data from
# 2010 and 2020
madrid_weather_monthly_2010_2020_wide <-
  madrid_weather_monthly_2010_2020 %>% 
  pivot_wider(names_from = _,
              values_from = _,
              names_prefix = 'year_')

# 2.3 Plot the data ---
# There a different ways to do this. To save time, I've provided a two

# Using a line graph
# Plot monthly temperature as two coloured lines from each year
# There should only be 2 values in the legend
madrid_weather_monthly_2010_2020 %>% 
  ggplot(aes(x = _, y = _, color = _)) +
  _

# Boxplot of differences
# Calculate the difference between 2020 and 2010
# Then use a boxplot to plot the calculated difference
madrid_weather_monthly_2010_2020_wide %>% 
  mutate(temp_difference = _ - _) %>% 
  ggplot(aes(x = _)) +
  _ +
  scale_y_continuous(limits = c(-1,1),
                     breaks = NULL) +
  geom_vline(xintercept = 0, linetype = 'dashed') +
  labs(title = 'Monthly temperature difference between 2020 and 2010',
       x = 'Temperature')

# Finalise the plot and expor to the outputs folder
ggave(_)


# 2.4 Paired t-test ---

# What is the null hypothesis here?


# Conduct a paired t-test
# Remember to provide the arguments x and y the columns of the data, and to
# use the argument paired = TRUE
t.test(
  x = _,
  y = _,
  paired = _
)

# Write a short summary sentence
#



## Conclusion ----
# We examined
# - independent t-test
# - paired t-test
# - reviewed some data manipulation
# - reviewed some data visualisation
