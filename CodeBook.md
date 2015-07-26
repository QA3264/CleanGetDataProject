## CodeBook

This CodeBook describes the datasets that were used in project for Getting and Cleaning Data Course.
The data is coming from an experiment that was carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. Various measurements were captured during this experiment.
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.

### The following dataframe variables(8 of them) were created by reading data from the data files:

- features (read from'features.txt') : List of all features- 561 rows, 2 columns (variable1= row number, Variable2= the name of the measurements)
  + data.frame':	561 obs. of  2 variables:
  + $ V1: int  1 2 3 4 5 6 7 8 9 10 ...
  + $ V2: Factor w/ 477 levels "angle(tBodyAccJerkMean),gravityMean)",..: 243 244 245 250 251 252 237 238 239 240 ...

- activlabel ( read from 'activity_labels.txt'): list if activity names- 6 rows, 2 columns (variable1= row number, Variable2= name of acitivity)
  + 'data.frame':	6 obs. of  2 variables:
  + $ V1: int  1 2 3 4 5 6
  + $ V2: Factor w/ 6 levels "LAYING","SITTING",..: 4 6 5 2 3 1

- xtrain (read from X_train.txt'): Training set- 7352 rows (observatioan), 561 columns/variables (measurements)  
  + 'data.frame':	7352 obs. of  561 variables (the first four variables copied below):
  + $ tBodyAcc-mean()-X                   : num  0.289 0.278 0.28 0.279 0.277 ...
  + $ tBodyAcc-mean()-Y                   : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
  + $ tBodyAcc-mean()-Z                   : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
  + $ tBodyAcc-std()-X                    : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
 

- ytrain ( read from y_train.txt'): Training labels for activities - 7352 rows (observations), 1 column (activity number)  
  + 'data.frame':	7352 obs. of  1 variable:
  + $ activitytype: int  5 5 5 5 5 5 5 5 5 5 ...

- xtest (read from X_test.txt'): Test set - 2947 rows (observations), 561 columns (measurements)  
  + 'data.frame':	2947 obs. of  561 variables (the first four variables copied below):
  + $ tBodyAcc-mean()-X                   : num  0.257 0.286 0.275 0.27 0.275 ...
  + $ tBodyAcc-mean()-Y                   : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...
  + $ tBodyAcc-mean()-Z                   : num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ...
  + $ tBodyAcc-std()-X                    : num  -0.938 -0.975 -0.994 -0.995 -0.994 ...
    

- ytest (read from 'y_test.txt'): Test labels for activities - 2947 rows (measurements), 1 column (activity number)  
  + 'data.frame':	2947 obs. of  1 variable:
  + $ activitytype: int  5 5 5 5 5 5 5 5 5 5 ...

- subjtrain (read from 'subject_train.txt): 7352 rows (observations), 1 column/variable (subjecid). Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  
  + 'data.frame':	7352 obs. of  1 variable:
  + $ subjectid: int  1 1 1 1 1 1 1 1 1 1 ...

- subjtest (read from 'subject_test.txt): 2947 rows (observations), 1 column/variable (subjectid). Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  
  + 'data.frame':	2947 obs. of  1 variable:
  + $ subjectid: int  2 2 2 2 2 2 2 2 2 2 ...

### The following transformations were made to get to the final tidy set:

- Combined/merged xtrain,ytrain, and subjtrain dataframe to create 1 dataframe for training reated data (7352 rows, 563 columns)

- Combined/merged xtest,ytest, and subjtest dataframes to create 1 dataframe for test reated data  (2947 rows, 563 columns)

- Merged two above datasets into "mergedData" dataframe using rbind-function ( 10299 rows, 563 columns/variables with subjectid and activitytype as first two columns)

- Slected those columns which had "mean" or "std" in their names (79 matches). I specifically searched for those 2 patterns. I didn't select variables which had word "Mean"(such as "tBodyAccMean" or "gravityMean") in their names. 79 variables were found.

- Subset the merged data for 81 variables (79 measurement variables + subjectid + activitytype). 10299 rows(observation), 81 columns

- The above dataset was used to create the final tidy set with average for each measurement variable (in respect to subjectid and activitytype). The final tiday set 
has 180 rows (30 subjects * 6 activities) and 81 columns/variables (79 measurement variables + subjectid + activitytype)


### The list of 79 measurement variables with mean/std in their names(before making them more descriptive): 
##### The units used for the accelerations are 'g's (gravity of earth -> 9.80665 m/seg2).
#####The gyroscope units are rad/seg.

 [1] "tBodyAcc-mean()-X"              
 [2] "tBodyAcc-mean()-Y"              
 [3] "tBodyAcc-mean()-Z"              
 [4] "tBodyAcc-std()-X"               
 [5] "tBodyAcc-std()-Y"               
 [6] "tBodyAcc-std()-Z"               
 [7] "tGravityAcc-mean()-X"           
 [8] "tGravityAcc-mean()-Y"           
 [9] "tGravityAcc-mean()-Z"           
[10] "tGravityAcc-std()-X"            
[11] "tGravityAcc-std()-Y"            
[12] "tGravityAcc-std()-Z"            
[13] "tBodyAccJerk-mean()-X"          
[14] "tBodyAccJerk-mean()-Y"          
[15] "tBodyAccJerk-mean()-Z"          
[16] "tBodyAccJerk-std()-X"           
[17] "tBodyAccJerk-std()-Y"           
[18] "tBodyAccJerk-std()-Z"           
[19] "tBodyGyro-mean()-X"             
[20] "tBodyGyro-mean()-Y"             
[21] "tBodyGyro-mean()-Z"             
[22] "tBodyGyro-std()-X"              
[23] "tBodyGyro-std()-Y"              
[24] "tBodyGyro-std()-Z"              
[25] "tBodyGyroJerk-mean()-X"         
[26] "tBodyGyroJerk-mean()-Y"         
[27] "tBodyGyroJerk-mean()-Z"         
[28] "tBodyGyroJerk-std()-X"          
[29] "tBodyGyroJerk-std()-Y"          
[30] "tBodyGyroJerk-std()-Z"          
[31] "tBodyAccMag-mean()"             
[32] "tBodyAccMag-std()"              
[33] "tGravityAccMag-mean()"          
[34] "tGravityAccMag-std()"           
[35] "tBodyAccJerkMag-mean()"         
[36] "tBodyAccJerkMag-std()"          
[37] "tBodyGyroMag-mean()"            
[38] "tBodyGyroMag-std()"             
[39] "tBodyGyroJerkMag-mean()"        
[40] "tBodyGyroJerkMag-std()"         
[41] "fBodyAcc-mean()-X"              
[42] "fBodyAcc-mean()-Y"              
[43] "fBodyAcc-mean()-Z"              
[44] "fBodyAcc-std()-X"               
[45] "fBodyAcc-std()-Y"               
[46] "fBodyAcc-std()-Z"               
[47] "fBodyAcc-meanFreq()-X"          
[48] "fBodyAcc-meanFreq()-Y"          
[49] "fBodyAcc-meanFreq()-Z"          
[50] "fBodyAccJerk-mean()-X"          
[51] "fBodyAccJerk-mean()-Y"          
[52] "fBodyAccJerk-mean()-Z"          
[53] "fBodyAccJerk-std()-X"           
[54] "fBodyAccJerk-std()-Y"           
[55] "fBodyAccJerk-std()-Z"           
[56] "fBodyAccJerk-meanFreq()-X"      
[57] "fBodyAccJerk-meanFreq()-Y"      
[58] "fBodyAccJerk-meanFreq()-Z"      
[59] "fBodyGyro-mean()-X"             
[60] "fBodyGyro-mean()-Y"             
[61] "fBodyGyro-mean()-Z"             
[62] "fBodyGyro-std()-X"              
[63] "fBodyGyro-std()-Y"              
[64] "fBodyGyro-std()-Z"              
[65] "fBodyGyro-meanFreq()-X"         
[66] "fBodyGyro-meanFreq()-Y"         
[67] "fBodyGyro-meanFreq()-Z"         
[68] "fBodyAccMag-mean()"             
[69] "fBodyAccMag-std()"              
[70] "fBodyAccMag-meanFreq()"         
[71] "fBodyBodyAccJerkMag-mean()"     
[72] "fBodyBodyAccJerkMag-std()"      
[73] "fBodyBodyAccJerkMag-meanFreq()" 
[74] "fBodyBodyGyroMag-mean()"        
[75] "fBodyBodyGyroMag-std()"         
[76] "fBodyBodyGyroMag-meanFreq()"    
[77] "fBodyBodyGyroJerkMag-mean()"    
[78] "fBodyBodyGyroJerkMag-std()"     
[79] "fBodyBodyGyroJerkMag-meanFreq()"



### The following changes were made to the names of 79 measurement variables to make them more readable: 

- Names of all variables were converted to lower case
- "t" at the begin of variable was changed to "timedomain"
- "f" at the begin of variable was changed to "frequencydomain "
- "Acc" in the name of variable was changed to "accelerometer"
- "Gyro"in the name of variable was changed to "gyroscope"
- "Mag" in the name of variable was changed to "magnitude"
- "()" was removed from the variable names  
- duplicate words were removed (e.g. first "Body" from "BodyBody")


##### The units used for the accelerations are 'g's (gravity of earth -> 9.80665 m/seg2).
##### The gyroscope units are rad/seg.

 [1] "timedomainbodyaccelerometermean-x"                    
 [2] "timedomainbodyaccelerometermean-y"                    
 [3] "timedomainbodyaccelerometermean-z"                    
 [4] "timedomainbodyaccelerometerstd-x"                     
 [5] "timedomainbodyaccelerometerstd-y"                     
 [6] "timedomainbodyaccelerometerstd-z"                     
 [7] "timedomaingravityaccelerometermean-x"                 
 [8] "timedomaingravityaccelerometermean-y"                 
 [9] "timedomaingravityaccelerometermean-z"                 
[10] "timedomaingravityaccelerometerstd-x"                  
[11] "timedomaingravityaccelerometerstd-y"                  
[12] "timedomaingravityaccelerometerstd-z"                  
[13] "timedomainbodyaccelerometerjerkmean-x"                
[14] "timedomainbodyaccelerometerjerkmean-y"                
[15] "timedomainbodyaccelerometerjerkmean-z"                
[16] "timedomainbodyaccelerometerjerkstd-x"                 
[17] "timedomainbodyaccelerometerjerkstd-y"                 
[18] "timedomainbodyaccelerometerjerkstd-z"                 
[19] "timedomainbodygyroscopemean-x"                        
[20] "timedomainbodygyroscopemean-y"                        
[21] "timedomainbodygyroscopemean-z"                        
[22] "timedomainbodygyroscopestd-x"                         
[23] "timedomainbodygyroscopestd-y"                         
[24] "timedomainbodygyroscopestd-z"                         
[25] "timedomainbodygyroscopejerkmean-x"                    
[26] "timedomainbodygyroscopejerkmean-y"                    
[27] "timedomainbodygyroscopejerkmean-z"                    
[28] "timedomainbodygyroscopejerkstd-x"                     
[29] "timedomainbodygyroscopejerkstd-y"                     
[30] "timedomainbodygyroscopejerkstd-z"                     
[31] "timedomainbodyaccelerometermagnitudemean"             
[32] "timedomainbodyaccelerometermagnitudestd"              
[33] "timedomaingravityaccelerometermagnitudemean"          
[34] "timedomaingravityaccelerometermagnitudestd"           
[35] "timedomainbodyaccelerometerjerkmagnitudemean"         
[36] "timedomainbodyaccelerometerjerkmagnitudestd"          
[37] "timedomainbodygyroscopemagnitudemean"                 
[38] "timedomainbodygyroscopemagnitudestd"                  
[39] "timedomainbodygyroscopejerkmagnitudemean"             
[40] "timedomainbodygyroscopejerkmagnitudestd"              
[41] "frequencydomainbodyaccelerometermean-x"               
[42] "frequencydomainbodyaccelerometermean-y"               
[43] "frequencydomainbodyaccelerometermean-z"               
[44] "frequencydomainbodyaccelerometerstd-x"                
[45] "frequencydomainbodyaccelerometerstd-y"                
[46] "frequencydomainbodyaccelerometerstd-z"                
[47] "frequencydomainbodyaccelerometermeanfreq-x"           
[48] "frequencydomainbodyaccelerometermeanfreq-y"           
[49] "frequencydomainbodyaccelerometermeanfreq-z"           
[50] "frequencydomainbodyaccelerometerjerkmean-x"           
[51] "frequencydomainbodyaccelerometerjerkmean-y"           
[52] "frequencydomainbodyaccelerometerjerkmean-z"           
[53] "frequencydomainbodyaccelerometerjerkstd-x"            
[54] "frequencydomainbodyaccelerometerjerkstd-y"            
[55] "frequencydomainbodyaccelerometerjerkstd-z"            
[56] "frequencydomainbodyaccelerometerjerkmeanfreq-x"       
[57] "frequencydomainbodyaccelerometerjerkmeanfreq-y"       
[58] "frequencydomainbodyaccelerometerjerkmeanfreq-z"       
[59] "frequencydomainbodygyroscopemean-x"                   
[60] "frequencydomainbodygyroscopemean-y"                   
[61] "frequencydomainbodygyroscopemean-z"                   
[62] "frequencydomainbodygyroscopestd-x"                    
[63] "frequencydomainbodygyroscopestd-y"                    
[64] "frequencydomainbodygyroscopestd-z"                    
[65] "frequencydomainbodygyroscopemeanfreq-x"               
[66] "frequencydomainbodygyroscopemeanfreq-y"               
[67] "frequencydomainbodygyroscopemeanfreq-z"               
[68] "frequencydomainbodyaccelerometermagnitudemean"        
[69] "frequencydomainbodyaccelerometermagnitudestd"         
[70] "frequencydomainbodyaccelerometermagnitudemeanfreq"    
[71] "frequencydomainbodyaccelerometerjerkmagnitudemean"    
[72] "frequencydomainbodyaccelerometerjerkmagnitudestd"     
[73] "frequencydomainbodyaccelerometerjerkmagnitudemeanfreq"  
[74] "frequencydomainbodygyroscopemagnitudemean"            
[75] "frequencydomainbodygyroscopemagnitudestd"             
[76] "frequencydomainbodygyroscopemagnitudemeanfreq"        
[77] "frequencydomainbodygyroscopejerkmagnitudemean"        
[78] "frequencydomainbodygyroscopejerkmagnitudestd"         
[79] "frequencydomainbodygyroscopejerkmagnitudemeanfreq"    
