## Checks file exists or not and stops the execution if file does not exist 
FileExists <- function(fname)  {
        if(!file.exists(fname))
                stop(paste("Data set", fname, "does not exist"))        
}

## Reads a file into a data frame
ReadTable <- function(fname) {
        ## Check for file exists or not
        FileExists(fname)
        
        ## Read file into a data frame
        read.table(fname, stringsAsFactors = FALSE)
}

## Reads two files into data frames and merges them into one data frame
ReadAndMerge <- function(fname1, fname2)  {
        ## Read first file into a data frame
        df1 <- ReadTable(fname1)
        
        ## Read second file into a data frame
        df2 <- ReadTable(fname2)
        
        ## Combine both data frames
        rbind(df1, df2)        
}

## 0. Load the required packages and read feature and 
##    activity labels into data frames
## 0.1 Load the required packages
library(dplyr)
library(reshape2)

## 0.2. Read features into a feature data frame 
fDF <- ReadTable("./UCI HAR Dataset/features.txt")

## 0.3. Read activity labels into a activity data frame
aDF <- ReadTable("./UCI HAR Dataset/activity_labels.txt");

## 1. Merges the training and the test sets to create one data set.
## 1.1. Read and merge train and test data sets into a main data frame 
mDF <- ReadAndMerge("./UCI HAR Dataset/train/X_train.txt", 
                    "./UCI HAR Dataset/test/X_test.txt")

## 1.2. Merge train and test label data sets into a label data frame 
lDF <- ReadAndMerge("./UCI HAR Dataset/train/y_train.txt", 
                    "./UCI HAR Dataset/test/y_test.txt")

## 1.3. Merge train and test subject data sets into a subject data frame
sDF <- ReadAndMerge("./UCI HAR Dataset/train/subject_train.txt", 
                    "./UCI HAR Dataset/test/subject_test.txt")

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 2.1 Get measured column indices from feature data frame that contains either mean() or std()
##     in its second column
measuredColIndices <- grep("mean[(][)]|std[(][)]", fDF$V2);

## 2.2. Get the measured columns names that contains either mean() or std()
measuredColNames <- fDF[fDF$V1 %in% measuredColIndices, "V2"]

## 2.3. Remove feature data frame as it is no more needed
rm(fDF)

## 2.4. Get only the measurements on the mean and standard deviation for each measurement. 
mDF <- mDF[ , measuredColIndices]

## 3. Uses descriptive activity names to name the activities in the data set

## 3.1. Merge label data frame and activity data frame into activity data frame
##      as V1 of lable data frame and V1 of acitvity data frame matches
aDF <- merge(lDF, aDF, sort = FALSE)

## 3.2. Remove label data frame as it is no more needed
rm(lDF)

## 3.3. Combine activity data fram and main data fram into main data frame
mDF <- cbind(aDF, mDF)

## 3.4. Remove activity data frame as it is no more needed
rm(aDF)

## 3.5. Combine subject data frame and main data frame into main data frame
mDF <- cbind(sDF, mDF)

## 3.6. Remove subject data frame as it is no more needed
rm(sDF)

## 4. Appropriately labels the data set with descriptive variable names. 
colnames(mDF) <- c("Subject", "ActivityId", "Activity", measuredColNames)

## 5. From the data set in step 4, creates a second, independent tidy data set with the
##    average of each variable for each activity and each subject.
## 5.1. Melt the main data frame using appropriate identifiers and measured variables  
mDFMelt <- melt(mDF, id = c("Subject", "ActivityId", "Activity"), 
                mesaure.vars = measuredColNames)

## 5.2. Cast a molten data frame into a tidy data frame by calculate the average of each
##      measured varaible for each activiity and each subject
tDF <- dcast(mDFMelt, Subject + ActivityId + Activity ~ variable , mean)

## 5.3. Sort the tidy data frame by Subject and ActivityId
tDF <- arrange(tDF, Subject , ActivityId)

## 5.4. Write tidy data frame into a tidy data set
write.table(tDF, file = "./UCI HAR Dataset/tidy.txt", row.names = FALSE)

