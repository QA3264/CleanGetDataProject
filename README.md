## README file for the GetDataProject

### The deliverables for this project are: 
- README.md : this file. It describes the steps followed to get to the final tidy data set.
- CodeBook.md : the CodeBook reference to the variables in used in this analyis
- run_analysis.R : the R-code to read the data and create the final tidy data set. Only 1 script for this project.
- A space-delimited text file, summarydata.txt. It contains the final tidy data set. 

### The R scripts assumes that the required text files are already available in the working directory.
The zip file was manually copied to C drive. After unzipping, the relevant files (8 of them) were copied to a working directory. Files used for this analysis were:
- "activity_labels.txt"
- "features.txt" 
- "subject_test.txt"
- "subject_train.txt"
- "X_test.txt"
- "X_train.txt"
- "y_test.txt"
- "y_train.txt"   

### The following steps were followed to get to the final output:
- Loaded "dplyr" library.  
- Read all text files using read.table-funciton and stored the data in corresponding data frames.
- Renamed the variable name in y_test and y_train files to "activitytype".
- Renamed the variable name in subject_test and subject_train to "subjectid".
- Renamed the variable name of x_test and x_train using variable names in feature file (561 variables).
- Combined all x_test related data frames into one dataframe (with subjectid and activitytype as first two columns).
- Combined all x_train related data frames into one dataframe (with subjectid and activitytype as firt two columns).
- Merged two datasets into "mergedData" dataframe using rbind-function ( 563 variables with subjectid and activitytype as first two columns).
- Selected those columns which had "mean" or "std" in their names. I specifically searched for those 2 patterns. 
I didn't select variables which had word "Mean"(such as "tBodyAccMean" or "gravityMean") in their names. 79 variables were found.
- Added subjectid and acivity_type to the variable list. This brought the list of variable to 81.
- Subset the merged data for those 81 variables (going from 563 to 81)
- Arranged data by subjectid and activitytype
- Substituted activity-numbers with activity names/labels
- Changed variable names to more descriptive names
- Applied  aggregate-function to the above dataset to create the final summary dataset (with averages for each measurement variable)
- Wrote the data into a space-separated text file (summarydata.txt) using write.table-function

