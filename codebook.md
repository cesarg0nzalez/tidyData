# Codebook for the UCI HAR Tidy Dataset
_Tidy Dataset based on Samsung's UCI HAR Dataset_

**Author:** Jeff Collier <br>
**Date:** August 18, 2016

## Overview
The data produced by this work is a tidy abridged version of data collected from the accelerometers from the Samsung Galaxy S smartphone. In particular this work is based on the UCI HAR Dataset that can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

## Variables
The variables used in this dataset are basically of the same type used in the UCI HAR dataset. For a full description of there meaning please see the documentation that accompanies that dataset. This dataset differs in the sense that it selects only the means, and standard deviation values from that set and then further averages the results based on the test subject and

The following columns were added/merged to the dataset:
"subject<br>
activity"

The following feature columns are the means relative to the subject and activity values base on the data in the UCI HAR dataset. All units and descriptions are identical to that dataset.

tBodyAcc-mean()-X<br>
tBodyAcc-mean()-Y<br>
tBodyAcc-mean()-Z<br>
tBodyAcc-std()-X<br>
tBodyAcc-std()-Y<br>
tBodyAcc-std()-Z<br>
tGravityAcc-mean()-X<br>
tGravityAcc-mean()-Y<br>
tGravityAcc-mean()-Z<br>
tGravityAcc-std()-X<br>
tGravityAcc-std()-Y<br>
tGravityAcc-std()-Z<br>
tBodyAccJerk-mean()-X<br>
tBodyAccJerk-mean()-Y<br>
tBodyAccJerk-mean()-Z<br>
tBodyAccJerk-std()-X<br>
tBodyAccJerk-std()-Y<br>
tBodyAccJerk-std()-Z<br>
tBodyGyro-mean()-X<br>
tBodyGyro-mean()-Y<br>
tBodyGyro-mean()-Z<br>
tBodyGyro-std()-X<br>
tBodyGyro-std()-Y<br>
tBodyGyro-std()-Z<br>
tBodyGyroJerk-mean()-X<br>
tBodyGyroJerk-mean()-Y<br>
tBodyGyroJerk-mean()-Z<br>
tBodyGyroJerk-std()-X<br>
tBodyGyroJerk-std()-Y<br>
tBodyGyroJerk-std()-Z<br>
tBodyAccMag-mean()<br>
tBodyAccMag-std()<br>
tGravityAccMag-mean()<br>
tGravityAccMag-std()<br>
tBodyAccJerkMag-mean()<br>
tBodyAccJerkMag-std()<br>
tBodyGyroMag-mean()<br>
tBodyGyroMag-std()<br>
tBodyGyroJerkMag-mean()<br>
tBodyGyroJerkMag-std()<br>
fBodyAcc-mean()-X<br>
fBodyAcc-mean()-Y<br>
fBodyAcc-mean()-Z<br>
fBodyAcc-std()-X<br>
fBodyAcc-std()-Y<br>
fBodyAcc-std()-Z<br>
fBodyAccJerk-mean()-X<br>
fBodyAccJerk-mean()-Y<br>
fBodyAccJerk-mean()-Z<br>
fBodyAccJerk-std()-X<br>
fBodyAccJerk-std()-Y<br>
fBodyAccJerk-std()-Z<br>
fBodyGyro-mean()-X<br>
fBodyGyro-mean()-Y<br>
fBodyGyro-mean()-Z<br>
fBodyGyro-std()-X<br>
fBodyGyro-std()-Y<br>
fBodyGyro-std()-Z<br>
fBodyAccMag-mean()<br>
fBodyAccMag-std()<br>
fBodyBodyAccJerkMag-mean()<br>
fBodyBodyAccJerkMag-std()<br>
fBodyBodyGyroMag-mean()<br>
fBodyBodyGyroMag-std()<br>
fBodyBodyGyroJerkMag-mean()<br>
fBodyBodyGyroJerkMag-std()

## Dataset
The dataset generated is the merger of the test data and the training data. Test subjects and training subjects ids are exclusive (i.e. a subject was used either for test or training) so the complete set represents a contiguous set of subjects.

The data was subsetted so that only mean and standard deviation values were included and values that were derivatives of a mean or standard deviation were also included.

Finally the data was grouped based on activity and subject and within these categories a mean value was computed.

## Data Transformations
The transformations used to generate this dataset can be found in the script run_analysis.R. It is organized into to functions, 1) processData() and 2) createBaseTable. The second function is called by the first with the primary purpose of reducing code duplication in the main processData() function.

The basic flow of the transformations are as follows:
* Read meta data for both sets
* Read data and tidy the test dataset
* Read data and tidy the training dataset
* Merge datasets
* Process and write data to creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Add descriptive column names
* Write data to file

For further details see "run_analysis.R".
