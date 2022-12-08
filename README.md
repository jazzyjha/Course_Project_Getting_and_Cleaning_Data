Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no 
questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github
 repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any 
transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the 
repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article. 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Files included are:

run_analysis.R - File with the R code performs data preparation and then does the 5 steps mentioned above that are required in the course project.
The R codes read the files into different tables, assign column names and then merges all the data into one data set. Standard deviation and mean 
are extracted. Descriptive names are assigned to activities in the data set. Data set is labeled with appropriate labels. A tidy data set is created 
with the average of each variable for each activity and each subject. The final tidy data set is written to file named Final_Data.txt.

CodeBook.md - Code book listing the variables, data and any transformations performed to clean up the data.

Final_Data.txt - This file has the final tidy data after performing the 5 steps defined in the course project.