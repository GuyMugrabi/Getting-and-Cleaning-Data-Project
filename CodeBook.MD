CodeBook for the tidy dataset
=============================
The first two columns:
```
"subject" - the subject ID
"activity" - A friendly name of the activity each subject took
```

Feature Selection 
-----------------
I refer you to the README and features.txt files in the original dataset to learn more about the feature selection for this dataset. 

Feature Selection included in the tidydata.txt file
===================================================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
I've renamed the original signals for readability. 
```
time_Body_Accelerometer_
time_GravityAccelerometer_
time_Body_Accelerometer_Jerk
time_Body_Gyroscope_
time_Body_Gyroscope_Jerk
time_Body_Accelerometer_Magnitude_
time_GravityAccelerometer_Magnitude_
time_Body_Accelerometer_JerkMagnitude_
time_Body_Gyroscope_Magnitude_
time_Body_Gyroscope_JerkMagnitude_
frequency_Body_Accelerometer_
frequency_Body_Accelerometer_Jerk
frequency_Body_Gyroscope_
frequency_Body_Accelerometer_Magnitude_
frequency_Body_Body_Accelerometer_JerkMagnitude_
frequency_Body_Body_Gyroscope_Magnitude_
frequency_Body_Body_Gyroscope_JerkMagnitude_
```
The set of variables that were estimated, and included in the tidydata.txt file, from these signals are: 
``
mean(): Mean value
std(): Standard deviation
``

The complete list of variables (of each Column) vector is:
```
"time_Body_Accelerometer_-mean()-X"
"time_Body_Accelerometer_-mean()-Y"
"time_Body_Accelerometer_-mean()-Z"
"time_Body_Accelerometer_-std()-X"
"time_Body_Accelerometer_-std()-Y"
"time_Body_Accelerometer_-std()-Z"
"time_GravityAccelerometer_-mean()-X"
"time_GravityAccelerometer_-mean()-Y"
"time_GravityAccelerometer_-mean()-Z"
"time_GravityAccelerometer_-std()-X"
"time_GravityAccelerometer_-std()-Y"
"time_GravityAccelerometer_-std()-Z"
"time_Body_Accelerometer_Jerk-mean()-X"
"time_Body_Accelerometer_Jerk-mean()-Y"
"time_Body_Accelerometer_Jerk-mean()-Z"
"time_Body_Accelerometer_Jerk-std()-X"
"time_Body_Accelerometer_Jerk-std()-Y"
"time_Body_Accelerometer_Jerk-std()-Z"
"time_Body_Gyroscope_-mean()-X"
"time_Body_Gyroscope_-mean()-Y"
"time_Body_Gyroscope_-mean()-Z"
"time_Body_Gyroscope_-std()-X"
"time_Body_Gyroscope_-std()-Y"
"time_Body_Gyroscope_-std()-Z"
"time_Body_Gyroscope_Jerk-mean()-X"
"time_Body_Gyroscope_Jerk-mean()-Y"
"time_Body_Gyroscope_Jerk-mean()-Z"
"time_Body_Gyroscope_Jerk-std()-X"
"time_Body_Gyroscope_Jerk-std()-Y"
"time_Body_Gyroscope_Jerk-std()-Z"
"time_Body_Accelerometer_Magnitude_-mean()"
"time_Body_Accelerometer_Magnitude_-std()"
"time_GravityAccelerometer_Magnitude_-mean()"
"time_GravityAccelerometer_Magnitude_-std()"
"time_Body_Accelerometer_JerkMagnitude_-mean()"
"time_Body_Accelerometer_JerkMagnitude_-std()"
"time_Body_Gyroscope_Magnitude_-mean()"
"time_Body_Gyroscope_Magnitude_-std()"
"time_Body_Gyroscope_JerkMagnitude_-mean()"
"time_Body_Gyroscope_JerkMagnitude_-std()"
"frequency_Body_Accelerometer_-mean()-X"
"frequency_Body_Accelerometer_-mean()-Y"
"frequency_Body_Accelerometer_-mean()-Z"
"frequency_Body_Accelerometer_-std()-X"
"frequency_Body_Accelerometer_-std()-Y"
"frequency_Body_Accelerometer_-std()-Z"
"frequency_Body_Accelerometer_Jerk-mean()-X"
"frequency_Body_Accelerometer_Jerk-mean()-Y"
"frequency_Body_Accelerometer_Jerk-mean()-Z"
"frequency_Body_Accelerometer_Jerk-std()-X"
"frequency_Body_Accelerometer_Jerk-std()-Y"
"frequency_Body_Accelerometer_Jerk-std()-Z"
"frequency_Body_Gyroscope_-mean()-X"
"frequency_Body_Gyroscope_-mean()-Y"
"frequency_Body_Gyroscope_-mean()-Z"
"frequency_Body_Gyroscope_-std()-X"
"frequency_Body_Gyroscope_-std()-Y"
"frequency_Body_Gyroscope_-std()-Z"
"frequency_Body_Accelerometer_Magnitude_-mean()"
"frequency_Body_Accelerometer_Magnitude_-std()"
"frequency_Body_Body_Accelerometer_JerkMagnitude_-mean()"
"frequency_Body_Body_Accelerometer_JerkMagnitude_-std()"
"frequency_Body_Body_Gyroscope_Magnitude_-mean()"
"frequency_Body_Body_Gyroscope_Magnitude_-std()"
"frequency_Body_Body_Gyroscope_JerkMagnitude_-mean()"
"frequency_Body_Body_Gyroscope_JerkMagnitude_-std()"
```
