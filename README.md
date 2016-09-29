# GettingAndCleaningDataProject
Version 1.0
==================================================================
by Raj Kumar
==================================================================
Whats included
---------------
1. This Readme.md file.
2. A CodeBook.md that describes the variables, the data and all transformations performed.
3. A R script file called "run_analysis.R" containing the nec essary code to produce the output files.
4. The output data files.

Steps to execute the run_analysis.R from this repository
---------------------------------------------------------
1. Create a folder on your machine where you have permissions to create directories and sub-directories. For example lets say that this directory is called C:\DataProject.
2. Take the run_analysis.R file from this repository and place it in this folder.
3. Ensure that you have Rstudio with the packages dplyr,data.table,stringr installed.
4. Start Rstudio and then set working directory to this folder containing the run_analysis.R file.
5. Source the file to execute it.
6. You will see some messages printed to the R console while the program is executing. These messages are for convenience only. Once completed you will see the final message "Process Completed. Enjoy!!!"

The steps performed by the code are:
1. A sub-dir called Data is created under the directory containing the scrript fle.
2. The zip file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip is downloaded into the data sub-dir.
3. The files are unzipped, creating a "UCI HAR Dataset" folder in the dir containing the script.
4. From this folder the trainining and test data files are loaded in and the 2 datasets are merged together.
5. The action values are obtained from the file "Activity_Labels.txt" and the action ids are replaced with the descriptive names.
6. The measurements for the mean and standard deviation alone are selected from the complete data, using the labels in "features.txt".
7.The label names for the activities are corrected to ensure removal of special characters like "(," nad also made more descrptive.
8. The label for the subject and actions are also explicitly identified and then the 3 data sets are merged into one tidy data set.
	This file is written as "WearableTidyDataSet.txt" into the folder containing the script file.
9. From this dataset, a new dataset containing the average of each variable for each activity and each subject is chosen. This file is written as "AverageByActivityForSubject.txt" into the folder containing the script file.

For more details on the logic used please refer to the CodeBook.Md file in this repository.
==================================================================
This work was done for a project for the course "Getting and Cleaning Data" by John Hopkins school via Coursera. Please refer to this course for further project instructions.

Each record in the" AverageByActivityForSubject.Txt" contains:
- The Subject referred by a number.
- The activity performed.
- The mean and the standard deviation data columns containing the time and frequency variables.

Th dataset AverageByActivityForSubject contains 75 variables and 180 rows.
==================================================================

The Readme details from the source dataset which was used as input to this project is also included below:
------------------------------------------------------------------------------------------------------------------------------------
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
