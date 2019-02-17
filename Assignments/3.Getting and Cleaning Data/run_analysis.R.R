#Get the data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "datafile.zip")
unzip(zipfile = "datafile.zip")

#Load data
install.packages("reshape2")
library(reshape2)
install.packages("dplyr")
library(dplyr)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")

#1. Merges the training and the test sets to create one data set.
mergedDT <- rbind(cbind(subject_train, X_train, Y_train), cbind(subject_test, X_test, Y_test))

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
extract <- grepl("mean()|std()", colnames(mergedDT))
extracts <- mergedDT[,extract]
names(extracts)

#3. Uses descriptive activity names to name the activities in the data set
activity_labels
mergedDT[,563] <- factor(mergedDT[,563], levels = activity_labels[,1], labels = activity_labels[,2])
mergedDT[,563]

#4. Appropriately labels the data set with descriptive variable names.
colnames(mergedDT) <- c("subject", features[, 2], "labels")

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
mergedDT_means <- aggregate(. ~ subject + labels, mergedDT, mean)
write.table(mergedDT_means, "tidy_data.txt", row.names = FALSE, quote = FALSE)
