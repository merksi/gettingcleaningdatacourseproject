#
# function for project for course getting and cleaning data
# Author. Ivo Merks, Data: 2014-12-20 
#

# 0. read all data
# the assumption is that the UCI HAR Dataset is in the working directory 
# and that the UCI HAR Dataset has the same directory strucure as the zip-file
homeDir<-"./UCI HAR Dataset/"
trainDir<-paste(homeDir,"train/",sep="")
testDir<-paste(homeDir,"test/",sep="")
trainInertialDir<-paste(trainDir,"Inertial Signals/",sep="")
testInertialDir<-paste(testDir,"Inertial Signals/",sep="")
# 0.a read feature names from file 
featureNames<-read.table(paste(homeDir,"features.txt",sep=""),header=FALSE)
# 0.b convert to character array 
featureNamesChar<-as.character(featureNames[,"V2"])
activityNo<-"activityNo"
activityName<-"activityName"
# 0.c read the activity labels from file 
activity_labels<-read.table(paste(homeDir,"activity_labels.txt",sep=""),header=FALSE,col.names=c(activityNo,activityName))
subjectNoChar<-"subjectNo"
activityChar<-"activity"
# 0.d read subject data from file  corresponding to training data
subjectNotrain<-read.table(paste(trainDir,"subject_train.txt",sep=""),header=FALSE,col.names=subjectNoChar)
# 0.e read training data from file  and set feature names as column names
Xtrain<-read.table(paste(trainDir,"X_train.txt",sep=""),header=FALSE, col.names=featureNamesChar)
# 0.f read activity data from file corresponding to training data and set column name to "activity"
activityTrain<-read.table(paste(trainDir,"y_train.txt",sep=""),header=FALSE,col.names=activityChar)
# 0.g read raw  data for training from file: x-axis, y-axis, z-axis of  body acceleration signal 
body_acc_x_train<-read.table(paste(trainInertialDir,"body_acc_x_train.txt",sep=""),header=FALSE)
body_acc_y_train<-read.table(paste(trainInertialDir,"body_acc_y_train.txt",sep=""),header=FALSE)
body_acc_z_train<-read.table(paste(trainInertialDir,"body_acc_z_train.txt",sep=""),header=FALSE)
# 0.h read raw  data for training from file: x-axis, y-axis, z-axis of angular velocity vector measured by the gyroscope 
gyro_acc_x_train<-read.table(paste(trainInertialDir,"body_gyro_x_train.txt",sep=""),header=FALSE)
gyro_acc_y_train<-read.table(paste(trainInertialDir,"body_gyro_y_train.txt",sep=""),header=FALSE)
gyro_acc_z_train<-read.table(paste(trainInertialDir,"body_gyro_z_train.txt",sep=""),header=FALSE)
# 0.i read raw  data for training from file: x-axis, y-axis, z-axis of  acceleration signal from the smartphone accelerometer 
total_acc_x_train<-read.table(paste(trainInertialDir,"total_acc_x_train.txt",sep=""),header=FALSE)
total_acc_y_train<-read.table(paste(trainInertialDir,"total_acc_y_train.txt",sep=""),header=FALSE)
total_acc_z_train<-read.table(paste(trainInertialDir,"total_acc_z_train.txt",sep=""),header=FALSE)
# 0.j read subject data corresponding to test data from file 
subjectNotest<-read.table(paste(testDir,"subject_test.txt",sep=""),header=FALSE,col.names=subjectNoChar)
# 0.k read test data from file  and set feature names as column names
Xtest<-read.table(paste(testDir,"X_test.txt",sep=""),header=FALSE, col.names=featureNamesChar)
# 0.l read activity data corresponding to test data from file and set column name to "activity"
activityTest<-read.table(paste(testDir,"y_test.txt",sep=""),header=FALSE,col.names=activityChar)
# 0.m read raw  data for test from file : x-axis, y-axis, z-axis of  body acceleration signal 
body_acc_x_test<-read.table(paste(testInertialDir,"body_acc_x_test.txt",sep=""),header=FALSE)
body_acc_y_test<-read.table(paste(testInertialDir,"body_acc_y_test.txt",sep=""),header=FALSE)
body_acc_z_test<-read.table(paste(testInertialDir,"body_acc_z_test.txt",sep=""),header=FALSE)
# 0.n read raw  data for test from file : x-axis, y-axis, z-axis of angular velocity vector measured by the gyroscope 
gyro_acc_x_test<-read.table(paste(testInertialDir,"body_gyro_x_test.txt",sep=""),header=FALSE)
gyro_acc_y_test<-read.table(paste(testInertialDir,"body_gyro_y_test.txt",sep=""),header=FALSE)
gyro_acc_z_test<-read.table(paste(testInertialDir,"body_gyro_z_test.txt",sep=""),header=FALSE)
# 0.o read raw  data for test from file : x-axis, y-axis, z-axis of  acceleration signal from the smartphone accelerometer 
total_acc_x_test<-read.table(paste(testInertialDir,"total_acc_x_test.txt",sep=""),header=FALSE)
total_acc_y_test<-read.table(paste(testInertialDir,"total_acc_y_test.txt",sep=""),header=FALSE)
total_acc_z_test<-read.table(paste(testInertialDir,"total_acc_z_test.txt",sep=""),header=FALSE)
# 1. Merges the training and the test sets to create one data set.
# 1.a combine all training data into one training set
trainData<-data.frame(subjectNotrain, activityTrain, Xtrain,body_acc_x_train,body_acc_y_train,body_acc_z_train,gyro_acc_x_train,gyro_acc_y_train,gyro_acc_z_train,total_acc_x_train,total_acc_y_train,total_acc_z_train)
# 1.b. combine all test data into one test set
testData<-data.frame(subjectNotest, activityTest,Xtest,body_acc_x_test,body_acc_y_test,body_acc_z_test,gyro_acc_x_test,gyro_acc_y_test,gyro_acc_z_test,total_acc_x_test,total_acc_y_test,total_acc_z_test)
# 1.c combine training set and test set
totalData<-rbind(trainData,testData)
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 2.a get column names (e.g. the feature names)
columnNames <- names(totalData)
# 2.b. find columns with mean std, activity, and subject name 
posColumn<- grepl("mean",columnNames) | grepl("std",columnNames) | grepl(activityChar,columnNames) | grepl(subjectNoChar,columnNames)
# 2.c select those columns. 
meanStdData<-totalData[,posColumn]
# 3. Uses descriptive activity names to name the activities in the data set
# 3.a. copy data to new variable meanStdActivityNameData
meanStdActivityNameData<-meanStdData
# 3.b. replace numbers (of activity) with labels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
meanStdActivityNameData[,activityChar]<-activity_labels[meanStdData[,activityChar],activityName]
# 4. Appropriately labels the data set with descriptive variable names. 
# 4.a No additional steps need to be taken because this was done during reading the files (0.e and 0.k)
#
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# 5.a. install plyr package
if("plyr" %in% rownames(installed.packages()) == FALSE) {install.packages("plyr")}
# 5.b. load plyr package
library(plyr)
# 5.c. run the mean function column wise for each variable for each activity and each subject
tidyDataSet2<-ddply(meanStdActivityNameData, c(subjectNoChar,activityChar), colwise(mean))
# 6. Please upload your data set as a txt file created with write.table() using row.name=FALSE
write.table(tidyDataSet2, file = "tidyDataSet2IM.txt", row.names=FALSE);
