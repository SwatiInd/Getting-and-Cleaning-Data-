---
output:
  html_document: default
  pdf_document: default
---

# Data collection #

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. The complete list of variables of each feature vector is available in 'features.txt'. These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. 

tBodyAcc-XYZ \
tGravityAcc-XYZ \
tBodyAccJerk-XYZ \
tBodyGyro-XYZ \
tBodyGyroJerk-XYZ \
tBodyAccMag \
tGravityAccMag \
tBodyAccJerkMag \
tBodyGyroMag \
tBodyGyroJerkMag \
fBodyAcc-XYZ \
fBodyAccJerk-XYZ \
fBodyGyro-XYZ \
fBodyAccMag \
fBodyAccJerkMag \
fBodyGyroMag \
fBodyGyroJerkMag \

The set of variables that were estimated from these signals 

mean(): Mean value \
std(): Standard deviation \
mad(): Median absolute deviation \
max(): Largest value in array \
min(): Smallest value in array \
sma(): Signal magnitude area \
energy(): Energy measure. Sum of the squares divided by the number of values. \ 
iqr(): Interquartile range \
entropy(): Signal entropy \
arCoeff(): Autorregresion coefficients with Burg order equal to 4 \
correlation(): correlation coefficient between two signals \
maxInds(): index of the frequency component with largest magnitude \
meanFreq(): Weighted average of the frequency components to obtain a mean frequency \
skewness(): skewness of the frequency domain signal \
kurtosis(): kurtosis of the frequency domain signal \
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window. \
angle(): Angle between to vectors. \

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean \
tBodyAccMean \
tBodyAccJerkMean \
tBodyGyroMean \
tBodyGyroJerkMean \

This data is avaiable for train and test subjects are available in "train/X_train.txt" and "test/X_test.txt", respectively. In the code, they were stored as "train_set" and "test_set" variables. 


# Train/test subjects id and activity #
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 70% of them were randomly distributed in training while the rest 30% are as test subject. Training and testing subjects ids are described in 'train/subject_train.txt' and 'test/subject_test.txt', respectively. In the code, this data is stored as "train_id" and "test_id". 

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. These activities are numbered 1 to 6 in the "train/y_train.txt" and "test/y_test.txt" for training and testing subjects. From these files, these data were extracted in "train_label" and "test_label" variables. 

# Train/test datasets #
The "test" data frame is created by combining columnwise "test_id", "test_lablel", and "test_set" dataframes. Column one corresponds to id, two to activitly and rest of the columns correspond to all the variables mentioned in "features.txt". 
The similar step was followed to prepare "train" data frame. 

# Merging train and test data #

"test" and "train" data frames were merged rowwise to have data of all subjects in one data frame "one_data".

# Selection of variables #

In one_data, activity is labeled with descriptive names as follow: \
1 WALK \
2 WALK_UP \
3 WALK_DOWN \
4 SIT \
5 STAND \
6 LAY \

First variables having information of mean and std of measured data were extracted from the above mentioned "one_data". While selecting these variables by using  contains(mean,std) function. In the next step, variables having meanFreq were excluded from data set. Further, variables names were reorganized to have more clear understanding of each variable. This data is stored in "selected_data" with "id" and "activity" information in columns (1) and (2). 

The column numbers of variables are illustrated in parenthese. For variables who have X, Y, and Z components have three separate columns while for others it is only one column. 

t-Body-Acc-mean-XYZ 		(3, 4, 5) \
t-Gravity-Acc-mean-XYZ 		(6, 7, 8) \
t-Body-Acc-Jerk-mean-XYZ 	(9, 10, 11) \
t-Body-Gyro-mean-XYZ		(12, 13, 14) \
t-Body-Gyro-Jerk-mean-XYZ	(15, 16, 17) \
t-Body-Acc-Mag-mean		(18) \
t-Gravity-Acc-Mag-mean		(19) \
t-Body-Acc-Jerk-Mag-mean	(20) \
t-Body-Gyro-Mag-mean		(21) \
t-Body-Gyro-Jerk-Mag-mean	(22) \
			
f-Body-Acc-mean-XYZ		(23, 24, 25) \
f-Body-Acc-Jerk-mean-XYZ	(26, 27, 28) \
f-Body-Gyro-mean-XYZ		(29, 30, 31) \
f-Body-Acc-Mag-mean		(32) \
f-Body-Body-Acc-Jerk-Mag-mean 	(33) \
f-Body-Body-Gyro-Mag-mean 	(34) \
f-Body-Body-Gyro-Jerk-Mag-mean 	(35) \


t-Body-Acc-std-XYZ		(36, 37, 38) \
t-Gravity-Acc-std-XYZ		(39, 40, 41) \
t-Body-Acc-Jerk-std-XYZ		(42, 43, 44) \
t-Body-Gyro-std-XYZ		(45, 46, 47) \
t-Body-Gyro-Jerk-std-XYZ	(48, 49, 50) \
t-Body-Acc-Mag-std		(51) \
t-Gravity-Acc-Mag-std		(52) \
t-Body-Acc-Jerk-Mag-std		(53) \
t-Body-Gyro-Mag-std		(54) \
t-Body-Gyro-Jerk-Mag-std	(55) \

f-Body-Acc-std-XYZ		(56, 57, 58) \
f-Body-Acc-Jerk-std-XYZ		(59, 60, 61) \
f-Body-Gyro-std-XYZ		(62, 63, 64) \
f-Body-Acc-Mag-std		(65) \
f-Body-Body-Acc-Jerk-Mag-std	(66) \
f-Body-Body-Gyro-Mag-std	(67) \
f-Body-Body-Gyro-Jerk-Mag-std	(68) \

# Mean of variables #

In this dataset, the mean of the above mentioned variables of each subject and each activity are calculated. The data is stored in "Activity_mean.txt" file and variable names in "Activity_mean_variable.txt" file.