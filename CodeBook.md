---
title: "Tidy Data Set Details"
author: "Surekha Venu"
date: "Wednesday, May 20, 2015"
output: html_document
---

Following are functions defined in run_analysis.R:
```{r}
FileExists: Checks file exists or not and stops the execution if file does not exist 

ReadTable: Reads a file into a data frame

ReadAndMerge: Reads two files into data frames and merges them into one data frame
```

Followng are steps used in run_analysis.R for preparing the tidy data set.
```{r}
0. Load the required packages and read features and activity labels into data frames
        0.1. Load the required packages such as dplyr and reshape2
        0.2. Read features into a feature data frame 
        0.3. Read activity labels into a activity data frame

1. Merges the training and the test sets to create one data set.
        1.1. Read and merge train and test data sets into a main data frame 
        1.2. Merge train and test label data sets into a label data frame 
        1.3. Merge train and test subject data sets into a subject data frame

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
        2.1. Get measured column indices from feature data frame that contains 
             either mean() or std() in its second column
        2.2. Get the measured columns names that contains either mean() or std()
        2.3. Remove feature data frame as it is no more needed
        2.4. Get only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set
        3.1. Merge label data frame and activity data frame into activity data frame
             as V1 of label data frame and V1 of acitvity data frame matches
        3.2. Remove label data frame as it is no more needed
        3.3. Combine activity data fram and main data fram into main data frame
        3.4. Remove activity data frame as it is no more needed
        3.5. Combine subject data frame and main data frame into main data frame
        3.6. Remove subject data frame as it is no more needed

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the
   average of each variable for each activity and each subject.
        5.1. Melt the main data frame using appropriate identifiers and measured variables  
        5.2. Cast a molten data frame into a tidy data frame by calculate the average of each
             measured varaible for each activiity and each subject
        5.3. Sort the tidy data frame by Subject and ActivityId
        5.4. Write tidy data frame into a tidy data set
```


Following are descriptions of variables in the prepared tidy data set.
```{r}
Subject: identifies the subject who performed the activity for each window sample
ActivityId: identifies the activity performed
Activity: identifies the activity name
tBodyAcc-mean()-X: average of each tBodyAcc-mean()-X for each activity and for each subject
tBodyAcc-mean()-Y: average of each tBodyAcc-mean()-Y for each activity and for each subject
tBodyAcc-mean()-Z: average of each tBodyAcc-mean()-Z for each activity and for each subject
tBodyAcc-std()-X: average of each tBodyAcc-std()-X for each activity and for each subject
tBodyAcc-std()-Y: average of each tBodyAcc-std()-Y for each activity and for each subject
tBodyAcc-std()-Z: average of each tBodyAcc-std()-Z for each activity and for each subject
tGravityAcc-mean()-X: average of each tGravityAcc-mean()-X for each activity and for each subject
tGravityAcc-mean()-Y: average of each tGravityAcc-mean()-Y for each activity and for each subject
tGravityAcc-mean()-Z: average of each tGravityAcc-mean()-Z for each activity and for each subject
tGravityAcc-std()-X: average of each tGravityAcc-std()-X for each activity and for each subject
tGravityAcc-std()-Y: average of each tGravityAcc-std()-Y for each activity and for each subject
tGravityAcc-std()-Z: average of each tGravityAcc-std()-Z for each activity and for each subject
tBodyAccJerk-mean()-X: average of each tBodyAccJerk-mean()-X for each activity and for each subject
tBodyAccJerk-mean()-Y: average of each tBodyAccJerk-mean()-Y for each activity and for each subject
tBodyAccJerk-mean()-Z: average of each tBodyAccJerk-mean()-Z for each activity and for each subject
tBodyAccJerk-std()-X: average of each tBodyAccJerk-std()-X for each activity and for each subject
tBodyAccJerk-std()-Y: average of each tBodyAccJerk-std()-Y for each activity and for each subject
tBodyAccJerk-std()-Z: average of each tBodyAccJerk-std()-Z for each activity and for each subject
tBodyGyro-mean()-X: average of each tBodyGyro-mean()-X for each activity and for each subject
tBodyGyro-mean()-Y: average of each tBodyGyro-mean()-Y for each activity and for each subject
tBodyGyro-mean()-Z: average of each tBodyGyro-mean()-Z for each activity and for each subject
tBodyGyro-std()-X: average of each tBodyGyro-std()-X for each activity and for each subject
tBodyGyro-std()-Y: average of each tBodyGyro-std()-Y for each activity and for each subject
tBodyGyro-std()-Z: average of each tBodyGyro-std()-Z for each activity and for each subject
tBodyGyroJerk-mean()-X: average of each tBodyGyroJerk-mean()-X for each activity and for each subject
tBodyGyroJerk-mean()-Y: average of each tBodyGyroJerk-mean()-Y for each activity and for each subject
tBodyGyroJerk-mean()-Z: average of each tBodyGyroJerk-mean()-Z for each activity and for each subject
tBodyGyroJerk-std()-X: average of each tBodyGyroJerk-std()-X for each activity and for each subject
tBodyGyroJerk-std()-Y: average of each tBodyGyroJerk-std()-Y for each activity and for each subject
tBodyGyroJerk-std()-Z: average of each tBodyGyroJerk-std()-Z for each activity and for each subject
tBodyAccMag-mean(): average of each tBodyAccMag-mean() for each activity and for each subject
tBodyAccMag-std(): average of each tBodyAccMag-std() for each activity and for each subject
tGravityAccMag-mean(): average of each tGravityAccMag-mean() for each activity and for each subject
tGravityAccMag-std(): average of each tGravityAccMag-std() for each activity and for each subject
tBodyAccJerkMag-mean(): average of each tBodyAccJerkMag-mean() for each activity and for each subject
tBodyAccJerkMag-std(): average of each tBodyAccJerkMag-std() for each activity and for each subject
tBodyGyroMag-mean(): average of each tBodyGyroMag-mean() for each activity and for each subject
tBodyGyroMag-std(): average of each tBodyGyroMag-std() for each activity and for each subject
tBodyGyroJerkMag-mean(): average of each tBodyGyroJerkMag-mean() for each activity and for each subject
tBodyGyroJerkMag-std(): average of each tBodyGyroJerkMag-std() for each activity and for each subject
fBodyAcc-mean()-X: average of each fBodyAcc-mean()-X for each activity and for each subject
fBodyAcc-mean()-Y: average of each fBodyAcc-mean()-Y for each activity and for each subject
fBodyAcc-mean()-Z: average of each fBodyAcc-mean()-Z for each activity and for each subject
fBodyAcc-std()-X: average of each fBodyAcc-std()-X for each activity and for each subject
fBodyAcc-std()-Y: average of each fBodyAcc-std()-Y for each activity and for each subject
fBodyAcc-std()-Z: average of each fBodyAcc-std()-Z for each activity and for each subject
fBodyAccJerk-mean()-X: average of each fBodyAccJerk-mean()-X for each activity and for each subject
fBodyAccJerk-mean()-Y: average of each fBodyAccJerk-mean()-Y for each activity and for each subject
fBodyAccJerk-mean()-Z: average of each fBodyAccJerk-mean()-Z for each activity and for each subject
fBodyAccJerk-std()-X: average of each fBodyAccJerk-std()-X for each activity and for each subject
fBodyAccJerk-std()-Y: average of each fBodyAccJerk-std()-Y for each activity and for each subject
fBodyAccJerk-std()-Z: average of each fBodyAccJerk-std()-Z for each activity and for each subject
fBodyGyro-mean()-X: average of each fBodyGyro-mean()-X for each activity and for each subject
fBodyGyro-mean()-Y: average of each fBodyGyro-mean()-Y for each activity and for each subject
fBodyGyro-mean()-Z: average of each fBodyGyro-mean()-Z for each activity and for each subject
fBodyGyro-std()-X: average of each fBodyGyro-std()-X for each activity and for each subject
fBodyGyro-std()-Y: average of each fBodyGyro-std()-Y for each activity and for each subject
fBodyGyro-std()-Z: average of each fBodyGyro-std()-Z for each activity and for each subject
fBodyAccMag-mean(): average of each fBodyAccMag-mean() for each activity and for each subject
fBodyAccMag-std(): average of each fBodyAccMag-std() for each activity and for each subject
fBodyBodyAccJerkMag-mean(): average of each fBodyBodyAccJerkMag-mean() for each activity and for each subject
fBodyBodyAccJerkMag-std(): average of each fBodyBodyAccJerkMag-std() for each activity and for each subject
fBodyBodyGyroMag-mean(): average of each fBodyBodyGyroMag-mean() for each activity and for each subject
fBodyBodyGyroMag-std(): average of each fBodyBodyGyroMag-std() for each activity and for each subject
fBodyBodyGyroJerkMag-mean(): average of each fBodyBodyGyroJerkMag-mean() for each activity and for each subject
fBodyBodyGyroJerkMag-std(): average of each fBodyBodyGyroJerkMag-std() for each activity and for each subject
```
