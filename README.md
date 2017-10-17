#**Getting and Cleaning Data Project**#**Getting and Cleaning Data Project**
####**README.md**
#####Developer: Craig Anderson
#####Date: October 16, 2017

###**Introduction**

This project is designed to develop and demonstrate techniques for getting and cleansing data as part of the John Hopkins University Getting and Cleaning Data course. The objective is to prepare a “tidy dataset” that could be used for further analysis. 

A "tidy dataset" is data where:

* Each variable is in a column.
* Each observation is a row.
* Each value is a cell.

The tidy dataset produced for this project is a "wide" dataset to allow for easy visual review.

The project domain focuses on data obtained from wearable computing devices similar to Fitbit, Nike and Jawbone UP.  In the project dataset, data is obtained from an experimental design using a Samsung Galaxy S II worn by 30 volunteers who performed six different activities ranging from laying to walking at various levels of difficulty.  A description of the experimental design and the raw data tables can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones   

This project uses the data files to produce a single data set that extracts the mean and standard deviation of the observation variables for each measurement by activity and volunteer. A description of the measured activities and related variables ("features" in the original data files or, as used in this project, "measurements") can be found in the CodeBook.MD file.  The operative script (run_analysis.R) and a resulting sample “tidy data” file (TidyData.txt) are also found in this repo.  


###**Project Software**

This project was performed using the following software:

* Rx64 3.4.2 running on x86_64-w64-mingw32/x64 (64-bit) Windows 10 system.

* RStudio Version 1.1.383

* R Packages
    * dplr v0.7.4
    * rio  v0.5.5

rio was selected as a good fit for this project because of how easily it imports and exports data files.  Specifically, it automatically handles numerous file types, including multiple files and .zip files.  In addition, it does not import character strings as factors.

More information on rio is available at https://www.rdocumentation.org/packages/rio/versions/0.5.5   

###**Recommended Environment Setup and Execution Instructions**

1. Preload R version 3.4.2 or higher.  
2. RStudio is recommended, but not required.
3. Create a new working directory and ensure that it is empty.  Be sure to set directory as the working directory for the R session.  Consider running rm(list = ls()) while in the new directory and between running of the run_analysis.R function to completely erase the contents. All files, including the data files, will be downloaded to this directory when the function is executed.
4. Install the required dplyr and rio packages if needed and load the libraries.
5. Source the function script file using source("run_analysis.R")
5. Execute the script using run_analysis()

The TidyData.txt file with then be accessible from the working directory.

###**Project Data**

Project datafiles were downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full decription of the data for this project can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
A more specific discussion of the data as produced for this project is found in the CodeBook.md file.

Full credit for the study design and data compliation goes to Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. The study was published in Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

###**Datafile Processing**

For purposes of the experimental design, the volunteers were divided into two groups: Testing and Training.  Data was collected and collated for both groups. This project requires that the data for both groups be merged into a single data set.

After reading and decompressing the data set, the following files are available:

 [1] "./UCI HAR Dataset/activity_labels.txt"  
 [2] "./UCI HAR Dataset/features.txt"  
 [3] "./UCI HAR Dataset/features_info.txt"  
 [4] "./UCI HAR Dataset/README.txt"  
 [5] "./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt"  
 [6] "./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt"  
 [7] "./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt"  
 [8] "./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt"  
 [9] "./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt"  
[10] "./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt"  
[11] "./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt"  
[12] "./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt"  
[13] "./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt"  
[14] "./UCI HAR Dataset/test/subject_test.txt"  
[15] "./UCI HAR Dataset/test/X_test.txt"  
[16] "./UCI HAR Dataset/test/y_test.txt"  
[17] "./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt"  
[18] "./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt"  
[19] "./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt"  
[20] "./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt"  
[21] "./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt"  
[22] "./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt"  
[23] "./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt"  
[24] "./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt"  
[25] "./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt"  
[26] "./UCI HAR Dataset/train/subject_train.txt"  
[27] "./UCI HAR Dataset/train/X_train.txt"  
[28] "./UCI HAR Dataset/train/y_train.txt"   

Files 5 through 13 and 17 through 25 contain the raw signal data for the test and training volunteer groups, respectively.  For purposes of this project, these files are not needed to obtain the mean and standard deviation measurements.  Files 14 through 16 and 26 through 28 contain these calculations and will be used to build the tidy dataset.  Files 1 and 2 are also used to provide the activity and measurement descriptive labels.

Descriptive activity labels are revised as the combined dataset is prepared rather than at the end in preparing the final tidy dataset to facilitate analysis at each stage.  Variable (measurement) column names are revised in the final dataset only. 

###**run_analysis.R Pseudo Code**

run_analysis.R proceeds in the following steps:

1. The required R packages are called to ensure that subsequent subfunction calls are met.  This is a subjective choice.  Some developers call and load libraries as needed.  Others prefer to organize their code with all of the calls at the beginning.  This is the approach used here.

2. The compressed data file is downloaded.  This will appear in its entirety in the selected working directory.

3. The compressed file is unzipped and a list of the data files is extracted.  This will have the effect of unzipping the entire file hierarchy into the working directory.  It also provides a convenient list for referencing the data files.  See above for a complete listing of the files and their index numbers.

4. The required files are then imported into memory using rio and assigned file handles for further processing.  Column labels are also changed to facilitate subsequent references.

5. The testing and training files are tested for data matching and then combined into one dataset.  The testing calls will throw error messages if the files cannot be combined.

6. The combined file is then subsetted to form a new dataset with the activity, volunteerID and mean and standard deviation measurements.  Unclear measurement labels are clarified and relabeled where appropriate.

7. Finally, the tidy dataset is exported using rio into a text file.  This revised dataset will also appear in the working directory as “TidyData.txt”.

**Reminder:**  You should clear your working directory prior to running run_analysis.R as it recreates the compressed, uncompressed and TidyData.txt files.  Clearing you working directory will also avoid the potential confusion from the creation of multiple or conflicting R objects.
