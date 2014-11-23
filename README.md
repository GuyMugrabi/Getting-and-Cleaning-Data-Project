Readme
=============================

Original Data source
-----------
This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here is the link to the original data used for this project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Feature Selection 
-----------------
I refer you to the README and features.txt files in the original dataset to learn more about the feature selection for this dataset. 


The description of the variables in tidydata.txt can be found in the file Codebook.MD

The code that can be found in run_analysis.R file in this repository creates the file tidydata.txt and does that in the following 5 steps:

**1. Meging the training and tests data sets (total of 6 files) into one big data frame.**

1.1 The code first extracts the zip file found at "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" into the working directory, this will give you a folder named "UCI HAR Dataset" with sub directories and files.
```
The files that will be used to load data are listed as follows
- test/subject_test.txt
- train/subject_train.txt
- test/X_test.txt
- train/X_train.txt
- test/y_test.txt
- train/y_train.txt

Values of the Variable "Activity" consist of data from “Y_train.txt” and “Y_test.txt”
Values of Variable "Subject" consist of data from “subject_train.txt” and "subject_test.txt"
Values of Variables "Features" consist of data from “X_train.txt” and “X_test.txt”
Names of Variable "Features" come from “features.txt”
levels of Variable "Activity" come from “activity_labels.txt”
```
1.1 I started with reading all of the 6 files above into variables

1.2 I used rbind() to create 3 new tables with rows of the test and train data tables per activity, subject and features

1.3 I set the names to the column names using the features.txt file that holds the code and the name of the 561! features

1.4 I've merged the columns of the 3 tables I've created to get the data frame "Data" for all data in two steps

**2. Extracting only the measurements on the mean and standard deviation for each measurement**

2.1 Subsetting the list of feature names (columns of "Data" that I've created in step 1 above) to include only the column names that have "mean()" or "std()" string in them. 

**3. Use descriptive activity names to name the activities in the data set**
3.1 Reading descriptive activity names from “activity_labels.txt”

3.2 facorizing Variale activity in the data frame Data1 using the descriptive activity names

**4. Appropriately label the data set with descriptive variable names**
4.1 using "gsub()" for pattern matching and replacement of parrtial words with full words for better understanding of variables meaning
```
For column name that starts with the letter "t", I've replaced the letter "t" with the string "time_" 
For column name that starts with the letter "f", I've replaced the letter "f" with the string  "frequency_"
I've replace the string "Acc" with "Accelerometer_"
I've replace the string "Gyro" with "Gyroscope_"
I've replace the string "Mag" with "Magnitude_"
I've replace the string "Body" with "Body_"
```
**5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject**

5.1 I used aggregate() from the plyr library to aggregate the data by the mean per subject and activity

5.2 I've created a new tidydata.txt file using the write.table() function

