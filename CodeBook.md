By Raj Kumar on 28-09-2016 for the  "Getting and Cleaning Data Course Project"

Instructions for project 
------------------------
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names.
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Origins of the Data used for analysis
-------------------------------------
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap(128 readings/window). The sensor acceleration signal which has gravitational and body motion components was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is Assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Attribute Information
---------------------
For each record in the dataset it is provided:
-Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
-Triaxial Angular velovity from the gyroscope.
-A 561 feature vector with tiem and frequency domain variables.
-Its activity label.
-An identifier of the subject who carried out the experiment.

Description of the input DATA
-----------------------------
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix ‘t’ to denote time) were captured at a constant rate of 50 Hz. and the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) – both using a low pass Butterworth filter.
The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).A Fast Fourier Transform (FFT) was applied to some of these signals producing :
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the ‘f’ to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt' included in the original data set.


Details of the data elements captured as output of this program
----------------------------------------------------------------
From the above data we chose to select those elements having only the measurements on the mean and standard deviation for each measurement, by ensuring that the string of "mean" or "std" was in the element name which was specified in the 'features.txt' file provided as part of the compressed data file. This resulted in:

S.No	Label						                Comments
----	-----						                ---------------------------------------------------------------------------------
01)	  Subject						                - The subjects tha tparticipated in the measuresments denoted as 1-30

02)	  Activity 					                - The actions performed for that measurement. One of WALKING,                 
                                           WALKING_UPSTAIRS,WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

03)	  TimeBodyAccelerometer-mean-X			- Average of tBodyAcc-mean()-X column in the original data for specified activity and subject
04)	  TimeBodyAccelerometer-mean-Y
05) 	TimeBodyAccelerometer-mean-Z

06) 	TimeBodyAccelerometer-std-X			   - Average of tBodyAcc-std()-X column for specified activity and subject.
07)	  TimeBodyAccelerometer-std-Y
08) 	TimeBodyAccelerometer-std-Z

09)	  TimeGravityAccelerometer-mean-X			- Average of tGravityAcc-mean()-X column for specified activity and subject.
10)	  TimeGravityAccelerometer-mean-Y
11)	  TimeGravityAccelerometer-mean-Z

12)	  TimeGravityAccelerometer-std-X			- Average of tGravityAcc-std()-X column for specified activity and subject.
13)	  TimeGravityAccelerometer-std-Y
14) 	TimeGravityAccelerometer-std-Z

15)	  TimeBodyAccelerometerJerk-mean-X		- Average of tBodyAccJerk-mean()-X() column for specified activity and subject.
16) 	TimeBodyAccelerometerJerk-mean-Y
17)	  TimeBodyAccelerometerJerk-mean-Z

18)	  TimeBodyAccelerometerJerk-std-X			-Average of tBodyAccJerk-std()-X column for specified activity and subject.
19)	  TimeBodyAccelerometerJerk-std-Y
20)	  TimeBodyAccelerometerJerk-std-Z

21)	  TimeBodyGyro-mean-X				          -Average of tBodyGyro-mean()-X column for specified activity and subject.
22)	  TimeBodyGyro-mean-Y
23) 	TimeBodyGyro-mean-Z

24)	  TimeBodyGyro-std-X				          -Average of tBodyGyro-std()-X column for specified activity and subject.
25)	  TimeBodyGyro-std-Y
26)	  TimeBodyGyro-std-Z

27) 	TimeBodyGyroJerk-mean-X				      -Average of tBodyGyroJerk-mean()-X column for specified activity and subject.
28)	  TimeBodyGyroJerk-mean-Y
29)	  TimeBodyGyroJerk-mean-Z

30)	  TimeBodyGyroJerk-std-X				      -Average of tBodyGyroJerk-std()-X column for specified activity and subject.
31)	  TimeBodyGyroJerk-std-Y
32)	  TimeBodyGyroJerk-std-Z

33)	  TimeBodyAccelerometerMagnitude-mean		    -Average of tBodyAccMag-mean() column for specified activity and subject.
34)	  TimeBodyAccelerometerMagnitude-std

35) 	TimeGravityAccelerometerMagnitude-mean		-Average of tGravityAccMag-mean() column for specified activity and subject.
36)	  TimeGravityAccelerometerMagnitude-std

37)	  TimeBodyAccelerometerJerkMagnitude-mean		-Average of tBodyAccJerkMag-mean() column for specified activity and subject.
38) 	TimeBodyAccelerometerJerkMagnitude-std

39) 	TimeBodyGyroMagnitude-mean			          -Average of tBodyGyroMag-mean() column for specified activity and subject.
40)	  TimeBodyGyroMagnitude-std

41)	  TimeBodyGyroJerkMagnitude-mean			      -Average of tBodyGyroMag-mean() column for specified activity and subject.
42)	  TimeBodyGyroJerkMagnitude-std

43)	  FrequencyBodyAccelerometer-mean-X		      -Average of fBodyAcc-mean()-X column for specified activity and subject.
44) 	FrequencyBodyAccelerometer-mean-Y
45) 	FrequencyBodyAccelerometer-mean-Z

46)	  FrequencyBodyAccelerometer-std-X		      -Average of fBodyAcc-std()-X column for specified activity and subject.
47)	  FrequencyBodyAccelerometer-std-Y
48)	  FrequencyBodyAccelerometer-std-Z

49) 	FrequencyBodyAccelerometerJerk-mean-X		  -Average of fBodyAccJerk-mean()-X column for specified activity and subject.
50) 	FrequencyBodyAccelerometerJerk-mean-Y
51) 	FrequencyBodyAccelerometerJerk-mean-Z

52) 	FrequencyBodyAccelerometerJerk-std-X		  -Average of fBodyAccJerk-std()-X column for specified activity and subject.
53) 	FrequencyBodyAccelerometerJerk-std-Y
54) 	FrequencyBodyAccelerometerJerk-std-Z

55)	  FrequencyBodyGyro-mean-X			            -Average of fBodyGyro-mean()-X column for specified activity and subject.
56) 	FrequencyBodyGyro-mean-Y
57) 	FrequencyBodyGyro-mean-Z

58)	  FrequencyBodyGyro-std-X				            -Average of fBodyGyro-std()-X column for specified activity and subject.
59)	  FrequencyBodyGyro-std-Y
60)	  FrequencyBodyGyro-std-Z

61)	  FrequencyBodyAccelerometerMagnitude-mean	    -Average of fBodyAccMag-mean() column for specified activity and subject.
62) 	FrequencyBodyAccelerometerMagnitude-std		

63)	  FrequencyBodyAccelerometerJerkMagnitude-mean	-Average of fBodyBodyAccJerkMag-mean() column (516).
64) 	FrequencyBodyAccelerometerJerkMagnitude-std

65)	  FrequencyBodyGyroMagnitude-mean			       -Average of fBodyBodyAccGyroMag-mean() column (529) for specified activity and subject.
66)	  FrequencyBodyGyroMagnitude-std

67)	  FrequencyBodyGyroJerkMagnitude-mean		    -Average of fBodyBodyGyroJerkMag-mean() column (542) for specified activity and subject.
68)	  FrequencyBodyGyroJerkMagnitude-std

69) 	angletBodyAccelerometerMean-gravity		          -Average of angle(tBodyAccMean,gravity) or column no 555
70)	  angletBodyAccelerometerJerkMean-gravityMean	    -Average of angle(tBodyAccJerkMean),gravityMean) or col no 556

71)	  angletBodyGyroMean-gravityMean			            - Average of angle(tBodyGyroMean,gravityMean) or column number 557
72)	  angletBodyGyroJerkMean-gravityMean		          - Average of angle(tBodyGyroJerkMean,gravityMean) or column no 558

73)	  angleX-gravityMean				                      - Average of angle(X,gravityMean) or column no 559
74) 	angleY-gravityMean				                      - Average of angle(Y,gravityMean) or column no 560
75)	  angleZ-gravityMean				                      - Average of angle(Z,gravityMean) or column no 561
     
So the entire output dataset is written as a file titled "AverageByActivityForSubject.txt". It consists of 75 variables and 180(30 subjects each with 6y actions) rows.

Data Transformation steps
-------------------------
1. The data file is downloaded to a sub-dir called data that is created in the directory containing the "run_analysis.R" file. It is assumed that prior to executing, the working directory to set to this folder containing the "run_analysis.R" file.
	Note: If the program is rerun it will again download the file and unzip it overwriting the earlier files if they are present.
2. The data file is unzipped into the root folder of the executable, thereby creating a sub-folder called "UCI HAR Dataset". Further under this sub-folder are the main data sub-folders of "test\" and "train\" containing the test and training data respectively. The "UCI HAR Dataset\" folder contains the meta data files - "features.txt" and "activity_labels.txt".
	
	The code that accomplishes steps 1 and 2 are:
	## check to see if a data sub-dir exists. If not create it
	if (!file.exists("./data")) {dir.create("./data")}


	## download the zip file and unzip the files into the data sub-dir
	fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(fileurl,destfile="./data/Dataset.zip")
	unzip("./data/Dataset.zip",overwrite = TRUE)

3. The respective training and test data is read in to datasets using the read table command as follows. 
	
	measurestrain <- read.table("./UCI HAR Dataset/train/X_train.txt",header = FALSE)
	actionstrain <- read.table("./UCI HAR Dataset/train/y_train.txt",header = FALSE)
	subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",header = FALSE)

	measurestest <- read.table("./UCI HAR Dataset/test/X_test.txt",header = FALSE)
	actionstest <- read.table("./UCI HAR Dataset/test/y_test.txt",header = FALSE)
	subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt",header = FALSE)

	THe variables used to maintain the various data elements are as follows:
	measures.. -> contains the various variables measured.
	actions.. -> contains the actions performed during the measurement -> relates to one of the 6 actions.
	subject.. -> contains the data of the participants or subjects that volunteered for the experiments.

4. The training and the test data are merged into one data set as follows:
	## Merge the training and test datasets together
	measures <- bind_rows(measurestrain,measurestest)
	actions <- bind_rows(actionstrain,actionstest)
	subject <- bind_rows(subjecttrain,subjecttest)

5. To identify only the mean and standard deviation measurements for each measurement, the following steps are performed.
	a. First the file containing the labels i.e features.txt is loaded in from the "UCI HAR Dataset" sub-dir as follows.
		features <- read.table("./UCI HAR Dataset/features.txt")
	b. A subsetting vector is created from the read in data of features so that it would only contain measurements for mean and standard deviation. 
		- The logic used for determining the standard deviation measurements is that the word "std" or "Std" is present.
		- The logic used for determining the mean measurements are that the word "mean(" is present. Because there are some measurements 
        like angle(tBodyAccMean,gravity) that indicates the mean of angle emasurements, an additional string match is performed for 
        "Mean" (capital M).
		
		The code that accomplishes this is:
		## read in the features.txt file
		features <- read.table("./UCI HAR Dataset/features.txt")
		indexvalues <- grep("mean\\(|Mean|[Ss]td",features$V2)
	c. Now using the subsetting vector we read in the corresponding columns from the measures data frame using:
		measures <- measures[,indexvalues]

6. To ensure that descriptive activity names are used, we read in the activity_labels.txt file found in the "UC HAR Dataset" sub-directory. This file contains 2 columns. The first is the activityid and the second is the activity descriptive name. We match the id with the contents in the activity data frame and replace them with the matching descriptive names. The code used for accomplishing these tasks are:
	
	## Now read the activities text file
	activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

	## change the values in actions to the coressponding names given in the activity file
	actions[,1] <- activities[actions[,1], 2]
	
7. To make the labels of the final data set descriptive we perform the following actions"
	a. To make the label for the activities as "Activity" we simply code the label name as ACtivity using the floowing code:
		names(actions) <- "Activity" 
	b. Similarly to make the label for the Subject descriptive we just label it as such using the code:
		names(subject) <- "Subject"
	c. To ensure that the labels for the activities are descriptive we get the labels for the variables selected from the activities file 
    using the same subsetting vector we had created in step 5.b above.
		## Create the labels for the header
		labelmeasures <- features[indexvalues,2]
	
	The issue with these labels are that some of them contain brackets"(",")", or "," like in "angle(X,gravityMean)". To eliminate the 
  braces with a empty string and the comma with a "-" usign the code below:
		## Ensure that in the header names we are replacing the "()" , "(" and ")"
		labelmeasures <- str_replace_all(labelmeasures,"\\(\\)|\\(|\\)","")
		## Some of the labels have "," so replace them with "-"
		labelmeasures <- str_replace_all(labelmeasures,"\\,","-")

	Further since there are some acronyms in the labels like Acc-> Acceloerometer and MAg-> Magnitude, we expand these accronyms. Also 
  some labels chosen have a repeat of the word "body" as "bodybody". This gets changed to "body". The code that accomplishes this is:
		## Also ensure that we expand on some of the common labels
		## like Acc -> Aceelerator and Mag -> Magnitude
		labelmeasures <- str_replace_all(labelmeasures,"Acc","Accelerometer")
		labelmeasures <- str_replace_all(labelmeasures,"Mag","Magnitude")
		## Noticed that in some labels we have the word BodyBody. Replacing these with Body
		labelmeasures <- str_replace_all(labelmeasures,"BodyBody","Body")

	Now using the fixed vector we create the labels for the measures using the code:
		names(measures) <- labelmeasures

	Finally the variables that have names starting with t for "time" and f for "frequency" are expanded as follows:
		## Now make the column namesof the measures dataset the string with the descriptive names

		## Further to make the column names more descriptive wanted to expand the t and f at the beginning
		## of the names to Time and Frequence respectively
		names(measures) <- gsub("^t","Time",names(measures))
		names(measures) <- gsub("^f","Frequency",names(measures))
	d. After making the labels of the variables descriptive we create a tidydataset using:
		## create the complete tidy data set by column binding the 3 data sets
		tidydataset <- cbind(subject,actions,measures)

8. From the dataset above we create a second independent tidy data set with the average of each activity and each subject by using 
  applying the function mean on all columns except the columns "Subject" and"Activity" which are the group by columns. In order to  
  perform this task the special notation .SD is used.

		## second dataset with the average of each variable for each activity and each subject
		## Note: I am making use of the .SD to tell lapply that I mean all columns other than the group by columns.
		tidygroupbyset <- tidydataset[, lapply(.SD, mean), by = 'Subject,Activity']

9. From this second tidy data set a text file called "AverageByActivityForSubject.txt" is created in the directory contining the script file using:
	write.table(tidygroupbyset, file = "AverageByActivityForSubject.txt", row.names = FALSE)
	
	The text file created is made to be part of this dataset and is contained in the repository containing the script file, the Readme.md and this codebook.md.

Note: The program when executed does create some messages in the console. The intention of these messages is to make it easier for execution. 
