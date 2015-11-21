#  Goal: Create tidy data from "Human Activity Recognition Using Smartphones" for use in data analysis:
#
#  This program performs the following steps (not necessarily in this order):
# 	1. Merges the "Human Activity Recognition Using Smartphones" training and test data.
# 	2. Extracts only the mean and standard deviation measurements from the data.
# 	3. Provides descriptive names for all variables in the data set.
# 	4. Generates an independent data set containing the average (MEAN) of each variable for each activity 
#          and each subject.
#  
#
#  Raw Data Files: [INPUT]
# 	x_train.txt: Contains the values for each of the 561 features identified in features.txt for each observation for the training subjects.
# 	y_train.txt: Contains the activity id for each observation for the training subjects.
# 	x_test.txt: Contains the values for each of the 561 features identified in features.txt for each observation for the test subjects.
# 	y_test.txt: Contains the activity id for each observation for the test subjects.
# 	
# 	subject_train.txt: Contains the identifier for the training subject for each observation in x_train.txt.
# 	subject_test.txt: Contains the identifier for the test subject for each observation in x_test.txt.
# 	
# 	activity_labels.txt: Labels for each of the 6 activities.
# 	features.txt: Labels for each of the 561 features.
# 	
# Tidy Data Set: [OUTPUT]
#       tidySummarizedData.txt
#                 subjectId: Unique identifier for the test or training subject.
#                 activityName: Name of the activity being performed.
#                 MEANtBodyAcc-mean()-X: 
#                 MEANtBodyAcc-mean()-Y
#                 MEANtBodyAcc-mean()-Z
#                 MEANtBodyAcc-std()-X
#                 MEANtBodyAcc-std()-Y
#                 MEANtBodyAcc-std()-Z
#                 MEANtGravityAcc-mean()-X
#                 MEANtGravityAcc-mean()-Y
#                 MEANtGravityAcc-mean()-Z
#                 MEANtGravityAcc-std()-X
#                 MEANtGravityAcc-std()-Y
#                 MEANtGravityAcc-std()-Z
#                 MEANtBodyAccJerk-mean()-X
#                 MEANtBodyAccJerk-mean()-Y
#                 MEANtBodyAccJerk-mean()-Z
#                 MEANtBodyAccJerk-std()-X
#                 MEANtBodyAccJerk-std()-Y
#                 MEANtBodyAccJerk-std()-Z
#                 MEANtBodyGyro-mean()-X
#                 MEANtBodyGyro-mean()-Y
#                 MEANtBodyGyro-mean()-Z
#                 MEANtBodyGyro-std()-X
#                 MEANtBodyGyro-std()-Y
#                 MEANtBodyGyro-std()-Z
#                 MEANtBodyGyroJerk-mean()-X
#                 MEANtBodyGyroJerk-mean()-Y
#                 MEANtBodyGyroJerk-mean()-Z
#                 MEANtBodyGyroJerk-std()-X
#                 MEANtBodyGyroJerk-std()-Y
#                 MEANtBodyGyroJerk-std()-Z
#                 MEANtBodyAccMag-mean()
#                 MEANtBodyAccMag-std()
#                 MEANtGravityAccMag-mean()
#                 MEANtGravityAccMag-std()
#                 MEANtBodyAccJerkMag-mean()
#                 MEANtBodyAccJerkMag-std()
#                 MEANtBodyGyroMag-mean()
#                 MEANtBodyGyroMag-std()
#                 MEANtBodyGyroJerkMag-mean()
#                 MEANtBodyGyroJerkMag-std()
#                 MEANfBodyAcc-mean()-X
#                 MEANfBodyAcc-mean()-Y
#                 MEANfBodyAcc-mean()-Z
#                 MEANfBodyAcc-std()-X
#                 MEANfBodyAcc-std()-Y
#                 MEANfBodyAcc-std()-Z
#                 MEANfBodyAccJerk-mean()-X
#                 MEANfBodyAccJerk-mean()-Y
#                 MEANfBodyAccJerk-mean()-Z
#                 MEANfBodyAccJerk-std()-X
#                 MEANfBodyAccJerk-std()-Y
#                 MEANfBodyAccJerk-std()-Z
#                 MEANfBodyGyro-mean()-X
#                 MEANfBodyGyro-mean()-Y
#                 MEANfBodyGyro-mean()-Z
#                 MEANfBodyGyro-std()-X
#                 MEANfBodyGyro-std()-Y
#                 MEANfBodyGyro-std()-Z
#                 MEANfBodyAccMag-mean()
#                 MEANfBodyAccMag-std()
#                 MEANfBodyBodyAccJerkMag-mean()
#                 MEANfBodyBodyAccJerkMag-std()
#                 MEANfBodyBodyGyroMag-mean()
#                 MEANfBodyBodyGyroMag-std()
#                 MEANfBodyBodyGyroJerkMag-mean()
#                 MEANfBodyBodyGyroJerkMag-std()
# 
#               
###########################################################################################################

# Set working directory to parent folder for 2 data sets.
setwd("D:\\Diversions\\CourseraCourses\\DataScientist\\Course3_GettingAndCleaningData\\UCI HAR Dataset\\")

# Load the dplyr library so we can simplify things later.
library(dplyr)

#### Feature Names and Activity Labels are common to both test and training data.
#### Load them now.

# Read in the labels for the 561 variables in x_train.txt and x_test.txt.
featureNames <- read.table("features.txt", col.names = c("featureId", "featureName"))
# Make the labels conform to R variable names.
prettyFeatureNames <- make.names(featureNames$featureName, unique = TRUE)
# Read in the labels for the 6 activities.
activityLabels <- read.table("activity_labels.txt", col.names = c("activityId", "activityName"))

######## TEST DATA
#### READ in test data, test subjects, and test activities. 
# Each row in testData corresponds to a row in testSubjects.
# Each row in testData corresponds to a row in testActivities
testData <- read.table(".\\test\\x_test.txt")

# Assign the "pretty" column names to the test data.
colnames(testData) <- prettyFeatureNames

testSubjects <- read.table(".\\test\\subject_test.txt", col.names=c("subjectId"))
testActivities <- read.table(".\\test\\y_test.txt", col.names=c("activityId"))
# Assign the activity labels to the testActivities.
# Since I have renamed the columns containing the activity # to activityId in both tables
# and I know that there is a match for all testActivities, I can use inner_join from dplyr package.
testActivitiesLabeled <- inner_join(testActivities, activityLabels)

# COMBINE the test data with the subjects and activities.
# Since they have the same number of rows, use cbind().
testDataLabeled <- cbind(testSubjects, testActivitiesLabeled, testData)

######## TRAINING DATA
#### READ in training data, training subjects and training activities.
# Each row in train corresponds to a row in trainSubjects.
# Each row in train corresponds to a row in trainActivities
trainingData <- read.table(".\\train\\x_train.txt")
# Assign the "pretty" column names to the training data.
colnames(trainingData) <- prettyVarNames

trainingSubjects <- read.table(".\\train\\subject_train.txt", col.names=c("subjectId"))
trainingActivities <- read.table(".\\train\\y_train.txt", col.names=c("activityId"))
# Assign the activity labels to the trainingActivities
# Since I have renamed the columns containing the activity # to activityId in both tables
# and I know that there is a match for all trainingActivities, I can use inner_join from dplyr package.
trainingActivitiesLabeled <- inner_join(trainingActivities, activityLabels)

# COMBINE the training data with the subjects and activities.
# Since they have the same number of rows, use cbind().
trainingDataLabeled <- cbind(trainingSubjects, trainingActivitiesLabeled, trainingData)

######## MERGE TEST AND TRAINING DATA
# COMBINE test and training data using rbind since they have the same number of columns.
# This should provide us with a data set with (# test rows + # training rows) X # of columns
combinedData <- rbind(testDataLabeled,trainingDataLabeled)

# Confirm combined data set contains (# test rows + # training rows) X # of columns
# dim(combinedData)
# head(combinedData)

######## EXTRACT only mean and std values.
# When we "prettied" the feature names, the "()" were replaced with "..".
combined_MeanStdOnly <- select(combinedData, matches("subjectId"), matches("activityName"), contains("mean.."), contains("std.."))

######## CREATE independent data set that contains the AVERAGE for each ACTIVITY and each SUBJECT.
# GROUP the combined_MeanStdOnly data set by subjectId and activityName
#       THEN SUMMARIZE each variable using MEAN.
tidySummarizedData <- combined_MeanStdOnly %>% group_by(subjectId, activityName) %>% summarize_each (funs(mean))

# We'll want to rename the columns in the tidySummarizedData (since they're now the MEANs).
# But we don't want to rename the subjectId and activityName columns.
newColNames <- colnames(combined_MeanStdOnly)
# Prepend "MEAN" to all column names.
newColNames <- paste("MEAN",newColNames, sep="")
# Now rename subjectId and activityName names.
newColNames[1]= "subjectId"
newColNames[2] = "activityName"
# Assign newColNames to tidySummarizedData.
colnames(tidySummarizedData) <- newColNames

######## WRITE tidy data, summarized data to a file.
write.table(tidySummarizedData, file="tidySummarizedData.txt", append=FALSE, col.names=TRUE)