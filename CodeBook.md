### Code Book (Getting and Cleaning Data Course Project)

The tidy data created by running the "run_analysis.R" script on the training and test datasets from the Human Activity Recognition database (see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#) is a tab-delimited text file with data organized in 180 rows (+ header) and 68 columns. 

#### Steps performed
   - The training and the test dataset were loaded
   - Variable names were read from "features.txt" and assigned to the columns of both datasets
   - Activity and subject identifiers belonging to each of the two datasets were loaded and added as separate columns to corresponding datasets which were then merged
   - Columns containing mean and standard deviation values were identified and extracted together with the two columns added in the previous step
   - Average value (arithmetic mean) of each retained variable was calculated for each activity and each subject
   - Activity identifiers were substituted with descriptive activity names obtained from "activity_labels.txt"
   - The obtained data were saved as a new "tidy" text file.
   
#### File format
The output file is a tab-delimited text file saved with UTF-8 character encoding and Unix EOL sequence.

#### Data dictionary

The following description is taken from the original database repository:

  * The measurements in this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

   Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

   Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

   '-X', '-Y' and '-Z' are used to denote 3-axial signals in the X, Y and Z directions.
   
   

As part of this project, average values (arithmetic means) were calculated for each group of measurements performed on each subject for each activity.
Consequently, the following variables are stored in the output file:
   
| No | Variable name               | Description                                                             |
|----|:----------------------------|:------------------------------------------------------------------------|
| 1  |        subject              | Identifier of the subject who performed the activity (1 to 30)          |
| 2  |       activity              | Activity while wearing a smartphone (string)                            |
| 3  |    tBodyAcc-mean()-X        | Mean of mean body acceleration signals (time domain, X-axis)            |
| 4  |    tBodyAcc-mean()-Y        | Mean of mean body acceleration signals (time domain, Y-axis)            |
| 5  |    tBodyAcc-mean()-Z        | Mean of mean body acceleration signals (time domain, Z-axis)            |
| 6  |     tBodyAcc-std()-X        | Mean std. dev. of body acceleration signals (time domain, X-axis)       |
| 7  |     tBodyAcc-std()-Y        | Mean std. dev. of body acceleration signals (time domain, Y-axis)       |
| 8  |     tBodyAcc-std()-Z        | Mean std. dev. of body acceleration signals (time domain, Z-axis)       |
| 9  |   tGravityAcc-mean()-X      | Mean of mean gravity acceleration signals (time domain, X-axis)         |
| 10 |   tGravityAcc-mean()-Y      | Mean of mean gravity acceleration signals (time domain, Y-axis)         |
| 11 |   tGravityAcc-mean()-Z      | Mean of mean gravity acceleration signals (time domain, Z-axis)         |
| 12 |    tGravityAcc-std()-X      | Mean std. dev. of gravity acceleration signals (time domain, X-axis)    |
| 13 |    tGravityAcc-std()-Y      | Mean std. dev. of gravity acceleration signals (time domain, Y-axis)    |
| 14 |    tGravityAcc-std()-Z      | Mean std. dev. of gravity acceleration signals (time domain, Z-axis)    |
| 15 |  tBodyAccJerk-mean()-X      | Mean of mean body linear acc. (Jerk) signals (time domain, X-axis)      |
| 16 |  tBodyAccJerk-mean()-Y      | Mean of mean body linear acc. (Jerk) signals (time domain, Y-axis)      |
| 17 |  tBodyAccJerk-mean()-Z      | Mean of mean body linear acc. (Jerk) signals (time domain, Z-axis)      |
| 18 |   tBodyAccJerk-std()-X      | Mean std. dev. of body linear acc. (Jerk) signals (time domain, X-axis) |
| 19 |   tBodyAccJerk-std()-Y      | Mean std. dev. of body linear acc. (Jerk) signals (time domain, Y-axis) |
| 20 |   tBodyAccJerk-std()-Z      | Mean std. dev. of body linear acc. (Jerk) signals (time domain, Z-axis) |
| 21 |   tBodyGyro-mean()-X        | Mean of mean body gyroscope signals (time domain, X-axis)               |
| 22 |   tBodyGyro-mean()-Y        | Mean of mean body gyroscope signals (time domain, Y-axis)               |
| 23 |   tBodyGyro-mean()-Z        | Mean of mean body gyroscope signals (time domain, Z-axis)               |
| 24 |    tBodyGyro-std()-X        | Mean std. dev. of body gyroscope signals (time domain, X-axis)          |
| 25 |    tBodyGyro-std()-Y        | Mean std. dev. of body gyroscope signals (time domain, Y-axis)          |
| 26 |    tBodyGyro-std()-Z        | Mean std. dev. of body gyroscope signals (time domain, Z-axis)          |
| 27 | tBodyGyroJerk-mean()-X      | Mean of mean body angular velocity signals (time domain, X-axis)        |
| 28 | tBodyGyroJerk-mean()-Y      | Mean of mean body angular velocity signals (time domain, Y-axis)        |
| 29 | tBodyGyroJerk-mean()-Z      | Mean of mean body angular velocity signals (time domain, Z-axis)        |
| 30 |  tBodyGyroJerk-std()-X      | Mean std. dev. of body angular velocity signals (time domain, X-axis)   |
| 31 |  tBodyGyroJerk-std()-Y      | Mean std. dev. of body angular velocity signals (time domain, Y-axis)   |
| 32 |  tBodyGyroJerk-std()-Z      | Mean std. dev. of body angular velocity signals (time domain, Z-axis)   |
| 33 |   tBodyAccMag-mean()        | Mean of mean magnitudes of body acceleration signals (time domain)      |
| 34 |    tBodyAccMag-std()        | Mean std. dev. of magnitudes of body acceleration signals (time domain) |
| 35 |  tGravityAccMag-mean()      | Mean of mean magnitudes of gravity acceleration signals (time domain)   |
| 36 |   tGravityAccMag-std()      | Mean std. dev. of magnitudes of gravity acc. signals (time domain)      |
| 37 | tBodyAccJerkMag-mean()      | Mean of mean magnitudes of body lin. acc. (Jerk) signals (time domain)  |
| 38 |  tBodyAccJerkMag-std()      | Mean std. dev. of magnitudes of body linear acc. signals (time domain)  |
| 39 |  tBodyGyroMag-mean()        | Mean of mean magnitudes of body gyroscope signals (time domain)         |
| 40 |   tBodyGyroMag-std()        | Mean std. dev. of magnitudes of body gyroscope signals (time domain)    |
| 41 |  tBodyGyroJerkMag-mean()    | Mean of mean magnitudes of body angular velocity signals (time domain)  |
| 42 | tBodyGyroJerkMag-std()      | Mean std. dev. of magnitudes of body ang. veloc. signals (time domain)  |
| 43 |    fBodyAcc-mean()-X        | Mean of mean body acceleration signals (frequency domain, X-axis)       |
| 44 |    fBodyAcc-mean()-Y        | Mean of mean body acceleration signals (frequency domain, Y-axis)       |
| 45 |    fBodyAcc-mean()-Z        | Mean of mean body acceleration signals (frequency domain, Z-axis)       |
| 46 |   fBodyAcc-std()-X          | Mean std. dev. of body acceleration signals (frequency domain, X-axis)  |
| 47 |   fBodyAcc-std()-Y          | Mean std. dev. of body acceleration signals (frequency domain, Y-axis)  |
| 48 |   fBodyAcc-std()-Z          | Mean std. dev. of body acceleration signals (frequency domain, Z-axis)  |
| 49 |  fBodyAccJerk-mean()-X      | Mean of mean body linear acc. (Jerk) signals (frequency domain, X-axis) |
| 50 |  fBodyAccJerk-mean()-Y      | Mean of mean body linear acc. (Jerk) signals (frequency domain, Y-axis) |
| 51 |  fBodyAccJerk-mean()-Z      | Mean of mean body linear acc. (Jerk) signals (frequency domain, Z-axis) |
| 52 |   fBodyAccJerk-std()-X      | Mean std. dev. of body linear acc. (Jerk) signals (freq.domain, X-axis) |
| 53 |   fBodyAccJerk-std()-Y      | Mean std. dev. of body linear acc. (Jerk) signals (freq.domain, Y-axis) |
| 54 |   fBodyAccJerk-std()-Z      | Mean std. dev. of body linear acc. (Jerk) signals (freq.domain, Z-axis) |
| 55 |   fBodyGyro-mean()-X        | Mean of mean body gyroscope signals (frequency domain, X-axis)          |
| 56 |   fBodyGyro-mean()-Y        | Mean of mean body gyroscope signals (frequency domain, Y-axis)          |
| 57 |   fBodyGyro-mean()-Z        | Mean of mean body gyroscope signals (frequency domain, Z-axis)          |
| 58 |    fBodyGyro-std()-X        | Mean std. dev. of body gyroscope signals (frequency domain, X-axis)     |
| 59 |    fBodyGyro-std()-Y        | Mean std. dev. of body gyroscope signals (frequency domain, Y-axis)     |
| 60 |    fBodyGyro-std()-Z        | Mean std. dev. of body gyroscope signals (frequency domain, Z-axis)     |
| 61 |   fBodyAccMag-mean()        | Mean of mean magnitudes of body acceleration signals (freq. domain)     |
| 62 |    fBodyAccMag-std()        | Mean std. dev. of magnitudes of body acc. signals (frequency domain)    |
| 63 | fBodyBodyAccJerkMag-mean()  | Mean of mean magnitudes of body lin. acc. (Jerk) signals (freq.domain)  |
| 64 | fBodyBodyAccJerkMag-std()   | Mean std. dev. of magnitudes of body lin. acc. signals (freq. domain)   |
| 65 |  fBodyBodyGyroMag-mean()    | Mean of mean magnitudes of body gyroscope signals (frequency domain)    |
| 66 | fBodyBodyGyroMag-std()      | Mean std. dev. of magnitudes of body gyroscope signals (freq. domain)   |
| 67 | fBodyBodyGyroJerkMag-mean() | Mean of mean magnitudes of body angular velocity signals (freq.domain)  |
| 68 | fBodyBodyGyroJerkMag-std()  | Mean std. dev. of magnitudes of body ang. veloc. signals (freq.domain)  |
