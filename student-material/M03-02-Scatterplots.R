## Scatterplots -----------------------------------------------------------------------

# Time to make some scatterplots using geom_point()

# Replace _ to complete expressions and return the correct answer

# Restart R to remove previous results using: Ctrl/Cmd + shift + F10

# Remember - try to use google to help you answer questions



# Packages required
library(dplyr)
library(ggplot2)

## 1. Scatterplots ----

# We will examine the bill depth and length of different penguins species.
# See: https://penguin-tracks.blogspot.com/2016/01/paper-published.html

# 1.1 Import the penguins dataset penguins.csv ----
pengiuns <- readr::read_csv('data/penguins.csv')

# 1.2 First scatterplot ----
# Create a scatterplot of bill_depth_mm vs. bill_length_mm using geom_point()
pengiuns %>% 
  ggplot(aes(x = _, y = _)) +
  _


# 1.3 Add a regression line ----
# Add a regression line layer using geom_smooth(method = 'lm')
# You can copy the code above and paste it here to continue
_



# 1.4 Scatter plot coloured by species ----
# Colour the points by mapping the species column to the colour aesthetic
# Do this by updating the aesthetics of geom_point()
# Does the regression look wrong after we can see the different species?
pengiuns %>% 
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_point(_) +
  geom_smooth(method = 'lm')



# 1.5 Create a global colour aesthetic ----
# Move the species colour aesthetic to the ggplot() mapping and remove it
# from the geom_point()
# Do the regression lines look better?
# Which species have longer bills? 
# Which species have deeper bills?
pengiuns %>% 
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm, _)) +
  geom_point(aes(color = species)) +
  geom_smooth(method = 'lm')



# 1.6 Finalise the plot ----
# 1. Update the x and y axes titles, and the title of the plot (see below)
# 2. Move the legend to the bottom using theme()
#
# x: Bill depth (mm), 
# y: Bill length (mm), 
# title: Bill lengths and depths of 3 penguin species,
# color: Species   

pengiuns %>% 
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm, color = species)) +
  geom_point() +
  geom_smooth(method = 'lm') +
  labs(_) +
  theme(_)

# Save the plot to the outputs folder as penguins_depth_length_scatterplot.svg
# Make it have a width and height of 12 cm
# You may need to install the svglite package if you see an error
# What is the resulting file type?
# Examine it outside of RStudio
ggsave(filename = "", 
       plot = last_plot(), 
       width = _, height = _, units = _)




# 2.0 Extra exercises
# cell_growth.csv contains data concerning growth conditions of Tetrahymena cells, 
# collected by Per Hellung-Larsen. Data are from two groups of cell cultures where 
# glucose was either added (1) or not added (2) to the growth medium. For each culture,
# the average cell diameter (µ) and cell concentration (count per ml) were recorded.

cell_growth <-
  readr::read_csv(_)

# Create a scatterplot that displays how cell diameter changes with cell concentration
# and glucose.
# the legend should show glucose 1 and 2, and not a color gradient
# Is the trend linear?


# Does the trend become linear if you log the cell_conc?
# Create a column log10_cell_conc and with log10() values of cell_conc, and
# remake the plot


# Finalise and export the plot
# Update the labels and any other things you think necessary


## Conclusion ----
# We examined 
# - making scatterplots
# - adding colour aesthetics
# - adding regression lines
# - examining inheritance 
# - exporting plots
