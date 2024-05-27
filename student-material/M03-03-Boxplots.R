## Boxplots --------------------------------------------------------------------

# Boxplots are very simple and useful. We may often need to do some data preparation
# before making them

# Replace _ to complete expressions and return the correct answer

# Restart R to remove previous results using: Ctrl/Cmd + shift + F10

# Remember - try to use google to help you answer questions



# Packages required
library(dplyr)
library(ggplot2)


## 1. Boxplots ----

# 1.1 Import the herbivores ----
herbivores <- 
  readr::read_csv('data/herbivore_specialisation.csv')

# Shorten MacroalgaeHabitat names e.g. Colpomenia_peregrina to C.peregrina
herbivores <-
  herbivores %>% 
  mutate(MacroalgaeHabitat = sub('(.).*_', '\\1.', MacroalgaeHabitat))


# Combine the counts of Ampithoe and create a total counts per algae biomass
# column
herbivores <-
  herbivores %>% 
  mutate(total = Ampithoe_caddi + Ampithoe_kava + Ampithoe_ngana,
         total_per_mg = total / MacroalgaeMass)


# Remember
# fill controls box colour
# alpha controls the transparency

# 1.2 Boxplot of Ampithoe species by macroalgae habitat ----
# Create a boxplot of total_per_mg by MacroalgaeHabitat
herbivores %>% 
  ggplot(aes(x = MacroalgaeHabitat, y = total_per_mg)) +
  geom_boxplot()

# 1.3 Altering the x-axis order ----
# This section is more a tutorial for you to follow. It requires you to link different
# objects together

# The x-axis groups are in alphabetical order as the column MacroalgaeHabitat is 
# currently a 'character'

# Examine the dataset and confirm MacroalgaeHabitat is character
herbivores

# We can turn this column into a factor column: a special grouping column in R
# Then we can alter the order of the levels how we wish
herbivores <-
  herbivores %>% 
  mutate(MacroalgaeHabitat = factor(MacroalgaeHabitat))

# See it is now a factor column <fct>
herbivores

# The current levels alphabetically, as in the plot
levels(herbivores$MacroalgaeHabitat)

# Now, if we create a summary dataset by:
# 1. calculating mean total_per_mg by MacroalgaeHabitat
# 2. Arrange the data by mean
# 3. The MacroalgaeHabitat column will have unique values of MacroalgaeHabitat in abundance order
herbivores_summary <-
  herbivores %>% 
  group_by(MacroalgaeHabitat) %>% 
  summarise(total_per_mg = mean(total_per_mg)) %>% 
  arrange(desc(total_per_mg))

herbivores_summary

# Observe the value order vs the levels order (levels is still alphabetical)
herbivores_summary$MacroalgaeHabitat

# We can pass on the unique values of MacroalgaeHabitat in abundance order to
# factor(..., levels) to control the level order in the original herbivores dataset
herbivores <-
  herbivores %>% 
  mutate(MacroalgaeHabitat = factor(MacroalgaeHabitat, 
                                    levels = herbivores_summary$MacroalgaeHabitat))

# The boxplot with x axis reordered
herbivores %>% 
  ggplot(aes(x = MacroalgaeHabitat, y = total_per_mg)) +
  geom_boxplot()

# 1.4 Adding other aesthetics ----
# The data also has a DayNight column - the counts of organisms during the day
# or night. We want to include that grouping column in the boxplot

# Include DayNight as a fill aesthetic 
# Is there a greater abundance during the day or night?
# Is it consistent across macroalgae habitats?
herbivores %>% 
  ggplot(aes(x = MacroalgaeHabitat, y = total_per_mg, _)) +
  geom_boxplot()

# 1.5 A horizontal boxplot ----
# Remake the plot from 1.4 but make it a horizontal boxplot
# Since we ordered MacroalgaeHabitat by abundance, what direction is that with
# a horizontal boxplot? top to bottom or bottom to top? (The previous was left to right)
herbivores %>% 
  _

# 1.6 Greyscale plot ----
# Sometimes it costs more money for colour images in scientific journals.
# Let's alter the colours manually

# The configuration laye function here is: scale_fill_manual
# scale = a type of aesthetic that can change
# fill = we are altering the fill of the boxplots
# manual = we will choose colours manually

# The help file is quite detailed, however, the values argument is what we need.
# values: a set of aesthetic values to map data values to. ... If this is a 
# named vector, then the values will be matched based on the names instead.
# scale_fill_manual(values = c("colour1", "colour1"))
# scale_fill_manual(values = c(value_in_column_1 = "colour1", value_in_column_1 = "colour1"))
?scale_fill_manual

# Colour the D bas "white" and the N bars "grey50
herbivores %>% 
  ggplot(aes(y = MacroalgaeHabitat, x = total_per_mg, fill = DayNight)) +
  geom_boxplot() +
  scale_fill_manual(values = c(D = _, N = _))


# Extra exercises ----
# 1.6 Finalise the plot ----
# 1. Update the x and y axes titles, and the title of the plot
# 2. Use theme_minimal()
# 3. Export the plot to png


## Conclusion ----
