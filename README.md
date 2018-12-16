# GettingAndCleaningData

This is my submission for Getting and Cleaning Data Coursera Project.

# Data Source
Data for the project is obtained from the link below:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

# About Repository
This repository contains the following files:
1. README.md explains the analysis files 
2. CodeBook.md indicates all the variables and summaries calculated 
3. run_analysis.R contains the R script that reads the test and train data and merge them to create one data set. From the data set, only measurements on the mean and standard deviation are extracted. The activity labels and features are extracted from "activity_labels.txt" and "features.txt" files, respectively. 
Descriptive activity names and data variable names are set accordingly and average of each variable for each activity and subject is calculated.
4. tidy_data.txt that contains mean values for each activity and corresponding subject.
