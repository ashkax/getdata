
 
# 1) a tidy data set as described below,
# 2) a link to a Github repository with your script for performing the analysis, and
# 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.
# 4) You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

setwd ("C:/getdata/UCI HAR Dataset/")


# You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


library(plyr)
library(qdap)
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" , "./")
 
colNumToFeaturesMapping <- read.table ("features.txt")
activity_labels <- read.table ("activity_labels.txt")
colnames(activity_labels) <- c("activityID", "activity_labels")

# Merges the training and the test sets to create one data set.
    #Reading the test datasset
    testXSet <- read.table ("./test/X_test.txt")
    testActivityID <- read.table ("./test/Y_test.txt")
    testSubjectId <- read.table ("./test/subject_test.txt")
    
    #Rename columns to human readable names
    colnames(testXSet) <- colNumToFeaturesMapping$V2         #Name the columns according to feature name
    colnames ( testActivityID ) <- "activityID"              #Activity IDS corresponding to rows
    colnames ( testSubjectId ) <- "subjectID"                #Subject IDs for each row
    
    #Combine the columns of activityID, subjectID, and the data together
    testDataSet<-cbind (testActivityID, testSubjectId , testXSet  )

    #Reading the train datasset
    trainXSet <- read.table ("./train/X_train.txt")
    trainActivityID <- read.table ("./train/Y_train.txt")
    trainSubjectId <- read.table ("./train/subject_train.txt")
    
    #Rename columns to human readable names
    colnames(trainXSet) <- colNumToFeaturesMapping$V2         #Name the columns according to feature name
    colnames ( trainActivityID ) <- "activityID"              #Activity IDS corresponding to rows
    colnames ( trainSubjectId ) <- "subjectID"                #Subject IDs for each row
    
    #Combine the columns of activityID, subjectID, and the data together
    trainDataSet<-cbind (trainActivityID, trainSubjectId , trainXSet  )
    

    #now merge test and train datasets
    testtrainDataSet <- rbind (trainDataSet, testDataSet )

    #Add the acitivty labels corresponding to each activityID
    testtrainDataSet$activityLabel <- lookup(testtrainDataSet$activityID , activity_labels )

    
    #We are only interest in mean and std measurements    

interestingColNames <- c ( "activityID" , 
    "subjectID" , 
    "tBodyAcc-mean()-X" , 
    "tBodyAcc-mean()-Y" , 
    "tBodyAcc-mean()-Z" , 
    "tBodyAcc-std()-X" , 
    "tBodyAcc-std()-Y" , 
    "tBodyAcc-std()-Z" , 
    "tGravityAcc-mean()-X" , 
    "tGravityAcc-mean()-Y" , 
    "tGravityAcc-mean()-Z" , 
    "tGravityAcc-std()-X" , 
    "tGravityAcc-std()-Y" , 
    "tGravityAcc-std()-Z" , 
    "tBodyAccJerk-mean()-X" , 
    "tBodyAccJerk-mean()-Y" , 
    "tBodyAccJerk-mean()-Z" , 
    "tBodyAccJerk-std()-X" , 
    "tBodyAccJerk-std()-Y" , 
    "tBodyAccJerk-std()-Z" , 
    "tBodyGyro-mean()-X" , 
    "tBodyGyro-mean()-Y" , 
    "tBodyGyro-mean()-Z" , 
    "tBodyGyro-std()-X" , 
    "tBodyGyro-std()-Y" , 
    "tBodyGyro-std()-Z" , 
    "tBodyGyroJerk-mean()-X" , 
    "tBodyGyroJerk-mean()-Y" , 
    "tBodyGyroJerk-mean()-Z" , 
    "tBodyGyroJerk-std()-X" , 
    "tBodyGyroJerk-std()-Y" , 
    "tBodyGyroJerk-std()-Z" , 
    "tBodyAccMag-mean()" , 
    "tBodyAccMag-std()" , 
    "tGravityAccMag-mean()" , 
    "tGravityAccMag-std()" , 
    "tBodyAccJerkMag-mean()" , 
    "tBodyAccJerkMag-std()" , 
    "tBodyGyroMag-mean()" , 
    "tBodyGyroMag-std()" , 
    "tBodyGyroJerkMag-mean()" , 
    "tBodyGyroJerkMag-std()" , 
    "fBodyAcc-mean()-X" , 
    "fBodyAcc-mean()-Y" , 
    "fBodyAcc-mean()-Z" , 
    "fBodyAcc-std()-X" , 
    "fBodyAcc-std()-Y" , 
    "fBodyAcc-std()-Z" , 
    "fBodyAccJerk-mean()-X" , 
    "fBodyAccJerk-mean()-Y" , 
    "fBodyAccJerk-mean()-Z" , 
    "fBodyAccJerk-std()-X" , 
    "fBodyAccJerk-std()-Y" , 
    "fBodyAccJerk-std()-Z" , 
    "fBodyGyro-mean()-X" , 
    "fBodyGyro-mean()-Y" , 
    "fBodyGyro-mean()-Z" , 
    "fBodyGyro-std()-X" , 
    "fBodyGyro-std()-Y" , 
    "fBodyGyro-std()-Z" , 
    "fBodyAccMag-mean()" , 
    "fBodyAccMag-std()" , 
    "fBodyBodyAccJerkMag-mean()" , 
    "fBodyBodyAccJerkMag-std()" , 
    "fBodyBodyGyroMag-mean()" , 
    "fBodyBodyGyroMag-std()" , 
    "fBodyBodyGyroJerkMag-mean()" , 
    "fBodyBodyGyroJerkMag-std()" , 
    "activityLabel" )
    
    testtrainDataSetMeanStd <- testtrainDataSet [, interestingColNames]

#Write the ouput required for task1
    write.table ( testtrainDataSetMeanStd, "./testtrainDataSetMeanStd.txt")



#Average by acitivty and subject for each of the variables
    require(reshape2)
    averageBySubjectAndAcitivity <- aggregate( . ~  subjectID + activityID  , data = testtrainDataSetMeanStd, FUN=mean)









