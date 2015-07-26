

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
names(ytest) = "activitytype"
names(ytrain) = "activitytype"

## rename the variable name for x_test and x_train with variable names from feature file
names(xtest) = features$V2
names(xtrain) = features$V2

## rename the variable name for subject_test and subject_train to "subject_ID"
names(subjtrain) = "subjectid"
names(subjtest) = "subjectid"

## combine all x_test related files with subject_ID and activity_type as firt two columns
xtest_extend = cbind(subjtest,ytest,xtest)

## combine all x_trian related files with subject_ID and activity_type as firt two columns
xtrain_extend = cbind(subjtrain,ytrain,xtrain)

## merge two datasets into "mergedData" dataframe using rbind-function
mergedData = rbind(xtrain_extend,xtest_extend)


## select those columns which have "mean" or "std" in their names
## Not including variables that include "tBodyAccMean" or "gravityMean"
feat_mean_std = grep("mean|std",names(mergedData))

## Add subjectid and acivitytype to the variable list
feat_mean_std= c(1,2,feat_mean_std)

## subset the merged data: keep variables with "mean"/"std" in their names + subject_ID + activity_type
mergedData = mergedData[,feat_mean_std]

## arrange merged data by subject_ID and activity_type
mergedData = arrange(mergedData, subjectid , activitytype)

## substitute activity numbers with activity names
mergedData$activitytype[mergedData$activitytype==1]="WALKING"
mergedData$activitytype[mergedData$activitytype==2]="WALKING_UPSTAIRS"
mergedData$activitytype[mergedData$activitytype==3]="WALKING_DOWNSTAIRS"
mergedData$activitytype[mergedData$activitytype==4]="SITTING"
mergedData$activitytype[mergedData$activitytype==5]="STANDING"
mergedData$activitytype[mergedData$activitytype==6]="LAYING"


## change variable names to more descriptive names

names(mergedData) =gsub("^t", "timedomain",names(mergedData))
names(mergedData) =gsub("^f", "frequencydomain",names(mergedData))
names(mergedData) =gsub("Acc", "accelerometer",names(mergedData))
names(mergedData) =gsub("Gyro", "gyroscope",names(mergedData))
names(mergedData) =gsub("Mag", "magnitude",names(mergedData))
names(mergedData) =gsub("-mean()", "mean",names(mergedData))
names(mergedData) =gsub("-std()", "std",names(mergedData))
names(mergedData) =gsub("[()]", "",names(mergedData))
names(mergedData) =gsub("BodyBody", "body",names(mergedData))
names(mergedData) =gsub("Jerk", "jerk",names(mergedData))
names(mergedData) = tolower(names(mergedData))

## Step 5
## summarize the data by subject_ID and activity_type using aggregate function
## then arrange them in order (for each subject order the activities)
summaryData = aggregate(mergedData[,-(1:2)], by = mergedData[c("subjectid","activitytype")], FUN=mean)
activity_factor = factor(summaryData$activitytype, levels = activlabel$V2)
summaryData = summaryData[order(summaryData$subjectid, activity_factor),]


# write the data into "summarydata.txt" with row.names=FALSE and seperartion = space
write.table(summaryData, "summarydata.txt", row.names = FALSE, sep=" ")
