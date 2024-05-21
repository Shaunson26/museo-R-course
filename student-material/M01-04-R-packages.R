## R packages -----------------------------------------------------------------

# Replace _ to complete expressions and return the correct answer

# Restart R to remove previous results using: Ctrl/Cmd + shift + F10


## 1. What packages do you have? ----

# Examine the Packages tab. These are packages that are *installed* on the computer.
# Examine the package names, their brief descriptions and version numbers

# You should see 'User Library' above the 'System Library' packages. 
# The 'System Library' packages are those that come with the R installation (base R), 
# while the 'User Library' have been added after.

# Is tidyverse installed on your system? If so, what version?



## 2. Using a package and it's functions ----

# In order to use a package's functions, we first need to load it using library(). 
# If we want to use the read_csv function from the readr package (within the tidyverse), 
# we first need to use library(readr)

# What happens if we try to use a function without loading the package?
read_csv(file = 'data/penguins.csv')  

# However, before we load the library, let's use name-spacing to access the function
# without loading it. We use the structure "package::function"

# Call the read_csv from readr using name-spacing
read_csv(file = 'data/penguins.csv')

# Load the the readr package and then run the read_csv function
library(_)

pengiuns <-
  read_csv(file = 'data/penguins.csv')


# The count function from dplyr will tabulate data in columns. The following code 
# will count the number of species and islands from the pengiuns data.frame. However,
# we do not want to load dplyr but rather use namespacing to access the function. 

# Call the count from dplyr using name-spacing
_(penguins, species, island)


## 3. Where are packages downloaded from ----

# Examine the location from within RStudio
# Tools > Global options > Packages

# Or from within R
options()$repos

## 4. Exploring a packages functions ----

# In the packages tab, type in 'readr' in the search box (top right of the tab)
# Click the 'readr' name
# The result is the root documentation of the package.

# Examine the list of functions of readr, how many read_* functions are there?
# Are there write_* function? What do you think they do?

# At the top of the package documentation, click "User guides, package vignettes and other documentation."
# Vignettes are long-form documentation, often user guides to a pacakge.
# Examine the 'Introduction to readr' vignettes by clicking `readr::readr`

## Conclusion ----

# Now you can inspect what packages are installed, load one and use it's functions.
# You have also discovered how to access package functions using namespacing.
