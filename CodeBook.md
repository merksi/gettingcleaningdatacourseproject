
This file is the Codebook for the project for course getting and cleaning data. 
Author. Ivo Merks, Data: 2014-12-20 

A. Study Design 

The following steps have been taken in the process of getting and cleaning the data
0. read all data
   the assumption is that the UCI HAR Dataset is in the working directory 
   and that the UCI HAR Dataset has the same directory strucure as the zip-file
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
0.a read feature names from file 
0.b convert to character array 
0.c read the activity labels from file 
0.d read subject data from file  corresponding to training data
0.e read training data from file  and set feature names as column names
0.f read activity data from file corresponding to training data and set column name to "activity"
0.g read raw  data for training from file: x-axis, y-axis, z-axis of  body acceleration signal 
0.h read raw  data for training from file: x-axis, y-axis, z-axis of angular velocity vector measured by the gyroscope 
0.i read raw  data for training from file: x-axis, y-axis, z-axis of  acceleration signal from the smartphone accelerometer 
0.j read subject data corresponding to test data from file 
0.k read test data from file  and set feature names as column names
0.l read activity data corresponding to test data from file and set column name to "activity"
0.m read raw  data for test from file : x-axis, y-axis, z-axis of  body acceleration signal 
0.n read raw  data for test from file : x-axis, y-axis, z-axis of angular velocity vector measured by the gyroscope 
0.o read raw  data for test from file : x-axis, y-axis, z-axis of  acceleration signal from the smartphone accelerometer 

1. Merges the training and the test sets to create one data set.
1.a combine all training data into one training set
1.b. combine all test data into one test set
1.c combine training set and test set

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
2.a get column names (e.g. the feature names)
2.b. find columns with mean std, activity, and subject name 
2.c select those columns. 

3. Uses descriptive activity names to name the activities in the data set
3.a. copy data to new variable meanStdActivityNameData
3.b. replace numbers (of activity) with labels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

4. Appropriately labels the data set with descriptive variable names. 
4.a No additional steps need to be taken because this was done during reading the files (0.e and 0.k)

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
5.a. install plyr package
5.b. load plyr package
5.c. run the mean function column wise for each variable for each activity and each subject

6. Please upload your data set as a txt file created with write.table() using row.name=FALSE

B. Code book 

The processed data has the following variable list. 
The precise description of the variables (except the first 2_ can be found in the features_info.txt
file in the UCI HAR data set 
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ). 

subjectNo - number of the subject
activity  - activity that subject were doing during the test
tBodyAcc.mean...X
tBodyAcc.mean...Y
tBodyAcc.mean...Z
tBodyAcc.std...X
tBodyAcc.std...Y
tBodyAcc.std...Z
tGravityAcc.mean...X
tGravityAcc.mean...Y
tGravityAcc.mean...Z
tGravityAcc.std...X
tGravityAcc.std...Y
tGravityAcc.std...Z
tBodyAccJerk.mean...X
tBodyAccJerk.mean...Y
tBodyAccJerk.mean...Z
tBodyAccJerk.std...X
tBodyAccJerk.std...Y
tBodyAccJerk.std...Z
tBodyGyro.mean...X
tBodyGyro.mean...Y
tBodyGyro.mean...Z
tBodyGyro.std...X
tBodyGyro.std...Y
tBodyGyro.std...Z
tBodyGyroJerk.mean...X
tBodyGyroJerk.mean...Y
tBodyGyroJerk.mean...Z
tBodyGyroJerk.std...X
tBodyGyroJerk.std...Y
tBodyGyroJerk.std...Z
tBodyAccMag.mean..
tBodyAccMag.std..
tGravityAccMag.mean..
tGravityAccMag.std..
tBodyAccJerkMag.mean..
tBodyAccJerkMag.std..
tBodyGyroMag.mean..
tBodyGyroMag.std..
tBodyGyroJerkMag.mean..
tBodyGyroJerkMag.std..
fBodyAcc.mean...X
fBodyAcc.mean...Y
fBodyAcc.mean...Z
fBodyAcc.std...X
fBodyAcc.std...Y
fBodyAcc.std...Z
fBodyAcc.meanFreq...X
fBodyAcc.meanFreq...Y
fBodyAcc.meanFreq...Z
fBodyAccJerk.mean...X
fBodyAccJerk.mean...Y
fBodyAccJerk.mean...Z
fBodyAccJerk.std...X
fBodyAccJerk.std...Y
fBodyAccJerk.std...Z
fBodyAccJerk.meanFreq...X
fBodyAccJerk.meanFreq...Y
fBodyAccJerk.meanFreq...Z
fBodyGyro.mean...X
fBodyGyro.mean...Y
fBodyGyro.mean...Z
fBodyGyro.std...X
fBodyGyro.std...Y
fBodyGyro.std...Z
fBodyGyro.meanFreq...X
fBodyGyro.meanFreq...Y
fBodyGyro.meanFreq...Z
fBodyAccMag.mean..
fBodyAccMag.std..
fBodyAccMag.meanFreq..
fBodyBodyAccJerkMag.mean..
fBodyBodyAccJerkMag.std..
fBodyBodyAccJerkMag.meanFreq..
fBodyBodyGyroMag.mean..
fBodyBodyGyroMag.std..
fBodyBodyGyroMag.meanFreq..
fBodyBodyGyroJerkMag.mean..
fBodyBodyGyroJerkMag.std..
fBodyBodyGyroJerkMag.meanFreq..


