#################################################################################################
## Program:     run_analysis.R
##              Version: R x64 3.4.2
## Programmer:  Craig Anderson
## Date:        October 16, 2017
## Purpose:     Getting and Cleaning Data Project
##              This script provides the run_analysis.R function for the Peer-graded Assignment.
##              It downloads the compressed datafiles and then does the following:
##
##                1. Merges the training and the test sets to create one data set.
##                2. Extracts only the measurements on the mean and standard deviation 
##                   for each measurement.
##                3. Uses descriptive activity names to name the activities in the data set
##                4. Appropriately labels the data set with descriptive variable names.
##                5. From the data set in step 4, creates a second, independent tidy data set 
##                   with the average of each variable for each activity and each volunteer.
##
##              Further information is provided in the accompanying README.md file.
##
#################################################################################################

run_analysis <- function(){
    
    # Ensure required R Packages are installed and loaded
    #---------------------------------------------------------------------------------------------
    require(dplyr)
    require(rio)
    print("Required packages installed and loaded.")
    
    # Download compressed data file
    #---------------------------------------------------------------------------------------------
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                  destfile = "compressedfiles.zip")
    
    # Decompress data files and obtain list of filenames
    # See README.md file for file index listing
    #---------------------------------------------------------------------------------------------
    filenames <- unzip("compressedfiles.zip")
    
    # Read activity and measurement(features) label data tables
    # Relable columns for subsequent reference
    #---------------------------------------------------------------------------------------------
    activities <- import(filenames[1])
    colnames(activities) = c("activityID", "activity")
    
    measurements <- import(filenames[2])
    colnames(measurements) = c("measurementID", "measurement")
    
    # Read test data and merge into combined dataset
    # Relabel columns for subsequent reference
    #---------------------------------------------------------------------------------------------
    test_participant <- import(filenames[14])
    colnames(test_participant) = "volunteerID"
    
    test_data <- import(filenames[15])
    colnames(test_data) = measurements[ , 2]
    
    test_activity <- import(filenames[16])
    colnames(test_activity) = "activityID"
    test_activity <- merge(test_activity, activities, by = "activityID", all.x = TRUE)
    test_activity <- subset(test_activity, select = activity)
    
    # Test for data match, and combine columns. Throw error if not matched
    if (isTRUE(all.equal(length(test_activity), 
                         length(test_participant), 
                         length(test_activity))))  {
        
        combined_data <- cbind(test_activity, test_participant, test_data)
    
    } else {
        
        stop("Fatal file read error.  Datafile column lengths are unequal.")
    }
    
    print("Test data files successfully loaded and combined.")
    
    
    # Read training data, merge into a single dataset and add to combined dataset
    # Relabel columns for subsequent reference
    #---------------------------------------------------------------------------------------------
    training_participant <- import(filenames[26])
    colnames(training_participant) = "volunteerID"
    
    training_data <- import(filenames[27])
    colnames(training_data) = measurements[ , 2]
    
    training_activity <- import(filenames[28])
    colnames(training_activity) = "activityID"
    training_activity <- merge(training_activity, activities, by = "activityID", all.x = TRUE)
    training_activity <- subset(training_activity, select = activity)
    
    # Test for data matches and combine file columns. Throw error if not matched
    if (isTRUE(all.equal(length(training_activity), 
                         length(training_participant), 
                         length(training_activity))))    {
        
        combined_training_data <- cbind(training_activity, training_participant, training_data)
    
    } else {
        
        stop("Fatal file read error.  Datafile column lengths are unequal.")
    }        
        
    # Test for data matches and add rows. Throw error if not matched
    
    if (isTRUE(all.equal(ncol(combined_data),ncol(combined_training_data))))   {
        
        combined_data <- rbind(combined_data, combined_training_data)
        
    } else {
        
        stop("Fatal file read error.  Datafile number of columns are unequal.")  
    }
    
    print("Training data files successfully loaded and combined.")
    
    # Subset data by selecting mean and standard deviation data
    #---------------------------------------------------------------------------------------------
    selected_measurements <- grep("-mean..|-std..", measurements$measurement, value = TRUE)
    tidy_dataset <- combined_data[c("activity", "volunteerID",selected_measurements )]
    
    # Clarify selected variable measurement labels 
    #---------------------------------------------------------------------------------------------
    names(tidy_dataset) <- gsub("BodyBody", "Body", 
                                names(tidy_dataset))        # Eliminate redundant label
    
    names(tidy_dataset) <- gsub("^t", "time", 
                                names(tidy_dataset))  # Clarify t abbreviation
    
    names(tidy_dataset) <- gsub("^f", "frequency", 
                                names(tidy_dataset))   # Clarify f abbreviation
    
    names(tidy_dataset) <- gsub("Acc", "Accelerometer", names(tidy_dataset))
    
    names(tidy_dataset) <- gsub("Mag", "Magnitude", names(tidy_dataset))
    
    names(tidy_dataset) <- gsub("std", "StandardDeviation", names(tidy_dataset))
    
    # Return TidyData file
    #---------------------------------------------------------------------------------------------
    export(tidy_dataset, file = "TidyData.txt")
    
    print("Processing complete.  TidyData.txt file available in working directory for viewing.")
    
}
    
