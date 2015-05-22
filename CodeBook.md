---
title: CodeBook
output: html_document
---
The contents of this dataset are built upon the [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) dataset collected by J. L. Reyes-Ortiz, et al. 

For each subject/activity pair a number of gyroscope and accelerometer measurements were taken in the original study. This data set composes the discrete means and standard deviation observations into a single mean for each variable and subject/activity pair. 

For example, several rows in the original dataset

```
Subject | Activity |  tBodyAcc_mean_X
-------- ---------- ------------------
1       | WALKING  |  0.12         ...
1       | WALKING  |  0.31         ...
1       | WALKING  |  0.26         ...
```

would yield a single row in the summary table


```
Subject | Activity  |  tBodyAcc_mean_X
-------- ----------- ------------------
1       | WALKING   |  0.23        ...
```


Columns 1 and 2 are used to identify the subject/activity pairing for which the means were computed in the remaining 79 columns. The variable names in the description of columns 3-81 refer to the variables collected in Reyes-Ortiz work and are described in the features_info.txt available with that [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

#### Dataset by Column
```
Column                        | No. | Type     | Description
------------------------------ ----- ---------- --------------------------------------------------------------
Subject                       |   1 | Integer  | ID number of subject
Activity                      |   2 | Category | Description of activity being performed. One of: WALKING,
                              |     |          | WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING
tBodyAcc_mean_X               |   3 | Numeric  | Mean of the tBodyAcc-mean()-X for subject/activity pair
tBodyAcc_mean_Y               |   4 | Numeric  | Mean of the tBodyAcc-mean()-Y for subject/activity pair
tBodyAcc_mean_Z               |   5 | Numeric  | Mean of the tBodyAcc-mean()-Z for subject/activity pair 
tBodyAcc_std_X                |   6 | Numeric  | Mean of the tBodyAcc_std()-X for subject/activity pair
tBodyAcc_std_Y                |   7 | Numeric  | Mean of the tBodyAcc_std()-Y for subject/activity pair
tBodyAcc_std_Z                |   8 | Numeric  | Mean of the tBodyAcc_std()-Z for subject/activity pair
tGravityAcc_mean_X            |   9 | Numeric  | Mean of the tGravityAcc_mean()-X for subject/activity pair
tGravityAcc_mean_Y            |  10 | Numeric  | Mean of the tGravityAcc_mean()-Y for subject/activity pair
tGravityAcc_mean_Z            |  11 | Numeric  | Mean of the tGravityAcc_mean()-Z for subject/activity pair
tGravityAcc_std_X             |  12 | Numeric  | Mean of the tGravityAcc_std()-X for subject/activity pair
tGravityAcc_std_Y             |  13 | Numeric  | Mean of the tGravityAcc_std()-Y for subject/activity pair
tGravityAcc_std_Z             |  14 | Numeric  | Mean of the tGravityAcc_std()-Z for subject/activity pair
tBodyAccJerk_mean_X           |  15 | Numeric  | Mean of the tBodyAccJerk_mean()-X for subject/activity pair
tBodyAccJerk_mean_Y           |  16 | Numeric  | Mean of the tBodyAccJerk_mean()-Y for subject/activity pair
tBodyAccJerk_mean_Z           |  17 | Numeric  | Mean of the tBodyAccJerk_mean()-Z for subject/activity pair
tBodyAccJerk_std_X            |  18 | Numeric  | Mean of the tBodyAccJerk_std()-X for subject/activity pair
tBodyAccJerk_std_Y            |  19 | Numeric  | Mean of the tBodyAccJerk_std()-Y for subject/activity pair
tBodyAccJerk_std_Z            |  20 | Numeric  | Mean of the tBodyAccJerk_std()-Z for subject/activity pair
tBodyGyro_mean_X              |  21 | Numeric  | Mean of the tBodyGyro_mean()-X for subject/activity pair
tBodyGyro_mean_Y              |  22 | Numeric  | Mean of the tBodyGyro_mean()-Y for subject/activity pair
tBodyGyro_mean_Z              |  23 | Numeric  | Mean of the tBodyGyro_mean()-Z for subject/activity pair
tBodyGyro_std_X               |  24 | Numeric  | Mean of the tBodyGyro_std()-X for subject/activity pair
tBodyGyro_std_Y               |  25 | Numeric  | Mean of the tBodyGyro_std()-Y for subject/activity pair
tBodyGyro_std_Z               |  26 | Numeric  | Mean of the tBodyGyro_std()-Z for subject/activity pair
tBodyGyroJerk_mean_X          |  27 | Numeric  | Mean of the tBodyGyroJerk_mean()-X for subject/activity pair
tBodyGyroJerk_mean_Y          |  28 | Numeric  | Mean of the tBodyGyroJerk_mean()-Y for subject/activity pair
tBodyGyroJerk_mean_Z          |  29 | Numeric  | Mean of the tBodyGyroJerk_mean()-Z for subject/activity pair
tBodyGyroJerk_std_X           |  30 | Numeric  | Mean of the tBodyGyroJerk_std()-X for subject/activity pair
tBodyGyroJerk_std_Y           |  31 | Numeric  | Mean of the tBodyGyroJerk_std()-Y for subject/activity pair
tBodyGyroJerk_std_Z           |  32 | Numeric  | Mean of the tBodyGyroJerk_std()-Z for subject/activity pair
tBodyAccMag_mean              |  33 | Numeric  | Mean of the tBodyAccMag_mean() for subject/activity pair
tBodyAccMag_std               |  34 | Numeric  | Mean of the tBodyAccMag_std() for subject/activity pair
tGravityAccMag_mean           |  35 | Numeric  | Mean of the tGravityAccMag_mean() for subject/activity pair
tGravityAccMag_std            |  36 | Numeric  | Mean of the tGravityAccMag_std() for subject/activity pair
tBodyAccJerkMag_mean          |  37 | Numeric  | Mean of the tGravityAccJerkMag_mean() for subject/activity 
                              |     |          | pair
tBodyAccJerkMag_std           |  38 | Numeric  | Mean of the tGravityAccJerkMag_std() for subject/activity pair
tBodyGyroMag_mean             |  39 | Numeric  | Mean of the tBodyGyroMag_mean() for subject/activity pair
tBodyGyroMag_std              |  40 | Numeric  | Mean of the tBodyGyroMag_std() for subject/activity pair
tBodyGyroJerkMag_mean         |  41 | Numeric  | Mean of the tBodyGyroJerkMag_mean() for subject/activity pair
tBodyGyroJerkMag_std          |  42 | Numeric  | Mean of the tBodyGyroJerkMag_mean() for subject/activity pair
fBodyAcc_mean_X               |  43 | Numeric  | Mean of the fBodyAcc_mean()-X for subject/activity pair
fBodyAcc_mean_Y               |  44 | Numeric  | Mean of the fBodyAcc_mean()-Y for subject/activity pair
fBodyAcc_mean_Z               |  45 | Numeric  | Mean of the fBodyAcc_mean()-Z for subject/activity pair
fBodyAcc_std_X                |  46 | Numeric  | Mean of the fBodyAcc_std()-X for subject/activity pair
fBodyAcc_std_Y                |  47 | Numeric  | Mean of the fBodyAcc_std()-Y for subject/activity pair
fBodyAcc_std_Z                |  48 | Numeric  | Mean of the fBodyAcc_std()-Z for subject/activity pair
fBodyAcc_meanFreq_X           |  49 | Numeric  | Mean of the fBodyAcc_meanFreq()-X for subject/activity pair
fBodyAcc_meanFreq_Y           |  50 | Numeric  | Mean of the fBodyAcc_meanFreq()-Y for subject/activity pair
fBodyAcc_meanFreq_Z           |  51 | Numeric  | Mean of the fBodyAcc_meanFreq-Z for subject/activity pair
fBodyAccJerk_mean_X           |  52 | Numeric  | Mean of the fBodyAccJerk_mean()-X for subject/activity pair
fBodyAccJerk_mean_Y           |  53 | Numeric  | Mean of the fBodyAccJerk_mean()-Y for subject/activity pair
fBodyAccJerk_mean_Z           |  54 | Numeric  | Mean of the fBodyAccJerk_mean()-Z for subject/activity pair
fBodyAccJerk_std_X            |  55 | Numeric  | Mean of the fBodyAccJerk_std()-X for subject/activity pair
fBodyAccJerk_std_Y            |  56 | Numeric  | Mean of the fBodyAccJerk_std()-Y for subject/activity pair
fBodyAccJerk_std_Z            |  57 | Numeric  | Mean of the fBodyAccJerk_std()-Z for subject/activity pair
fBodyAccJerk_meanFreq_X       |  58 | Numeric  | Mean of the fBodyAccJerk_meanFreq()-X for subject/activity
                              |     |          | pair
fBodyAccJerk_meanFreq_Y       |  59 | Numeric  | Mean of the fBodyAccJerk_meanFreq()-Y for subject/activity
                              |     |          | pair
fBodyAccJerk_meanFreq_Z       |  60 | Numeric  | Mean of the fBodyAccJerk_meanFreq()-Z for subject/activity
                              |     |          | pair
fBodyGyro_mean_X              |  61 | Numeric  | Mean of the fBodyGyro_mean()-X for subject/activity pair
fBodyGyro_mean_Y              |  62 | Numeric  | Mean of the fBodyGyro_mean()-Y for subject/activity pair
fBodyGyro_mean_Z              |  63 | Numeric  | Mean of the fBodyGyro_mean()-Z for subject/activity pair
fBodyGyro_std_X               |  64 | Numeric  | Mean of the fBodyGyro_std()-X for subject/activity pair
fBodyGyro_std_Y               |  65 | Numeric  | Mean of the fBodyGyro_std()-Y for subject/activity pair
fBodyGyro_std_Z               |  66 | Numeric  | Mean of the fBodyGyro_std()-Z for subject/activity pair
fBodyGyro_meanFreq_X          |  67 | Numeric  | Mean of the fBodyGyro_meanFreq()-X for subject/activity pair
fBodyGyro_meanFreq_Y          |  68 | Numeric  | Mean of the fBodyGyro_meanFreq()-Y for subject/activity pair
fBodyGyro_meanFreq_Z          |  69 | Numeric  | Mean of the fBodyGyro_meanFreq()-Z for subject/activity pair
fBodyAccMag_mean              |  70 | Numeric  | Mean of the fBodyAccMag_mean() for subject/activity pair
fBodyAccMag_std               |  71 | Numeric  | Mean of the fBodyAccMag_std() for subject/activity pair
fBodyAccMag_meanFreq          |  72 | Numeric  | Mean of the fBodyAccMag_meanFreq() for subject/activity pair
fBodyBodyAccJerkMag_mean      |  73 | Numeric  | Mean of the fBodyBodyAccJerkMag_mean() for subject/activity
                              |     |          | pair
fBodyBodyAccJerkMag_std       |  74 | Numeric  | Mean of the fBodyBodyAccJerkMag_std() for subject/activity
                              |     |          | pair
fBodyBodyAccJerkMag_meanFreq  |  75 | Numeric  | Mean of the fBodyBodyAccJerkMag_meanFreq() for 
                              |     |          | subject/activity pair
fBodyBodyGyroMag_mean         |  76 | Numeric  | Mean of the fBodyBodyGyroMag_mean() for subject/activity pair
fBodyBodyGyroMag_std          |  77 | Numeric  | Mean of the fBodyBodyGyroMag_std() for subject/activity pair
fBodyBodyGyroMag_meanFreq     |  78 | Numeric  | Mean of the fBodyBodyGyroMag_meanFreq() for subject/activity
                              |     |          | pair
fBodyBodyGyroJerkMag_mean     |  79 | Numeric  | Mean of the fBodyBodyGyroJerkMag_mean() for subject/activity
                              |     |          | pair
fBodyBodyGyroJerkMag_std      |  80 | Numeric  | Mean of the fBodyBodyGyroJerkMag_std() for subject/activity
                              |     |          | pair
fBodyBodyGyroJerkMag_meanFreq |  81 | Numeric  | Mean of the fBodyBodyGyroJerkMag_mean() for subject/activity
                              |     |          | pair
```
