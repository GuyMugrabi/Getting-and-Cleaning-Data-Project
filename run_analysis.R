## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.




#### Task #1 Start -  Merging the training and the test sets to create one data set #####

# If you want the script to run change the working directory 
# into your working directory. This is mine:
setwd("D:\\R\\CleaningData")

#Extract the file found at "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
#into your working directory, this will give you a folder named "UCI HAR Dataset" with sub directories and files
temp <- tempfile()
fileName <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileName,temp)
unzip(temp, files = NULL, list = FALSE, overwrite = TRUE, junkpaths = FALSE, exdir = ".", unzip = "internal", setTimes = FALSE)
unlink(temp)


#Getting the list of the files
path <- file.path("UCI HAR Dataset")
files <- list.files(path, recursive=TRUE)
files

## The files that will be used to load data are listed as follows:##
# * test/subject_test.txt
# * train/subject_train.txt
# * test/X_test.txt
# * train/X_train.txt
# * test/y_test.txt
# * train/y_train.txt
####################################################################
# Values of the Variable "Activity" consist of data from “Y_train.txt” and “Y_test.txt”
# values of Variable "Subject" consist of data from “subject_train.txt” and "subject_test.txt"
# Values of Variables "Features" consist of data from “X_train.txt” and “X_test.txt”
# Names of Variable "Features" come from “features.txt”
# levels of Variable "Activity" come from “activity_labels.txt”
####################################################################

##Read data from the files into the variables

# Read the Activity files
activityTest  <- read.table(file.path(path, "test" , "Y_test.txt" ),header = FALSE)
activityTrain <- read.table(file.path(path, "train", "Y_train.txt"),header = FALSE)

# Read the Subject files
subjectTrain <- read.table(file.path(path, "train", "subject_train.txt"),header = FALSE)
subjectTest  <- read.table(file.path(path, "test" , "subject_test.txt"),header = FALSE)

# Read Fearures files
featuresTest  <- read.table(file.path(path, "test" , "X_test.txt" ),header = FALSE)
featuresTrain <- read.table(file.path(path, "train", "X_train.txt"),header = FALSE)

# creating new tables with rows of the test and train data tables per activity, subject and features
activities <- rbind(activityTrain, activityTest)
subjects <- rbind(subjectTrain, subjectTest)
features <- rbind(featuresTrain, featuresTest)

#setting names to variables
names(subjects) <- c("subject")
names(activities) <- c("activity")

# features.txt file holds the code and the name of the 561! features
featuresNames <- read.table(file.path(path, "features.txt"),head=FALSE)
names(features) <- featuresNames$V2

# Merging the columns to get the data frame "Data" for all data in two steps
combined <- cbind(subjects, activities)
Data <- cbind(combined, features)
# "Data" now holds all the data from the tables.



#### Task #1 End -  Merging the training and the test sets to create one data set #####

#### Task #2 Start -  Extracting only the measurements on the mean and standard deviation for each measurement #####

# Subsetting the list of feature names if they have "mean()" or "std()" string in them. 
# I realized that if I use the RegEx "mean|std" I get columns like "angle(tBodyGyroMean,gravityMean)" or "fBodyBodyGyroMag-meanFreq()"
subFeaturesNames <- featuresNames$V2[grep("mean\\(\\)|std\\(\\)", featuresNames$V2)]

# Converting the factor vector into character vector that we will use to subset "Data"
# Subsetting the data frame Data by seleted names of Features - including "subject" and "activity"columns
Data1 <- subset(Data, select = c("subject", "activity", as.character(subFeaturesNames)))
str(Data1)

#### Part #2 End -  Extracting only the measurements on the mean and standard deviation for each measurement #####

#### Part #3 Starts -  Use descriptive activity names to name the activities in the data set #####

# Reading descriptive activity names from “activity_labels.txt”
activityNames <- read.table(file.path(path, "activity_labels.txt"),header = FALSE)

# facorizing Variale activity in the data frame Data1 using the descriptive activity names
Data1$activity <- activityNames[Data1$activity, 2]


#### Part #3 Ends -  Use descriptive activity names to name the activities in the data set #####

#### Part #4 Starts -  Appropriately labels the data set with descriptive activity names #####

#using "gsub()" for pattern matching and replacement of parrtial words with full words for better understanding of variables meaning

names(Data1) <- gsub("^t", "time_", names(Data1))
names(Data1) <- gsub("^f", "frequency_", names(Data1))
names(Data1) <- gsub("Acc", "Accelerometer_", names(Data1))
names(Data1) <- gsub("Gyro", "Gyroscope_", names(Data1))
names(Data1) <- gsub("Mag", "Magnitude_", names(Data1))
names(Data1) <- gsub("Body", "Body_", names(Data1))

#### Part #4 Ends -  Appropriately labels the data set with descriptive activity names #####

#### Part #5 Starts -  Creates a second, independent tidy data set with the average of each variable for each activity and each subject #####
library(plyr)
Data1 <- aggregate(. ~subject + activity, data = Data1, FUN=mean)
Data1 <- Data1[order(Data2$subject, Data2$activity), ]

write.table(Data1, file = "tidydata.txt",row.name=FALSE)

#### Part #5 Ends -  Creates a second, independent tidy data set with the average of each variable for each activity and each subject #####
