+Intro
Reads the Samsung Data for Coursera Course
++ What it includes:
# You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


++ How it works:
# Merges the training and the test sets to create one data set.
#Reading the test datasset
#Rename columns to human readable names
#Combine the columns of activityID, subjectID, and the data together

#Reading the train datasset
#Rename columns to human readable names
#Combine the columns of activityID, subjectID, and the data together


#now merge test and train datasets
#Add the acitivty labels corresponding to each activityID
#We are only interest in mean and std measurements, so just picks those columns

#Write the ouput required for task1


#Average by acitivty and subject for each of the variables
