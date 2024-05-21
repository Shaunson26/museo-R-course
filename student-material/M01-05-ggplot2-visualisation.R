## Creating a visualistion with ggplot2 ---------------------------------------

# Replace _ to complete expressions and return the correct answer

# Restart R to remove previous results using: Ctrl/Cmd + shift + F10


# Packages required
library(ggplot2)

## 1. Import the penguins dataset ----\

# Add the penguins.csv from the data folder
penguins <-
  readr::read_csv(file = _, show_col_types = FALSE)

penguins

# How many rows are in penguins? How many columns?
# What are 3 different methods to do this?
_
_
_

## 2. Building a visualization using ggplot2 ----

# We will sequentially build a visualisation using ggplot2. You
# will need to follow the instructions and add the relevant code
# where needed


# Why does the following only produce a grey box?
# _ answer here
ggplot(data = penguins)


# 2.1 Adding aesthetics ----
# We add aesthetics to the mapping argument in ggplot() using aes()
# Add flipper_length_mm to x, and body_mass_g to y
ggplot(
  data = penguins,
  mapping = aes(x = _, y = _)
)


# 2.2 Adding a geom ----
# Next we add a point geom layer
# Add geom_point() to produce a scatterplot
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)) _
  _

# 2.3 Adding the color aesthetic ----
# We want the point to be coloured by penguin species.
# Update the aesthetics to include color = species
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, _)
) +
  geom_point()


# 2.4 Adding other geoms ----
# Next we want to add a statistical geom layer that is the linear regression of
# the points.
# Add geom_smooth(method = "lm", se = F) to the following code
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, colour = species)
) +
  geom_point()


# 2.5 Adding the shape aesthetic ----
# We want the points have different shape by penguin species.
# Update the aesthetics include shape = species
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, colour = species, _)) +
  geom_point() +
  geom_smooth(method = "lm", se = F)


# 2.6 Adding titles ----
# Add title, subtitle, axes titles and legend titles
# title: Body mass and flipper length
# subtitle: Dimensions for Adelie, Chinstrap, and Gentoo Penguins
# x: Flipper length (mm)
# y: Body mass (g)
# color: Species 
# shape: Species
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g,
                colour = species, shape = species)) +
  geom_point() +
  geom_smooth(method = "lm", se = F) +
  labs(_) 

# 3. Saving the last created ggplot ----
# The last ggplot created can be saved using ggsave.
# Save the last plot as 'penguins-plot-final.png' in the outputs folder
ggsave(filename = _,
       plot = last_plot(),
       width = 150,
       height = 120,
       units = 'mm')


# 3.1 How would you save it to .svg file type?
?ggsave()
ggsave(filename = 'outputs/penguins-plot-final._',
       plot = last_plot(),
       width = 150,
       height = 120,
       units = 'mm')


# 4. Other exercises ----

# What does the na.rm argument do in geom_point()? What is the default value of 
# the argument? Create a scatterplot where you successfully use this argument set 
# to TRUE.
ggplot(
  data = penguins, 
  mapping = aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_point(na.rm = _)


# Make a scatterplot of bill_depth_mm (x) vs. bill_length_mm (y), with and without
# including species as colour, and describe the change in relationships between bill depth
# and length.

# 1. bill_depth_mm vs bill_length_mm, include a regression line
_


# 2. bill_depth_mm vs bill_length_mm, coloured by pengiun species. Include a 
# regression line
_


# 2b. What happens if you include colour=species in the aesthetics of geom_point()
# and not in ggplot()
ggplot(
  data = _, 
  mapping = aes(x = _, y = _)) +
  geom_point(mapping = aes(colour = _)) +
  geom_smooth(method = 'lm')


# Why does the following give an error and how would you fix it?
ggplot(data = penguins) + 
  geom_point()


 







