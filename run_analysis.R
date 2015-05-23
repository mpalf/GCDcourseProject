################################################################################
##
## Getting and Cleaning Data - Course Project
##
## The purpose of this project is to demonstrate the ability to collect,
## work with, and clean a data set. The goal is to prepare tidy data that can
## be used for later analysis. 
##
## run_analysis.R
##
## The data used for this project was collected from the accelerometers from
## the Samsung Galaxy S smartphone. A full description is available at the
## site where the data was obtained: 
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##
## This script does the following:
##   - Merges the training and the test sets to create one data set.
##   - Extracts only the measurements on the mean and standard deviation for
##     each measurement. 
##   - Uses descriptive activity names to name the activities in the data set
##   - Appropriately labels the data set with descriptive variable names. 
##   - From the data set in step 4, creates a second, independent tidy data set
##     with the average of each variable for each activity and each subject.
##
################################################################################

library(plyr)

# let's assume that the current working directory is set to folder containing the 
# extracted data from:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# read activity labels from "activity_labels.txt"
activities <- read.table("activity_labels.txt", header = FALSE, sep = "", col.names = c("id", "label"))

# read variable names from "features.txt"
features <- read.table("features.txt", header = FALSE, sep = "")
colNames <- features[,2]

# read train data and assign column names to variable names obtained from "features.txt"
train <- read.table("./train/X_train.txt", header = FALSE, sep = "", colClasses = "numeric")
names(train) <- colNames

# read train data activity IDs
train_activities <- read.table("./train/y_train.txt", header = FALSE, sep = "", col.names = c("activity"))

# read train subject IDs
train_subjects <- read.table("./train/subject_train.txt", header = FALSE, sep = "", col.names = c("subject"))

# add activity and subject IDs to train data as separate columns
train <- cbind(train_subjects, train_activities, train)

# read test data and assign column names to variable names obtained from "features.txt"
test <- read.table("./test/X_test.txt", header = FALSE, sep = "", colClasses = "numeric")
names(test) <- colNames

# read test data activity IDs
test_activities <- read.table("./test/y_test.txt", header = FALSE, sep = "", col.names = c("activity"))

# read test subject IDs
test_subjects <- read.table("./test/subject_test.txt", header = FALSE, sep = "", col.names = c("subject"))

# add activity and subject IDs to test data as separate columns
test <- cbind(test_subjects, test_activities, test)

# merge the two datasets
mergedData <- rbind(train, test)

# get columns with mean and standard deviation values by searching for "-mean()" and "-std()" substrings in column names
selectedCols <- grep("-mean[(][)]|-std[(][)]", names(mergedData))

# extract selected columns (+ subject id + activity label) from merged data
extractedData <- mergedData[,c(1:2,selectedCols)]

# check variable types (classes)
table(sapply(extractedData, function(x) class(x)))
# check for missing values
any(is.na(extractedData))

# split data frame by "subject" and "activity" and calculate mean of each column (if numeric)
tidyData <- ddply(extractedData, .(subject, activity), sapply, function(x) if(is.numeric(x)) { mean(x) } else { x[1] } )
# recode activity IDs into activity labels
tidyData$activity <- sapply(tidyData$activity, function(x) activities$label[activities$id==x])

# save (as tab-delimited text file)
outputFile <- file("tidy_data.txt", "wb")
write.table(tidyData, outputFile, sep="\t", row.names=FALSE)
close(outputFile)
