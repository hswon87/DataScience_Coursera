---
title: "CodeBook"
output: html_document
---


This is a code book that describes the variables and any transformations or work that you performed to clean up the data.


## Variables

The data is from the experiments that have been carried out with a group of 30 volunteers. 

The variables in this data is from the accelerometer and gyroscope 3-axial (XYZ) raw signals. The variables tAcc-XYZ and tGyro-XYZ are the time domain signals from the accelerometer and gyroscope, respectively. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ). Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also, "Mag" (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag) stands for the magnitude of these three-dimensional signals were calculated using the Euclidean norm. Finally, "f" indicates frequency domain signals shown as follows: fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.


- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag


The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.



The labels consist of the following six activities that 30 volunteers performed wearing a smartphone

- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING


## run_analysis.R

The R script, run_analysis.R, is created to do as follows:

1. Download the data linked from the course website in the working directory
2. Load the activity labels which has descriptive activity names
3. Load the subject, activity and labels (columns) from both training and test dataset, and merges those columns and dataset 
4. Extracts variables that have mean and standard deviation values for each measurement.
5. Label the variable names in merged dataset with the descriptive activity names
6. Create a tidy data that consists of mean values of each subject and each activity. The result is written as the file "tidy_data.txt".

