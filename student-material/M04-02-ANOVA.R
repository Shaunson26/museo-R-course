## ANOVA -----------------------------------------------------------------------

# We had a look at how ANOVA can be used to compare multiple groups at once.

# Packages required
library(dplyr)
library(ggplot2)

## 1. One-way ANOVA ----

# Turtles.csv is a study that examined the he hatching times of turtle eggs 
# incubated at four different temperatures (15°C, 20°C, 25°C and 30°C). Hatching 
# time (Days) is the continuous response variable and temperature is the categorical 
# predictor variable with with four levels. 

# 1.1 Import the data ----
# Import Turtles.csv
turtle_hatching <-
  readr::read_csv(_)

# 1.2 Examine the data ---
# Count the number of replicates per temperature
# How many replicates are there? If they are all the same, we called this a 
# 'balanced design'
turtle_hatching %>% 
  _

# 1.3 Visualise the data ----
# Create a boxplot of days until hatching by temperature groups
# There should be 4 boxes. What type of vector is Temperature currently? We will
# fix it in the next step
turtle_hatching %>% 
  ggplot(aes(x = _, y = _)) +
  _

# Turn Temperature into a factor using mutate() and factor(), then remake the boxplot
turtle_hatching <-
  turtle_hatching %>% 
  _

# Recreate the boxplot with Temperature now a factor



# Export the plot to the outputs folder as a 100 x 100 mm .png
ggsave(_)


# 1.4 Conduct an ANOVA ----

# What is the null hypothesis here?

# Create an ANOVA object using aov()
# Remember to use a formula y ~ x and provide the data argument
turtle_hatching_aov <-
  _


# Obtain the traditional ANOVA table using summary()
# Is there a difference in hatching time between the 4 temperatures tested?
_


# 1.5 Conduct pairwise comparisons ----
# Use TukeyHSD() to conduct pairwise comparisons
# Which temperatures differed from each other?
_


# Write a short conclusion paragraph
#


# 1.5 Extra information linking above with R data structures ---
# The object from TukeyHSD is a list
# The table of comparisons is a matrix
turtle_hatching_tukey <-
  TukeyHSD(turtle_hatching_aov)

str(turtle_hatching_tukey)

# Can you select the pairwise comparison table and sort by p value?
# The table is a matrix, currently with too many decimals places, and something
# we can turn into a data.frame before arranging. I've provided some steps
turtle_hatching_tukey$_ %>%  # select the table
  round(3) %>%               # round values
  as.data.frame() %>%        # convert to data.frame
  _(`p adj`)                 # arrange ... column name has a space so we need use backticks ``



###
## The following are the be completed in your own time ##
###

## 2.0 Extra exercises ----

# 2.1 One factor ANOVA - Bag strength ----
# A paper manufacturer makes grocery bags. They are interested in increasing the 
# tensile strength of their product. It is thought that strength is a function of
# the hardwood concentration in the pulp. An investigation is carried out to compare
# four levels of hardwood concentration: 5%, 10%, 15% and 20%. Six test specimens 
# are made at each level and all 24 specimens are then tested in random order

# Import data
bags <-
  readr::read_csv('data/bag_strength.csv')

# Examine data and prepare
bags %>% 
  count(hardwood_conc_pct)

bags %>% 
  ggplot(aes(x = hardwood_conc_pct, y = tensile_stgh_psi)) +
  geom_boxplot()

bags <- 
  bags %>% 
  mutate(hardwood_conc_pct = factor(hardwood_conc_pct))

bags %>% 
  ggplot(aes(x = factor(hardwood_conc_pct), y = tensile_stgh_psi)) +
  geom_boxplot()

# ANOVA
bags_aov <-
  aov(tensile_stgh_psi ~ hardwood_conc_pct, data = bags)

bags_aov %>% 
  summary()

# Pairwise comparisons 
bags_aov %>% 
  TukeyHSD()

# 2.2 Two factor ANOVA - Battery life ----
# battery_life.csv contains data on battery life under different temperature and
# material:
# The effective life (in hours) of batteries is compared by material type (1, 2 or 3) 
# and operating temperature: Low (-10˚C), Medium (20˚C) or High (45˚C).  Twelve 
# batteries are randomly selected from each material type and are then randomly 
# allocated to each temperature level.

# Import battery_life.csv
battery_life <-
  readr::read_csv("data/battery_life.csv")

# Examine data
battery_life %>% 
  count(temperature, material_type)

# Prepare data
# material_type is numeric and needs to be a factor
# temperature requires used to specific the levels of the factor for low, med, high
battery_life <-
  battery_life %>% 
  mutate(material_type = factor(material_type),
         temperature = factor(temperature, levels = c('low_-10C', 'med_20C', 'high_45C')))

# Plot data
battery_life %>% 
  ggplot(aes(x=temperature, y = life_h, colour = material_type)) +
  geom_point() +
  stat_summary(mapping = aes(group = material_type), geom = 'line', fun = 'mean')

# Conduct ANOVA
battery_aov <-
  aov(life_h ~ temperature * material_type, data = battery_life)

battery_aov %>% 
  summary()

# Conduct pairwise comparisons
TukeyHSD(battery_aov)


## Conclusion ----
