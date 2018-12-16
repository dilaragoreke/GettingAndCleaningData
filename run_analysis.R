library(dplyr)
library(reshape2)


setwd("C:/Users/Dilara/Documents/R/Coursera/UCI HAR Dataset")

# Getting training data
X_train <- read.table("train/X_train.txt")
Y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# Getting test data
X_test <- read.table("test/X_test.txt")
Y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Getting activity labels and features
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt", as.is = TRUE)

col_labels <- c("Subject","Activity",features$V2)


# Step 1. Merging the training and the test sets to create one data set
merged_dataset <- rbind(cbind(subject_train, Y_train, X_train), cbind(subject_test, Y_test, X_test))

colnames(merged_dataset) = col_labels

# Step 2. Extracting only the measurements on the mean and standard deviation for each measurement
dataset_mean_std <- merged_dataset[,grepl("Subject|Activity|mean|std", col_labels)]


# Step 3. Assigning descriptive activity names to name the activities in the data set
dataset_mean_std$Activity <- factor(dataset_mean_std$Activity, levels = activity_labels[,1], labels = activity_labels[,2])

dataset_mean_std$Subject <- as.factor(dataset_mean_std$Subject)

# Step 4. Labeling the data set with descriptive variable names.
colnames(dataset_mean_std) <- gsub('Acc',           "Acceleration",             colnames(dataset_mean_std))
colnames(dataset_mean_std) <- gsub("\\()",          "",                         colnames(dataset_mean_std))
colnames(dataset_mean_std) <- gsub('tBodyGyroJerk', "BodyGyroscopeJerk",        colnames(dataset_mean_std))
colnames(dataset_mean_std) <- gsub('tBodyAccJerk',  "BodyAccelerationJerk",     colnames(dataset_mean_std))
colnames(dataset_mean_std) <- gsub('^f',            "frequency",                colnames(dataset_mean_std))
colnames(dataset_mean_std) <- gsub('\\.std',        "StdDev",                   colnames(dataset_mean_std))
colnames(dataset_mean_std) <- gsub('Mag',           "Magnitude",                colnames(dataset_mean_std))
colnames(dataset_mean_std) <- gsub('^t',            "Time",                     colnames(dataset_mean_std))

# Step 5. From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_data      <- melt(dataset_mean_std, id = c("Subject", "Activity"))
tidy_data_mean <- dcast(tidy_data, Subject + Activity ~ variable, mean)

write.table(tidy_data_mean, "tidy_data.txt", row.names = FALSE, quote = FALSE)
