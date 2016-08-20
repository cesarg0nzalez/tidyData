# UCI HAR Tidy Dataset
_Tidy Dataset based on Samsung's UCI HAR Dataset_

**Author:** Jeff Collier <br>
**Date:** August 18, 2016

### Description
The data produced by this work is a tidy abridged version of data collected from the accelerometers from the Samsung Galaxy S smartphone. More information on that set can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

### Process
The processData() function in the run_analysis.R file will load a set of files from the Samsung UCI HAR Dataset and produce two new data sets one with a cleaned up and abridged set of data that merges the training and test sets. The second provides the  average of each variable for each activity and each subject. The second table is saved as a file
