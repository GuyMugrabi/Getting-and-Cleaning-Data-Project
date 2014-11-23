CodeBook for the tidy dataset
=============================

Data source
-----------
This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Feature Selection 
-----------------
I refer you to the README and features.txt files in the original dataset to learn more about the feature selection for this dataset. 

The code that can be fouund in run_analysis.R file in this repository does the following in 5 steps:

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
