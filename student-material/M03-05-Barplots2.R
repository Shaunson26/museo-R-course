## Bar plots--------------------------------------------------------------------

# Bar plots are very common, so we need to learn how to make them. I would favour
# other plots over bar plots unless they are completely necessary.

# Replace _ to complete expressions and return the correct answer

# Restart R to remove previous results using: Ctrl/Cmd + shift + F10

# Remember - try to use google to help you answer questions



# Packages required
library(dplyr)
library(ggplot2)


## 1. Barplots ----

# 1.1 Import the data ----
# Fish lengths measures the length of fish captures from sites that differ
# by marine park protection category (Management) and whether there is urbanisation
# located near the site (Shore)
fish <-
  readr::read_rds("")

fish_summary <-
  fish %>% 
  group_by(_, _) %>% 
  summarise(
    n_samples = n(),
    mean_length = mean(_),
    se_length = sd(_) / sqrt(_),
    .groups = 'drop'
  )


# 1.2 Create a barplot
# Create a barplot  of fish mean length by management and shore
fish_summary %>% 
  ggplot(aes(x = _, y = _, fill = _)) +
  geom_col(position = _)



# 1.3 Add error bars ----
# Add error bars by including a geom_errorbar
# Alter the width values to see how they affect error bar width and position
fish_summary %>% 
  ggplot(aes(x = Management, y = mean_length, fill = Shore)) +
  geom_col(position = 'dodge') +
  geom_errorbar(mapping = aes(ymin = _ - _,
                              ymax = _ + _),
                width = 0.5,
                position =  position_dodge(width = 0.9))


# 1.4 Change bar fill and line colour ----
# 1. Change the bar outline colour to black
# 2. Use scale_fill_manual() and provide a named vector to the values argument
#    to change the bar fill colours to: Natural = 'white' and Urbanised = "grey50"
fish_summary %>% 
  ggplot(aes(x = Management, y = mean_length, fill = Shore)) +
  geom_col(position = 'dodge', _) +
  geom_errorbar(mapping = aes(ymin = mean_length - se_length,
                              ymax = mean_length + se_length),
                width = 0.5,
                position =  position_dodge(width = 0.9)) +
  scale_fill_manual(values = c(_))


# 2.0 Extra exercises ----
# Import the covid.csv, and plot the monthly number of cases for Spain using 
# a barplot. This is an "epidemic-curve"
# Can you identify periods of outbreak?
covid <-
  readr::read_csv('data/covid.csv')



## Conclusion ----
# We examined
# - making barplots
# - including aesthetics
# - adding error bars
# - changing colours
