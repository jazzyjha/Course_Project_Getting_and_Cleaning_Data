Code Book for Getting and Cleaning Data Course Project

run_analysis.R performs data download, merges the training and test data sets to create one data set.
As per the course project requirement, following data transformations and work were performed:

1. Downloaded the data zip file
	UCI HAR Dataset folder was extracted from the zip file.

2. Read the data from the files into tables
	featuresNames reads features.txt
	activities reads activity_labels.txt
	subjectTest reads subject_test.txt
	x_test reads X_test.txt
	y_test reads Y_test.txt
	subjectTrain reads subject_train.txt
	x_train reads X_train.txt
	y_train reads Y_train.txt

3. Training and Test data sets are merged into one
	X_Data is the merged data of x_test and x_train
	Y_Data is the merged data of y_test and y_train
	Subject_Data is the merged data of subjectTest and subjectTrain
	Merged_Data is merged data of X_Data, Y_Data and Subject_Data

4. Measurements on the mean and standard deviation for each measurement is extracted
	Tidydata is obtained by subsetting Merged_Data and selecting columns subject and code and performing mean and standard deviation on each measurement.

5. Uses descriptive activity names to name the activities in the data set
	The numbers in code column of the Tidydata is replaced by the corresponding activity name taken from the activites table

6. Appropriately labels the data set with descriptive variable names
	code column in Tidydata is renamed to activities
	All Acc are renamed to Accelerometer
	All Gyro are renamed to Gyroscope
	All BodyBody are renamed to Body
	All Mag are renamed to Magnitude
	All -freq are renamed to Frequency
	All -std() are renamed to STD
	All -mean() are renamed to Mean
	All tBody are renamed to TimeBody
	All t are renamed to Time

7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	Final_Data is created by summarizing Tidydata taking the means of each variable for each activity and each subject, after they are groupped by subject and activity
	Write the result to Final_Data.txt file.


	 