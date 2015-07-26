

## The code requires "dplyr" library
library(dplyr)

## the code assumes all required test files are already in the working directory
## read all training related data
xtrain = read.table("X_train.txt")
ytrain = read.table("y_train.txt")
subjtrain = read.table("subject_train.txt")

## read all test related data
xtest = read.table("X_test.txt")
ytest = read.table("y_test.txt")
subjtest = read.table("subject_test.txt")

## read features (variables) and activity labels
features = read.table("features.txt")
activlabel = read.table("activity_labels.txt")

## rename the variable name for y_test and y_train to "activity_type"
names(ytest) = "activity_type"
names(ytrain) = "activity_type"

## rename the variable name for x_test and x_train with variable names from feature file
names(xtest) = features$V2
names(xtrain) = features$V2

## rename the variable name for subject_test and subject_train to "subject_ID"
names(subjtrain) = "subject_ID"
names(subjtest) = "subject_ID"

## combine all x_test related files with subject_ID and activity_type as firt two columns
xtest_extend = cbind(subjtest,ytest,xtest)

## combine all x_trian related files with subject_ID and activity_type as firt two columns
xtrain_extend = cbind(subjtrain,ytrain,xtrain)

## merge two datasets into "mergedData" dataframe using rbind-function
mergedData = rbind(xtrain_extend,xtest_extend)

## select those columns which have "mean" or "std" in their names
## Not including variables that include "tBodyAccMean" or "gravityMean"
feat_mean_std = grep("mean|std",names(mergedData))

## Add subject_ID and acivity_type to the variable list
feat_mean_std= c(1,2,feat_mean_std)

## subset the merged data: keep variables with "mean"/"std" in their names + subject_ID + activity_type
mergedData = mergedData[,feat_mean_std]

## arrange merged data by subject_ID and activity_type
mergedData = arrange(mergedData, subject_ID , activity_type)

## substitute activity numbers with activity names
mergedData$activity_type[mergedData$activity_type==1]="WALKING"
mergedData$activity_type[mergedData$activity_type==2]="WALKING_UPSTAIRS"
mergedData$activity_type[mergedData$activity_type==3]="WALKING_DOWNSTAIRS"
mergedData$activity_type[mergedData$activity_type==4]="SITTING"
mergedData$activity_type[mergedData$activity_type==5]="STANDING"
mergedData$activity_type[mergedData$activity_type==6]="LAYING"


## change variable names to more descriptive names
names(mergedData) =gsub("^t", "Time Domain ",names(mergedData))
names(mergedData) =gsub("^f", "Frequency Domain ",names(mergedData))
names(mergedData) =gsub("Acc", " Accelerometer",names(mergedData))
names(mergedData) =gsub("Gyro", " Gyroscope",names(mergedData))
names(mergedData) =gsub("Mag", " Magnitude",names(mergedData))
names(mergedData) =gsub("-mean()", " mean",names(mergedData))
names(mergedData) =gsub("-std()", " std",names(mergedData))
names(mergedData) =gsub("[()]", "",names(mergedData))
names(mergedData) =gsub("X", "X Axis",names(mergedData))
names(mergedData) =gsub("Y", "Y Axis",names(mergedData))
names(mergedData) =gsub("Z", "Z Axis",names(mergedData))
names(mergedData) =gsub("BodyBody", "Body",names(mergedData))
names(mergedData) =gsub("Jerk", " Jerk",names(mergedData))


## Step 5
## summarize the data by subject_ID and activity_type using aggregate function
## then arrange them in order (for each subject_ID order the activities)
summaryData = aggregate(mergedData[,-(1:2)], by = mergedData[c("subject_ID","activity_type")], FUN=mean)
activity_factor = factor(summaryData$activity_type, levels = activlabel$V2)
summaryData = summaryData[order(summaryData$subject_ID, activity_factor),]


# write the data into "summarydata.txt" with row.names=FALSE and seperartion = tab
write.table(summaryData, "summarydata.txt", row.names = FALSE, sep="\t")
