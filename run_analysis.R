install.packages("dplyr")
library(dplyr)

#Read the data into dataframes

featuresNames <-read.table("UCI HAR Dataset/features.txt", col.names=c("num", "functions"))
activities <-read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("code","activity"))
subjectTest <-read.table("UCI HAR Dataset/test/subject_test.txt", col.names="subject")
x_test <-read.table("UCI HAR Dataset/test/X_test.txt", col.names=featuresNames$functions)
y_test <-read.table("UCI HAR Dataset/test/y_test.txt", col.names="code")
subjectTrain <-read.table("UCI HAR Dataset/train/subject_train.txt", col.names="subject")
x_train <-read.table("UCI HAR Dataset/train/X_train.txt", col.names=featuresNames$functions)
y_train <-read.table("UCI HAR Dataset/train/y_train.txt", col.names="code")

# 1. Merge the training and test sets to create one data set

X_Data <-rbind (x_train, x_test)
Y_Data <-rbind (y_train, y_test)
Subject_Data <- rbind(subjectTest, subjectTrain)
Merged_Data <- cbind(Subject_Data, X_Data, Y_Data)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement

Tidydata <- Merged_Data %>% select(subject, code, contains ("mean"), contains ("std"))

# 3. Uses descriptive activity names to name the activites in the data set

Tidydata$code <- activities[Tidydata$code, 2]

# 4. Appropriately labels the data set with descriptive variable names

names (Tidydata) <- gsub ("-freq()", "Frequency", names(Tidydata), ignore.case=TRUE)
names (Tidydata) <- gsub ("-std()", "STD", names(Tidydata), ignore.case=TRUE)
names (Tidydata) <- gsub ("-mean()", "Mean", names(Tidydata), ignore.case=TRUE)
names (Tidydata)[2] = "activity"
names (Tidydata) <- gsub ("^t", "Time", names(Tidydata))
names (Tidydata) <- gsub ("^f", "Frequency", names(Tidydata))
names (Tidydata) <- gsub ("Acc", "Accelerometer", names(Tidydata))
names (Tidydata) <- gsub ("Gyro", "Gyroscope", names(Tidydata))
names (Tidydata) <- gsub ("BodyBody", "Body", names(Tidydata))
names (Tidydata) <- gsub ("Mag", "Magnitude", names(Tidydata))
names (Tidydata) <- gsub ("tBody", "TimeBody", names(Tidydata))

# 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

Final_Data <- Tidydata %>% group_by (subject, activity) %>% summarise_all(funs(mean))
write.table(Final_Data, "Final_Data.txt", row.name=FALSE)




