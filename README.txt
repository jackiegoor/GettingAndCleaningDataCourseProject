 Goal: Create tidy data from "Human Activity Recognition Using Smartphones" for use in data analysis:

 This program performs the following steps (not necessarily in this order):
	1. Merges the "Human Activity Recognition Using Smartphones" training and test data.
	2. Extracts only the mean and standard deviation measurements from the data.
	3. Provides descriptive names for all variables in the data set.
	4. Generates an independent data set containing the average (MEAN) of each variable for each activity 
         and each subject.
 

 Raw Data Files: [INPUT]
	x_train.txt: Contains the values for each of the 561 features identified in features.txt for each observation for the training subjects.
	y_train.txt: Contains the activity id for each observation for the training subjects.
	x_test.txt: Contains the values for each of the 561 features identified in features.txt for each observation for the test subjects.
	y_test.txt: Contains the activity id for each observation for the test subjects.
	
	subject_train.txt: Contains the identifier for the training subject for each observation in x_train.txt.
	subject_test.txt: Contains the identifier for the test subject for each observation in x_test.txt.
	
	activity_labels.txt: Labels for each of the 6 activities.
	features.txt: Labels for each of the 561 features.
	
Tidy Data Set: [OUTPUT]
      tidySummarizedData.txt
                subjectId
                activityName
                MEANtBodyAcc-mean()-X
                MEANtBodyAcc-mean()-Y
                MEANtBodyAcc-mean()-Z
                MEANtBodyAcc-std()-X
                MEANtBodyAcc-std()-Y
                MEANtBodyAcc-std()-Z
                MEANtGravityAcc-mean()-X
                MEANtGravityAcc-mean()-Y
                MEANtGravityAcc-mean()-Z
                MEANtGravityAcc-std()-X
                MEANtGravityAcc-std()-Y
                MEANtGravityAcc-std()-Z
                MEANtBodyAccJerk-mean()-X
                MEANtBodyAccJerk-mean()-Y
                MEANtBodyAccJerk-mean()-Z
                MEANtBodyAccJerk-std()-X
                MEANtBodyAccJerk-std()-Y
                MEANtBodyAccJerk-std()-Z
                MEANtBodyGyro-mean()-X
                MEANtBodyGyro-mean()-Y
                MEANtBodyGyro-mean()-Z
                MEANtBodyGyro-std()-X
                MEANtBodyGyro-std()-Y
                MEANtBodyGyro-std()-Z
                MEANtBodyGyroJerk-mean()-X
                MEANtBodyGyroJerk-mean()-Y
                MEANtBodyGyroJerk-mean()-Z
                MEANtBodyGyroJerk-std()-X
                MEANtBodyGyroJerk-std()-Y
                MEANtBodyGyroJerk-std()-Z
                MEANtBodyAccMag-mean()
                MEANtBodyAccMag-std()
                MEANtGravityAccMag-mean()
                MEANtGravityAccMag-std()
                MEANtBodyAccJerkMag-mean()
                MEANtBodyAccJerkMag-std()
                MEANtBodyGyroMag-mean()
                MEANtBodyGyroMag-std()
                MEANtBodyGyroJerkMag-mean()
                MEANtBodyGyroJerkMag-std()
                MEANfBodyAcc-mean()-X
                MEANfBodyAcc-mean()-Y
                MEANfBodyAcc-mean()-Z
                MEANfBodyAcc-std()-X
                MEANfBodyAcc-std()-Y
                MEANfBodyAcc-std()-Z
                MEANfBodyAccJerk-mean()-X
                MEANfBodyAccJerk-mean()-Y
                MEANfBodyAccJerk-mean()-Z
                MEANfBodyAccJerk-std()-X
                MEANfBodyAccJerk-std()-Y
                MEANfBodyAccJerk-std()-Z
                MEANfBodyGyro-mean()-X
                MEANfBodyGyro-mean()-Y
                MEANfBodyGyro-mean()-Z
                MEANfBodyGyro-std()-X
                MEANfBodyGyro-std()-Y
                MEANfBodyGyro-std()-Z
                MEANfBodyAccMag-mean()
                MEANfBodyAccMag-std()
                MEANfBodyBodyAccJerkMag-mean()
                MEANfBodyBodyAccJerkMag-std()
                MEANfBodyBodyGyroMag-mean()
                MEANfBodyBodyGyroMag-std()
                MEANfBodyBodyGyroJerkMag-mean()
                MEANfBodyBodyGyroJerkMag-std()

              
