loadData <- function(path) {
  data <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "")
  features <- read.table("./UCI HAR Dataset/features.txt")
  activity <- read.table("./UCI HAR Dataset/test/Y_test.txt", sep = "")
  subject <- read.table("./UCI HAR Dataset/test/Subject_test.txt", sep = "")
  activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
  
  features <- as.vector(features$V2)
  data <- cbind(subject, activity, data)
  colnames(data) <- c("id", "activity", features)
  
  data$activity <- factor(data$activity, 
                          levels = as.vector(activity_labels$V1), 
                          labels = as.vector(activity_labels$V2))
  data <- subset(data, select = grep("mean()|std()", names(data)))
  data
}