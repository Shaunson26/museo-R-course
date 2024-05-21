## Coding basics ---------------------------------------------------------------

# We are familiar with some basics of R now. Time to complete some exercises.

# Replace _ to complete expressions and return the correct answer

# Restart R to remove previous results using: Ctrl/Cmd + shift + F10


## 1. R can do math ----

# What are the values of
# 1. log of 4.5
# 2. the exponent of 1.2
# 3. the sin of (pi / 4)
_
_
_


## 2. Creating variables and objects ----

# If want to store the result we use the assignment operator <-
# my_result <- 2 * 5

# Store the result of the combine function c() into an object called `evens`
_ <- c(2,4,6,8,10)


# Tab-completion - RStudio helps you navigate object and function names, and 
# reduce the amount of typing. This means we can use descriptive variable names
# that may be long, and still access them quickly

# Assign the following variable
here_is_a_very_long_variable_name <- c(1,2,3,4)

# put the cursor at the end of  "her", press the tab key and see the options. Finally,
# select "here_is_a_very_long_variable_name" using the enter key
here_is_a_very_long_variable_name

# start typing "her", after 3 characters the variable options should open for you
# to choose "here_is_a_very_long_variable_name" . You can also press the tab key
_


## 3. Arithmetic on vectors ----

# `evens` (from above) is a vector of even numbers. Subtracting 1 from all the 
# values is simple, we just subtract 1 from the object `evens`.

# Subtract 1 from the evens object and assign the result to odds
_ <- evens


# Make the following vector the powers of 10 e.g 10^n
powers <- c(1,2,3,4)
_


# Convert these values in hours to seconds using the information:
# 60 mins in an hour, 60 seconds in a minute i.e. use * twice
hours_h <- c(0.5, 1, 2)
_


## 4. Naming objects ----

# There are naming rules in R.

# Why does not this work?
# _ write answer here
1x  <- c(4,3,2,1)


# Why do the following errors occur when you try to print r_rocks to the console?
# _ write answer here
r_rocks <- 2^3
r_rock   #> Error: object 'r_rock' not found
R_rocks  #> Error: object 'R_rocks' not found

# Informative names are useful for you to remember what the variables contain.
# We also suggest using `snake_case` for multiple words (but this is optional).

# What are some good names to store the following results?

# A set of random numbers from the normal distribution with mean = 0 and sd = 1
_ <- rnorm(n = 10, mean = 0, sd = 1)


# A set of permuted values from 1 to 10
_ <- sample(1:10)


# The following two exercises result in very similar information but the output is
# structured slightly different. A good name will be important here in order to
# remember what is stored in each variable.

# Here is a vector of 20 numbers ranging of 0 to 1 that we will use.
runif_20 <- runif(20)
runif_20

# This creates a vector of TRUE/FALSE (values less than 0.05 are TRUE, otherwise
# FALSE). Provide a useful name and print the result to the console to examine it.
_ <- runif_20 < 0.05

# This creates a vector of which 20 positions (indices) of the vector are less 
# than 0.05. Provide a useful name and print the result to the console to examine it.
_ <- which(runif_20 < 0.05)



## 5. Calling functions ----
# We want to become familiar with using function arguments and obtaining help
# for functions. We will use some simple functions that create vector of numbers.
# Remember:
# function_name(argument1 = value1, argument2 = value2, ...)

# Use seq() function is various ways
# use ?seq for help

# Create a sequence of values from 100 to 1000 by 100
seq(from = 100, _)


# Create a sequence of 11 numbers from 0 to 1 
# Hint: 11 is our "desired length of the sequence."
seq(from = 0, to = 1, _)


# Create the sequence 1, 10, 100, 1000 using the code below
# Hint: you need to use ^ somewhere
seq(from = 0, to = 3)

# Why does this not work correctly?
# The result should be: 0, 0.5, 1, 1.5, 2, 2.5, 3
seq(From = 0, to = 3, by = 0.5)

# The code with the error was:  seq(From = 0, to = 3, by = 0.5)
# And this can be reproduced using the code below.
# Why does the sequence start at 1?
seq(to = 3, by = 0.5)


# Use the rep() function to repeat sets of values in different ways
# Use ?rep for help
# ... means we can use one of 'times', l'ength.out' or 'each' 

# Repeat the sequence of x, 5 times
rep(x = 1:2, _)


# Repeat the values of x, each 5 times
rep(x = 1:2, _)


# What happens when we choose to repeat 1:3 and want a final length of 5 values?
rep(x = 1:3, length = 5)


# Why does this not work?
# The result should be: 1 2 1 2 1 2
rep(x = 1:2, timeS = 3)


# Use the sample() function to take random samples and permutations
# Use ?sample for help


# Take a random sample of size 5 from x
sample(x = 1:10, _)


# Take a random sample of size 10, allow values to be sampled multiple times (replaced)
sample(x = 1:10, _)


# Using paste(). Paste combines words of 1 vector with another
# ?paste

# Here is a vector of a, b and c
abc <- c('a', 'b', 'c')

# Paste the word 'person' with each of the letters a, b and c
paste("person", _)


# Now paste 1 to 3 with the letters a, b and c.
# sep is the character between pasted values
# What happens when each vector has multiple values?
paste(_, 1:3, sep = "_")

# How would you create a vector: "a1" "a2" "a3" "b1" "b2" "b3" "c1" "c2" "c3"
paste(_, _, sep = _)

# We will see later how pasting helps combine vectors of values (often columns of
# a dataset) to provide unique combinations of values
paste(
  c('A', 'A', 'A', 'A', 'B', 'B', 'B', 'B'), # Treatment 1 column
  c('a', 'a', 'b', 'b', 'a', 'a', 'b', 'b'),  # Treatment 2 columns
  c(1, 2, 1, 2, 1, 2, 1, 2),  # Replicate column
  sep = ''
)


## Conclusion
# You should have a basic understanding of
# - R calculations
# - Naming objects
# - Using functions and their arguments
# - Examining help files






