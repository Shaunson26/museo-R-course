## Importing data into R -------------------------------------------------------

# We have seen how to import text, excel and other files, and then have finer
# control about how the data is imported. 

# Replace _ to complete expressions and return the correct answer

# Restart R to remove previous results using: Ctrl/Cmd + shift + F10


# Packages required
library(readr)
library(readxl)

## 1. Import text data files ----

# We will import files from the `data` folder. We will use a 'relative' file
# path which means: starting from the "student-material" folder, write the
# names of the folders you need to enter, separated by a "/", before you
# reach the file you want.
#
# data > penguins.csv = data/penguins

## 1.1 ----
# Import the penguins.csv from the data folder and print the data in the console 
# to examine it
penguins <- _

# Import more_penguins.csv which lives in sub-folders of data
# You may nagivate there in the Files browser on the right
# data > study_1 > raw_data > more_penguins.csv
more_penguins <- _


## 1.2 ----
# bloods.csv contains blood test values for 18 patients. All of the blood markers
# should be numeric but many have been imported as character. What is the problem
# here and how can it be fixed?
read_csv(file = 'data/bloods.csv')


## 1.3 ----
# Importing mtcars.txt does not seem to work with read_csv. 
# Why not? 
# What delimiter does it use?
# How can you import it?
read_csv(file = 'data/mtcars.txt')
_

## 1.4 ----
# The file ncbi-blastn.tsv is output from bioinformatics software. It has a number
# of comment rows about the query that produced the data, and finally the rows of
# data. The manual says the output is tab-delimited.

# We can view the first 10 lines using readLines()
readLines('data/ncbi-blastn.tsv', n = 10)

read_delim(_)



## 2. Import excel data files ----

# penguins.xlsx has the penguins data separated across multiple sheets.

# What sheet names exist in penguins.xlsx?
_(path = 'data/penguins.xlsx')

# Import sheet 'Gentoo'
read_excel(_)

# deaths.xlsx is a small table of death information of famous people. There are
# comments above and below the data table. How can you import the table without
# the comments using the range argument?

read_excel(path = 'data/deaths.xlsx', range = "A2:F12")

## 3. Import R data files ----

# fish-lengths.rds is an R dataset. How can you import this with readr?
_('data/fish-lengths.rds')

# Examine the column types of 'Management' and 'Shore'. Why type are they? Have
# any of the previous file imports imported columns of this type?




## Conclusion ----
# We have imported
# - various text, excel and R data files
# - altered function arguments to improve import
# - briefly examined the column types of the imported data
