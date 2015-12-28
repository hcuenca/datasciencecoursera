# README

This repository contains the script needed to clean the data in the URL:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

In order to run the script the .zip file has to be unzipped in a folder named 'data'.

The script `run_analysis.R` reads the file `data/train/X_train.txt` into a data frame using the values in `data/features.txt` as column names. It filters out the columns that don't correspond to the mean and standard deviation for each measurement. Two new columns are added with the data in the files `data/train/y_train.txt` and `data/train/subject_train.txt` with the column names "label" and "subject", respectively. An equivalent operation is performed with the files of the correspinding files in the testing data. Both data frames are combined in a single data frame and the activity labels are added by merging with the file `data/activity_labels.txt`.

The variables description of the resulting data set can be found in the file `CodeBook.md` of the current repository.
