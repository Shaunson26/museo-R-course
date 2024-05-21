## Data structures -------------------------------------------------------------

# We have explored data structures in R and how to access their value

# Replace _ to complete expressions and return the correct answer

# Restart R to remove previous results using: Ctrl/Cmd + shift + F10


## 1. Warm up ----

# Why does not this calculation work?
my_numbers <- c(1, 4, 3, 'missing', 6, 7)
my_numbers / 5

# What type of values are in my_numbers?


# What happens if we do vector arithmetic with NA present?
has_NA <- c(1, 4, 3, NA, 6, 7)
has_NA / 5

# What happens if we do a summary statistic (mean, sum, ...) with NA present?
# How can you produce a mean value here? Use ?mean
mean(has_NA)


## 2. Selecting elements in a vector ----

# Here are two vectors for the following exercises
weights <- c(54, 67, 72, 76, 73, 70, 80, 69, 66, 82)

species <- 
  c('virginica', 'setosa', 'setosa', 'versicolor', 'versicolor', 
    'versicolor', 'versicolor', 'setosa', 'versicolor', 'setosa')


# 2.1 ----
# What type of vector is `weights`?
class(_)

# Return the first 5 values of weights
weights[_]

# Return the values of weights less than 70
weights

# Return the values of weights greater than 70 and less than 80
_

# 2.2 ----
# What type of vector is `species`?
_

# Return the values of only the 'setosa' from species
species[_]


# Return the values of 'setosa' and 'versicolor' from species
species[_]


# 2.3 ----
# R has some built-in vectors of useful words
?Constants

# Return the first 5 letters of the alphabet in lower-case
_

# Return the last 5 letters of the alphabet in upper-case
_

# Return the 6th month of year
_



## 3. Selecting elements in a matrix ----

# Here is a matrix for the following exercises
weekly_weights <-
  matrix(data = c(71, 71, 81, 75, 73, 67, 58, 68, 79, 68,
                  64, 75, 54, 74, 84, 53, 75, 76, 80, 73,
                  65, 78, 71, 70, 67, 61, 71, 73, 72, 73),
         ncol = 3,
         dimnames = list(NULL, c('wk1', 'wk2', 'wk3')))

# Confirm the `weekly_weights` is a `matrix`
_


# Return the column names
_


# Does `weekly_weights` have row names?
_


# Return the second column
weekly_weights[,_]


# Return the `wk3` column by using it's name
_


# Return the first 5 rows 
_


# Return the 2nd value of the wk2 column
_


# Return the mean of each row
_


# Return the sum of each column
_


# Return the rows where wk3 values are > than 70
weekly_weights[_, ]

# Plot each row as a line using matplot. After your first attempt, you may notice 
# that the data is in the wrong orientation - the rows need to be the columns 
# and columns the rows, that is you need to transpose the matrix. Try searching
# on the internet "how to transpose a matrix in R"
# ?matplot
matplot(x = _, type = 'l', ylab = 'Weight (kg)', xlab = 'Week')

## 4. Selecting elements in a list ----

# An example list for the following exercise
person_list <-
  list(
    date_accessed = Sys.Date(),
    num_records = 3,
    data = 
      list(
        data.frame(person = 'Tom', age = 5),
        data.frame(person = 'Jerry', age = 2),
        data.frame(person = 'Quacker', age = 10)
      )
  )

# Confirm the `person_list` is a `list`
_

# The str() command can help visualise a list
str(person_list)

# Return the element `date_accessed`
_


# Return the element containing person `Tom`
# Remember: the `data` element is an unnamed is a List of 3
_


## 5. Selecting elements in a data.frame ----

# The data.frame will be the most used data structure from here on. Here, we will
# use some traditional methods for interacting with them but later we will use
# different (and clearer) methods to do them.

# iris is a built-in dataset in R
iris

# If a data.frame is big and we print to the console, it is often unmanageable to 
# read. Using head() only shows the first 6 rows. We will later use a tibble
# data.frame that has better properties.
head(iris)

# Using the str() function on iris,
# 1. How many rows and columns are there?
# 2. What data vectors are present?
# 3. How many different values exist for the column `Species`?
#_
#_
#_

# Return the column names
_

# Return the `Species` column using $
_

# Return the `Sepal.Length` column using [[]]
_

# Return the `Petal.Width` and `Species` columns using [,]
_

# Return the first 2 rows of data
_

# Return the row where the `Petal.Length` is greater than 3.5
iris[_,]


# Return the data of only the Species `versicolor`
iris[_,]


# Create a plot of sepal length and width, coloured by species, by selecting them 
# from the dataframe for the arguments below.
plot(x = _, y = _, col = _, pch = 19)
legend('topright', legend = levels(iris$Species), col = 1:3, pch = 19)

# faithful is a dataset included in R of the time between eurptions of a geyser
# in Yellowstone National Park
head(faithful)
?faithful

# Plot the number of eruptions by waiting time
plot(x = _, y = _,
     pch = 19,
     xlab = 'waiting time (mins)',
     ylab = 'number of eruptions')

# Plot a histogram of the number of eruptions
# Can you change: 
#  the title to "Histogram of eurptions" and
#  x axis title to "Number of eurptions"?
hist(x = _)



