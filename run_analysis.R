processData <- function() {
  
  # Read meta data for both sets
  features <- read.table("./UCI HAR Dataset/features.txt")
  activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
  
  # Read data and tidy the test dataset
  data <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "")
  activity <- read.table("./UCI HAR Dataset/test/Y_test.txt", sep = "")
  subject <- read.table("./UCI HAR Dataset/test/Subject_test.txt", sep = "")
  
  testData <- createBaseTable(features, activity_labels, subject, activity, data)
  
  # Read data and tidy the training dataset
  data <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = "")
  activity <- read.table("./UCI HAR Dataset/train/Y_train.txt", sep = "")
  subject <- read.table("./UCI HAR Dataset/train/Subject_train.txt", sep = "")
  
  trainData <- createBaseTable(features, activity_labels, subject, activity, data)
  
  # Merge datasets
  data <- rbind(trainData, testData)
  
  # Process and write data to creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  groupedData <- aggregate(data[,3:68], 
                           by= list(data$id, data$activity), 
                           FUN = mean)

  # Add descriptive column names
  colnames(groupedData)[1] <- "Subject"
  colnames(groupedData)[2] <- "Activity"
  
  # Write data to file
  write.table(groupedData, "UCI-HAT-Summary.txt", row.names = F)
  
  groupedData
  
}

createBaseTable <- function(features, activity_labels, subject, activity, data) {
  
  tbl <- cbind(subject, activity, data)
  features <- as.vector(features$V2)
  colnames(tbl) <- c("id", "activity", features)
  tbl <- subset(tbl, select = grep("^id|^activity|mean\\(\\)|std\\(\\)", names(tbl)))
  
  tbl$activity <- factor(tbl$activity, 
                         levels = as.vector(activity_labels$V1), 
                         labels = as.vector(activity_labels$V2))
  tbl
}
