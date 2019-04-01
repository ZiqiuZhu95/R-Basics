# R Programming

This is the second course in the Data Science Specialization and it focuses on the nuts and bolts of using R as a programming language. While many introductory topics were covered in this course such as the history behind the language, data types, subsetting, control structures, loop functions and many others, the primary focus of the assignmentts were on loop functions and subsetting. 

## Pollutant Mean Assignment

The objective of this assignemnt is to write three functions that are meant to interact with dataset that accompanies this assignment. The zip file contains 332 comma-separated-value (CSV) files containing pollution monitoring data for fine particulate matter (PM) air pollution at 332 locations in the United States. Each file contains data from a single monitor and the ID number for each monitor is contained in the file name. For example, data for monitor 200 is contained in the file "200.csv". Each file contains three variables:

* Date: the date of the observation in YYYY-MM-DD format (year-month-day)
* sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
* nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)

1. Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'.

2. Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases.

3. Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement.

## Hospital Ranking Assignment

In the hospital ranking assignment, the data for this assignment come from the Hospital Compare web site (http://hospitalcompare.hhs.gov)
run by the U.S. Department of Health and Human Services. The purpose of the web site is to provide data and
information about the quality of care at over 4,000 Medicare-certified hospitals in the U.S

The objective of the assignment is to: 

1.  Plot the 30-day mortality rates for heart attack
2.  Find the best hospital in a state based on outcomes of heart attack, heart failure, or pneumonia
3.  Rank hospitals by outcome in a state
4.  Rank hospitals in all states.

