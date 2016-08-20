loaddata <- function() {
  
  features <- read.table("./UCI HAR Dataset/features.txt")
  activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
  
  data <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "")
  activity <- read.table("./UCI HAR Dataset/test/Y_test.txt", sep = "")
  subject <- read.table("./UCI HAR Dataset/test/Subject_test.txt", sep = "")
  
  testData <- createBaseTable(features, activity_labels, subject, activity, data)
  
  data <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = "")
  activity <- read.table("./UCI HAR Dataset/train/Y_train.txt", sep = "")
  subject <- read.table("./UCI HAR Dataset/train/Subject_train.txt", sep = "")
  
  trainData <- createBaseTable(features, activity_labels, subject, activity, data)
  
  data <- rbind(trainData, testData)
  data
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
