**TidyData DataBase CodeBook**  
**CodeBook.md**  
Developer: Craig Anderson  
Date: October 16, 2017  

**Overview**

This CodeBook describes the data activity and measurement labels usedin the TidyData.txt file.  This is the "tidy dataset" file produced by the run_analysis() function in this repo.  Additional information can be found in the README.md file.  

**Datasets**

The run_analysis() function uses data from a wearable computing device to measure physical activity.  The initial data was obtained from an experimental design using a Samsung Galaxy S II worn by 30 volunteers who performed six different activates ranging from laying to walking at various levels of difficulty.  

A description of the experimental design and the raw data tables can be found at   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones . 

The original data files are downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip each time run_analysis() is called.   

The study was conducted by Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz and published in Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.

There are 28 files in the original dataset.  Six files contain data used to compile the TidyData.txt datafile.  Two additional files provide labels for the activities performed and the measurements taken by the device (defined in more detail, below).  See the README.md file discussion of "Datafile Processing" for addtional details surrounding the processing performed by run_analysis().

The final processed TidyData.txt dataset contains 10299 observations of 81 variables, described in more detail below. 

**Activity Descriptions**

The following six activities were performed by the volunteers.  Each volunteer is identified by a unique number.

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

These are the same activity descriptors used in the TidyData.txt dataset.

**Measurement Descriptions**

Measurements of physical activity were taken by using a Samsung Galaxy embedded accelerometer and gyroscope.  Sensor signals were pre-processed using noise filters and then sampled in fixed-width sliding windows of 2.56 secs with a 50% overlap (128 readings/window). Statistical means and standard deviations were calculated for each interval and reported as individual record observations along three axial linear acceleration and angular velocities. 

The specific variables are described as "features" in the original dataset and as "measurements" in the processed TidyData.txt dataset.   

**Data Key**

**Accelerometer Readings:** The acceleration signal from the smartphone accelerometer over the x, y and z axes in standard gravity units 'g'. 

**Body Acceleration Readings:** The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

**Gyroscope Readings:** The angular velocity vector measured by the gyroscope along the x, y and z axes. The units are radians/second.

All measurements are floating-point numeric values, normalized and bounded within [-1,1].  All mean and standard deviation values are calculated from 128 individual signal readings.  These measurements can be organized into two main groups:

1. *Time signals* (measurements prefixed by "time") recorded from the raw accelerometer and gyroscope signals, and

2. *Frequency measurements* (prefixed by "frequency") calculated by the application of a Fast Fourier Transform algorithm to the related time signals.

**Record fields**

Each record in the TidyData dataset includes:

 [1] "activity"     A character sting representing the various activity
 
 [2] "volunteerID"  A numeric identification number for each volunteer ranging from 1 to 30
 
 [3] "timeBodyAccelerometer-mean()-X"                             
 [4] "timeBodyAccelerometer-mean()-Y"                             
 [5] "timeBodyAccelerometer-mean()-Z"
 
 [6] "timeBodyAccelerometer-StandardDeviation()-X"                
 [7] "timeBodyAccelerometer-StandardDeviation()-Y"                
 [8] "timeBodyAccelerometer-StandardDeviation()-Z"
 
 [9] "timeGravityAccelerometer-mean()-X"                          
[10] "timeGravityAccelerometer-mean()-Y"                          
[11] "timeGravityAccelerometer-mean()-Z"

[12] "timeGravityAccelerometer-StandardDeviation()-X"             
[13] "timeGravityAccelerometer-StandardDeviation()-Y"             
[14] "timeGravityAccelerometer-StandardDeviation()-Z" 

[15] "timeBodyAccelerometerJerk-mean()-X"                         
[16] "timeBodyAccelerometerJerk-mean()-Y"                         
[17] "timeBodyAccelerometerJerk-mean()-Z"

[18] "timeBodyAccelerometerJerk-StandardDeviation()-X"            
[19] "timeBodyAccelerometerJerk-StandardDeviation()-Y"            
[20] "timeBodyAccelerometerJerk-StandardDeviation()-Z"

[21] "timeBodyGyro-mean()-X"                                      
[22] "timeBodyGyro-mean()-Y"                                      
[23] "timeBodyGyro-mean()-Z"

[24] "timeBodyGyro-StandardDeviation()-X"                         
[25] "timeBodyGyro-StandardDeviation()-Y"                         
[26] "timeBodyGyro-StandardDeviation()-Z"

[27] "timeBodyGyroJerk-mean()-X"                                  
[28] "timeBodyGyroJerk-mean()-Y"                                  
[29] "timeBodyGyroJerk-mean()-Z"

[30] "timeBodyGyroJerk-StandardDeviation()-X"                     
[31] "timeBodyGyroJerk-StandardDeviation()-Y"                     
[32] "timeBodyGyroJerk-StandardDeviation()-Z"

[33] "timeBodyAccelerometerMagnitude-mean()"                      
[34] "timeBodyAccelerometerMagnitude-StandardDeviation()"

[35] "timeGravityAccelerometerMagnitude-mean()"                   
[36] "timeGravityAccelerometerMagnitude-StandardDeviation()"

[37] "timeBodyAccelerometerJerkMagnitude-mean()"                  
[38] "timeBodyAccelerometerJerkMagnitude-StandardDeviation()"

[39] "timeBodyGyroMagnitude-mean()"                               
[40] "timeBodyGyroMagnitude-StandardDeviation()"

[41] "timeBodyGyroJerkMagnitude-mean()"                           
[42] "timeBodyGyroJerkMagnitude-StandardDeviation()"

[43] "frequencyBodyAccelerometer-mean()-X"                        
[44] "frequencyBodyAccelerometer-mean()-Y"                        
[45] "frequencyBodyAccelerometer-mean()-Z"

[46] "frequencyBodyAccelerometer-StandardDeviation()-X"           
[47] "frequencyBodyAccelerometer-StandardDeviation()-Y"           
[48] "frequencyBodyAccelerometer-StandardDeviation()-Z"

[49] "frequencyBodyAccelerometer-meanFreq()-X"                    
[50] "frequencyBodyAccelerometer-meanFreq()-Y"                    
[51] "frequencyBodyAccelerometer-meanFreq()-Z"

[52] "frequencyBodyAccelerometerJerk-mean()-X"                    
[53] "frequencyBodyAccelerometerJerk-mean()-Y"                    
[54] "frequencyBodyAccelerometerJerk-mean()-Z"

[55] "frequencyBodyAccelerometerJerk-StandardDeviation()-X"       
[56] "frequencyBodyAccelerometerJerk-StandardDeviation()-Y"       
[57] "frequencyBodyAccelerometerJerk-StandardDeviation()-Z"

[58] "frequencyBodyAccelerometerJerk-meanFreq()-X"                
[59] "frequencyBodyAccelerometerJerk-meanFreq()-Y"                
[60] "frequencyBodyAccelerometerJerk-meanFreq()-Z"

[61] "frequencyBodyGyro-mean()-X"                                 
[62] "frequencyBodyGyro-mean()-Y"                                 
[63] "frequencyBodyGyro-mean()-Z"

[64] "frequencyBodyGyro-StandardDeviation()-X"                    
[65] "frequencyBodyGyro-StandardDeviation()-Y"                    
[66] "frequencyBodyGyro-StandardDeviation()-Z"

[67] "frequencyBodyGyro-meanFreq()-X"                             
[68] "frequencyBodyGyro-meanFreq()-Y"                             
[69] "frequencyBodyGyro-meanFreq()-Z"

[70] "frequencyBodyAccelerometerMagnitude-mean()"                 
[71] "frequencyBodyAccelerometerMagnitude-StandardDeviation()"   
[72] "frequencyBodyAccelerometerMagnitude-meanFreq()"  

[73] "frequencyBodyAccelerometerJerkMagnitude-mean()"             
[74] "frequencyBodyAccelerometerJerkMagnitude-StandardDeviation()"  
[75] "frequencyBodyAccelerometerJerkMagnitude-meanFreq()"  

[76] "frequencyBodyGyroMagnitude-mean()"                          
[77] "frequencyBodyGyroMagnitude-StandardDeviation()"             
[78] "frequencyBodyGyroMagnitude-meanFreq()"

[79] "frequencyBodyGyroJerkMagnitude-mean()"                      
[80] "frequencyBodyGyroJerkMagnitude-StandardDeviation()"         
[81] "frequencyBodyGyroJerkMagnitude-meanFreq()" 
