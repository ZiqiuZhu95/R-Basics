library(plyr)
library(dplyr)
library(tidyr)
library(readr)


setwd('UCI HAR Dataset')
x_train <- read.table('train/X_train.txt')
x_test <- read.table('test/x_test.txt')
y_train <- read.table('train/Y_train.txt')
y_test <- read.table('test/Y_test.txt')
subject_train <- read.table('train/subject_train.txt')
subject_test <- read.table('test/subject_test.txt')
features <- read.table('features.txt')
#Merges the training and the test sets to create one data set.

x_data <- bind_rows(x_train, x_test)
y_data <- bind_rows(y_train, y_test)
subject_data <- bind_rows(subject_train, subject_test)

#Extracts only the measurements on the mean and standard deviation for each measurement.

colnames(x_data) <- features[,2]
x_meanstd <- x_data[,grepl('mean', colnames(x_data))|grepl('std', colnames(x_data))]
x_meanstd <- x_meanstd[, !grepl('Freq', colnames(x_meanstd))]

#Uses descriptive activity names to name the activities in the data set

activities_list <- read.table('activity_labels.txt')
y_data[,1] <- activities_list[y_data[,1],2]
y_data <- rename(y_data, activity = V1)

# Appropriately label the data set with descriptive variable names
subject_data <- rename(subject_data, subject = V1)

# Create a second, independent tidy data set with the average of each variable for each activity and each subject
data_set <- bind_cols(y_data,subject_data, x_meanstd)
tidy <- data_set %>%
        group_by(subject, activity) %>%
        summarise_all(funs(mean))

write.table(tidy, file = "tidydataset.txt", row.names = FALSE)
