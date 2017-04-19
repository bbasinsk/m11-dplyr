# Exercise 8: Pulitzer Prizes

# Read in the data
pulitzer <- read.csv("data/pulitzer-circulation-data.csv", stringsAsFactors = FALSE)

# Install and load the needed libraries
# Be sure to comment out the install.packages function so it won't install it every time it runs
# Remeber you only need to install a package once
#install.packages(dplyr)
library(dplyr)

# View in the data set. Start to understand what the data columns contains
# Be sure to comment out the function so it won't view everytime you run the code.
# View(pulitzer)

# Use 'colnames' to print out the names of the columns
colnames(pulitzer)

# Use 'str' to print what types of values are contained in each column
# Did any value type surprise you? Why do you think they are that type?
str((pulitzer))
## A lot of them are charactors... lets fix that:
pulitzer$Daily.Circulation..2004 <- as.numeric(gsub(",","",pulitzer$Daily.Circulation..2004))
pulitzer$Daily.Circulation..2013 <- as.numeric(gsub(",","",pulitzer$Daily.Circulation..2013))

# Add a column that contains the diffrence in changes in Daily Circulation from 2004 to 2013
pulitzer <- pulitzer %>% mutate(Difference = Daily.Circulation..2013 - Daily.Circulation..2004)

# What publication gained the most pulitzer prizes from 2004-2014?
# Be sure to use the pipe operator! 
most.pub <- pulitzer %>% filter(Pulitzer.Prize.Winners.and.Finalists..2004.2014 == max(Pulitzer.Prize.Winners.and.Finalists..2004.2014)) %>% 
  select(Newspaper)

# Which publication with at least 5 Pulitzers won from 2004-2014 had the biggest decrease(negative) in Daily circulation numbers? 
# This publication should have Pulitzer prizes won a minimum of 5 Pulitzers, as well as the biggest decrease in circulation
answer <- pulitzer %>% filter(Pulitzer.Prize.Winners.and.Finalists..2004.2014 >= 5) %>% 
  filter(Difference == min(Difference))

# Your turn! An important part about being a data scientist is asking questions. 
# Create a question and use dplyr to figure out the answer.  

## What is the newspaper that has lost the most number subscribers from 2004 to 2013?
## What is the newspaper that has gained the most number subscribers from 2004 to 2013?
worst.newspaper <- pulitzer %>% filter(Difference == min(Difference)) %>% select(Newspaper)
best.newspaper <- pulitzer %>% filter(Difference == max(Difference)) %>% select(Newspaper)
