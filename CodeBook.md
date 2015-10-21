---
title: "avgdata CodeBook"
author: "Giovanni Picardi"
date: "21 ottobre 2015"
output: pdf_document
---

# Original data

The dataset avgdata.txt comes from a post-processing of the _UCI HAR Dataset_, available at  
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>  
or at  
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>  
ad described below.

------------------------------------------------------------------
Human Activity Recognition Using Smartphones Dataset  
Version 1.0  
------------------------------------------------------------------
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws  
------------------------------------------------------------------

The original dataset comes from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Its embedded accelerometer and gyroscope sensors were used to capture 3-axial linear acceleration and 3-axial angular velocity.

The sensor 3-axial time signals signals tAcc-X/Y/Z and tGyro-X/Y/Z were captured at a constant rate of 50 Hz, filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

The sensor acceleration signal was separated into body and gravity acceleration signals (tBodyAcc-X/Y/Z and tGravityAcc-X/Y/Z) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-X/Y/Z and tBodyGyroJerk-X/Y/Z). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Time signals were sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).

A Fast Fourier Transform (FFT) was applied to some of the time signals producing fBodyAcc-X/Y/Z, fBodyAccJerk-X/Y/Z, fBodyGyro-X/Y/Z, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.

For each window 33 signals were available:

* tBodyAcc-X
* tBodyAcc-Y
* tBodyAcc-Z
* tGravityAcc-X
* tGravityAcc-Y
* tGravityAcc-Z
* tBodyAccJerk-X
* tBodyAccJerk-Y
* tBodyAccJerk-Z
* tBodyGyro-X
* tBodyGyro-Y
* tBodyGyro-Z
* tBodyGyroJerk-X
* tBodyGyroJerk-Y
* tBodyGyroJerk-Z
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-X
* fBodyAcc-Y
* fBodyAcc-Z
* fBodyAccJerk-X
* fBodyAccJerk-Y
* fBodyAccJerk-Z
* fBodyGyro-X
* fBodyGyro-Y
* fBodyGyro-Z
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

and from each of these signals the following features were calculated:

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between two vectors (uses other computed vectors: gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean)

resulting in a 561-feature vector, with time and frequency domain variables, for each window.

Features are normalized and bounded within [-1,1].

The original dataset was partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data and the features are contained in the original files *UCI HAR Dataset/test/X_test.txt* and *UCI HAR Dataset/train/X_train.txt*, one row per window (or observation or record).

In addition the original files *UCI HAR Dataset/test/y_test.txt* and *UCI HAR Dataset/train/y_train.txt* contain the activity ID associated to each window/observation/record (easily mapped to activity labels based on the content of the original file *UCI HAR Dataset/activity_labels.txt*) and the files *UCI HAR Dataset/test/subject_test.txt* and *UCI HAR Dataset/train/subject_train.txt* contain the ID (1 to 30) of the subject involved in the acquisition of the window/observation/record.

# avgdata.txt data

This dataset contains a summarized subset of the original data.

The original training and test sets were merged together in a single dataset.

Only the 79 features calculated as mean() or std() of time and frequency signals were extracted from the original 561 features per window/observation/record.

The resulting data has been summarized calculating the average (mean) of each feature for each activity and subject, i.e. for each couple [activity, subject].

Since the features were normalized in [-1, 1], their averages are still, and more strictly in [-1, 1].

The file avgdata.txt contains a header with the variable names: *Activity*, *Subject*, and the names of the original 79 features prepended with *Average_*.

Activities are labels (*WALKING*, *WALKING_UPSTAIRS*, *WALKING_DOWNSTAIRS*, *SITTING*, *STANDING*, *LAYING*) and Subjects are IDs (1 to 30), both as strings.