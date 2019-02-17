---
title: "README"
output: html_document
---

## Getting and Cleaning Data - Course Project

This is a README.md file that explains how all of the scripts work and how they are connected in the course project for the "Getting and Cleaning Data" of "Data Science" in the Coursera course. 

The R script, run_analysis.R, is created to do as follows:

1. Download the data linked from the course website in the working directory
2. Load the activity labels which has descriptive activity names
3. Load the subject, activity and labels (columns) from both training and test dataset, and merges those columns and dataset 
4. Extracts variables that have mean and standard deviation values for each measurement.
5. Label the variable names in merged dataset with the descriptive activity names
6. Create a tidy data that consists of mean values of each subject and each activity. The result is written as the file "tidy_data.txt".