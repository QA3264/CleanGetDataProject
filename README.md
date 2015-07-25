# CleanGetDataProject

The deliverables for this project are: 
1- README.md : this file. It describes the steps followed to get to the final data set.
2- CodeBook.md : the CodeBook reference to the variables in used in this analyis
3- run_analysis.R : the R-code to read the data and create the final tidy data set. Only 1 script for this project.
4- A tab -delimited text file, summarydata.txt , that contains the final tidy data set. 

The following steps were followed to clean the data and get to a tidy dataset.
First all files were manually copied to C:\ drive. Then the relevant files (8 of them) were copied to a working directory (named "Project"). Files used for this analysis were:
"activity_labels.txt", "features.txt" , "subject_test.txt", "subject_train.txt" , 
"X_test.txt","X_train.txt" ,"y_test.txt","y_train.txt"   

The following steps (which are also documented in "run_analysis.R" script) were followed to get to the final output ( a text file summary):
library(dplyr) was loaded.  
- Read all text files using read.table-funciton and stored the data in corresponding data frames
- Renamed the variable name in y_test and y_train files to "activity_type"
- Renamed the variable name in subject_test and subject_train to "subject_ID"
- Renamed the variable name of x_test and x_train using variable names in feature file (561 variables)
- Combined all x_test related data frames into one dataframe (with subject_ID and activity_type as first two columns)
- Combined all x_train related data frames into one dataframe (with subject_ID and activity_type as firt two columns)
- Merged two datasets into "mergedData" dataframe using rbind-function ( 563 variables with subject_ID and activity_type as first two columns)
- Slected those columns which had "mean" or "std" in their names. I specifically searched for those 2 patterns. I didn't select variables which had word "Mean"(such as "tBodyAccMean" or "gravityMean") in their names. 79 variables were found.
- Added subject_ID and acivity_type to the variable list. This brought the list of variable to 81.
- Subset the merged data for those 81 variables (going from 563 to 81)
- Arrangeed data by subject_ID and activity_type
- Substituted activity-numbers with activity names/labels
- Changed variable names to more descriptive names
- Applied  aggregate-function to the above dataset to create the final summary dataset (with averages for each measurement variable)
- Wrore the data into a tab-separated text file (summarydata.txt) using write.table- function
