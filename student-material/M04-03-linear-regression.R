## Linear models----------------------------------------------------------------

# We had a look a simple linear regression. Now lets flex our linear model muscles.

# Replace _ to complete expressions and return the correct answer

# Restart R to remove previous results using: Ctrl/Cmd + shift + F10

# Remember - try to use google to help you answer questions

# Packages required
library(dplyr)
library(ggplot2)


## 1. Simple linear regression ----

# A researcher wants to know if flipper length is a good proxy for body mass
# for Adelie penguins.

# penguins.csv contains morphometric data on 3 species of penguins. Use this to
# answer the question

# 1.1 Import data ----
# Import penguins.csv
penguins <-
  readr::read_csv(_)

# 1.2 Data preparation ----
# Filter the data to only include the species Adelie
penguins_adelie <-
  penguins %>% 
  _

# 1.3 Visualise the data ----
# Create a scatter plot of flipper_length_mm and y = body_mass_g, include a geom_smooth
# layer with method = 'lm'
penguins_adelie %>% 
  ggplot(aes(x = _, y = _)) +
  _ +
  _

# In this particular case, with a simple linear regression, geom_smooth(method = 'lm')
# gives us what the model below does. In more complex cases, we may need to obtain data
# from the model and add that as a layer to ggplot ..

# Finalise the plot and export it to outputs as a 100 x 100 mm png
ggsave()



# 1.4 Fit a linear regression model ----
# Use lm() to fit a simple linear regression model
penguins_adelie_lm <-
  lm(_,_ data = _)

# penguins_adelie_lm is a linear model object, and simply a list of data about
# the model. We generally never have to access the list elements manually as
# we use accessor functions for that. 
# Just for example, I have print the structre of the object to show there are
# names to select various parts of the model if needed
str(penguins_adelie_lm)

# 1.5 Examine the fitted model ----
# Examine the residuals of the model using a residual vs fits plot
# Are they evenly spread around a residual of 0 in a blob type pattern?
plot(_, which = 1, pch = 19)

# We can also examine how far each point is from the line of best fit. 
# We should see a normal, bell shaped curve if the model fits the data well
hist(penguins_adelie_lm$residuals, breaks = 50)



# 1.6 Obtain a summary of the model ----
# Use summary() to obtain the model summary
# Is flipper length a good predictor of body mass?
# Each unit increase in flipper_length_mm is associated with what change in body_mass_g 



# 1.7 Obtain model predictions ----
# We use predict() to obtain model predictions. We have to provide a data.frame
# with values to predict, and the column name must match that of the predictor used
# in lm(). The data.frame is based to the newdata arguments

# Obtain the predicted mass for a flipper_length_mm of 200
predict(penguins_adelie_lm, 
        newdata = data.frame(flipper_length_mm = _))

# To obtain confidence intervals, we need to include the interval
# Include 'confidence' in the interval argument below
predict(penguins_adelie_lm, 
        newdata = data.frame(flipper_length_mm = 200), 
        interval = _)

# We can obtain many predictions at once. We need to make a data.frame of values to
# predict
# create a sequence from 170 to 210 by 10
adelie_flipper_predict <-
  data.frame(
    flipper_length_mm = _
  )

# Then pass it to predict
predict(penguins_adelie_lm, 
        newdata = _, 
        interval = "confidence")



# Plotting the predicted values and confidence intervals from the model output as
# as layer on top of the raw data with ggplot is given as an extra exercise below.



## The following is to be done in your own time

## 2. Multiple linear regression ----

# The cell_growth.csv contains the cell diameter and concentration of Tetrahymena 
# cells with and without glucose added to growth medium. Glucose = 1 means glucose
# was added, Glucose = 2 means glucose was absent

# A researcher wants to know how cell concentration and glucose addition affect
# the cell diameter of Tetrahymena


# 2.1 Import data ----
# Import cell_growth.csv
cell_growth <-
  readr::read_csv(_)

cell_growth

# 2.2 Visualise data ----
# Make a scatter plot of cell diameter and concentration, coloured by glucose
# The glucose legend should only be 2 values
# Is trend linear?
cell_growth %>% 
  ggplot(aes(x = _ , y = _, color = _)) +
  geom_point()

# We need to create a factor out of glucose
cell_growth <-
  cell_growth %>% 
  mutate(glucose = factor(_, labels = c('Yes', 'No')))

# Try log transforming cell_conc before making the plot
# If the trend look linear, then that is how we should include the predictor in the
# linear model
cell_growth %>% 
  ggplot(aes(x = _(cell_conc) , y = cell_diameter, color = glucose)) +
  geom_point() 


# 2.3 Fit a linear model ----
# We are using the * between predictor for a "crossed" design. It means the
# regression slope for each glucose treatment can be different (we could also 
# constrain them to be the same)
cell_growth_lm <-
  lm(_ ~ log10(_) * _, data = cell_growth) 


# 2.4 Examine the fitted model ----
# Are the residuals evenly spread without nay pattern?
# Possible outliers have numbers, but we will not deal with them further
plot(_, which = 1, pch = 19)

# 2.5 Obtain the summary of the fitted model ----
# Use summary() on the linear model object
#
# This is be a fit difficult to read if you have not seen it before. It is like
# like this is for a statistical estimation reason that we will not discuss further 

# (Intercept)                        = the intercept for glucose = 1
# log10(cell_conc)                   = the slope for glucose = 1             
# factor(glucose)2                   = difference in intercept for glucose 2 to glucose 1   
# log10(cell_conc):factor(glucose)2  = difference in slope for glucose 2 to glucose 1

# Is the slope between cell_diameter and log10(cell_conc) difference between glucose
# levels?
_

# 2.6 Analysis of variance ----
# We can conduct an ANOVA on this model to test the hypotheses
# 1. Is the a relationship between cell_diameter and cell concentration regardless of glucose addition?
# 2. Does glucose addition affect cell diamenter regardless of cell concentration?
# 3. Does glucose affect the relationship between cell diameter and cell concentration?
# Use anova() on the linear model object 
_


# Plotting the predicted values and confidence intervals with the raw data is given
# as an extra exercise

# 3.0 Extra exercises ----
  
# Use predict() and obtain model prediction data.frames.
# Create scatterplots and add the predicted values as geom_lines()

# Do this for both datasets.  

## Conclusion ----
