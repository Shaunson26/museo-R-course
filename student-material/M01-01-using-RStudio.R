## Using RStudio ---------------------------------------------------------------

# In this exercise we will go through some basics of using R and RStudio

## 1. Entering commands in the R console ----

# Add 1 + 1 in the console panel below and press enter.
# What do you see?


## 2. Entering command from the script editor ----

# Add 1 + 1 in the next line, and then click the run button above.

# Now put the cursor on the line below and use Ctrl + enter / Cmd + enter to send code to the 
# R console. This is the preferred method AND your first keyboard shortcut!
1 + 1

# You can also highlight parts of code and use Ctrl + enter / Cmd + enter to send code
# to the console. This is useful for examining long pieces of code.

# Highlight 5 * 5 with the mouse, and send the result to the console.
# You should see 25
2 * 1 + 5 * 5


## 3. Storing variables in R ----

# Run the following lines and examine the Environment panel for currently stored 
# variables and objects. We will discuss variables later.
var1 <- c(1,2,3)
var2 <- c('Cat', 'Dog', 'Bird')


## 4. Examine the examine file viewer ----
# Examine the files in the Files panel. Are the files you see the same as what 
# is printed using the list.files() function?
list.files()

# You can navigate to other folders in the file viewer, but be mindful of the
# current directory R is working from as it will not be the folder you navigate to.

# You should be working from the 'student-material' folder.
# Navigate to the `data` folder to view the data files we will use
# Navigate back to the working directory by: (In the Files tab) More > Go To Working Directory


## 5. Working directory ----
# R is working from a directory on your computer. This changes depending on how
# you start R/RStudio, and whether you have explicitly changed it afterwards.
# Can you navigate to this location on your computer outside of RStudio (using 
# Windows explorer/Mac finder)?
getwd()


# Examine details at the top of the Console tab next to R logo. What does it tell you?
# Examine the Files tab > More button. How can these options help you?


## 6. Create a plot ----
# When we create a plot, we will see it in the Plots panel
plot(rnorm(500), rnorm(500), pch = 19)


## 7. Help tab ----
# R documentation is standardised, you will often see;
# A Title, a Description, Usage, Arguments, Details and Notes, Examples

# Examine the help document for these 2 function
?base::plot()
?rnorm


## 8. File menu ----
# Examine the in options: File > New File > ...
# Do any of these look familiar to you?


## 9. Tools menu ----
# We often want to change settings of R and RStudio such as themes and layout, or
# other such settings. We also want to learn as many keyboard shortcuts as possible
# to increase productivity

# Examine the options:
# Tools > Global Options
# Tools > Keyboard shortcuts


## Conclusion ----
# You should have a basic understanding of the RStudio layout
