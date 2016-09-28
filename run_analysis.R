## This R program downloads a zip file containing the wearables data from 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## into a sub-dir called data. It then unzips the files into the root dir containing the program.
## It takes in the data files from the train and test sub-dir under the dir "UNC HAR Dataset"
## created by unzipping the files.

## The program creates 2 text files as output. 
## 1. WearableTidyDataSet.txt contains the mean and std variables for each subject and action.
## 2. AverageByActivityForSubject.txt contains the mean of the values in the above file for each subject and action.

## The program makes use of the data.table and dplyr packages.

## The logic used:
## The program merges the test and the training data sets and then selects those variables containing 
## the mean and standard deviation data by choosing column names with "mean" or "std" from the features.txt file.
## Using this vector the data in the merged measures data file is subsetted to get only these columns.

## For the activities the values mentioned in the data fiels are replaced by the lables found in activity_labels.txt.
## The datafiels for the subject,actions and measures are merged to creat the first data set.
## Then the mean function is applied to the above data set, with grouping by subject and activity.

## The program is designed so that you can run it repeatedly. It will reget the source file and redo its actions.
## This program also ensures that all the variables used are removed when it finishes hence leaving your worspace tidy.

## check to see if a data sub-dir exists. If not create it
if (!file.exists("./data")) {dir.create("./data")}

## load the necessary libraries
library(data.table)
library(dplyr)
library(stringr)

## download the zip file and unzip the files into the data sub-dir
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
print("Downloading the zip file...")
download.file(fileurl,destfile="./data/Dataset.zip")
print("Unzipping the downloaded file...")
unzip("./data/Dataset.zip",overwrite = TRUE)

## read in the data
print("Reading the training and test data in for processing...")
measurestrain <- read.table("./UCI HAR Dataset/train/X_train.txt",header = FALSE)
actionstrain <- read.table("./UCI HAR Dataset/train/y_train.txt",header = FALSE)
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",header = FALSE)

measurestest <- read.table("./UCI HAR Dataset/test/X_test.txt",header = FALSE)
actionstest <- read.table("./UCI HAR Dataset/test/y_test.txt",header = FALSE)
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt",header = FALSE)

features <- read.table("./UCI HAR Dataset/features.txt")

## Merge the training and test datasets together
print("Merging the training and test data...")
measures <- bind_rows(measurestrain,measurestest)
actions <- bind_rows(actionstrain,actionstest)
subject <- bind_rows(subjecttrain,subjecttest)

## remove the data frames that we do not need anymore
rm(measurestrain,measurestest,actionstrain,actionstest,subjecttrain,subjecttest)

print("Processing: Identifying and getting the columns with mean and std...")
## identify the colums for mean and std from the features
## Using the logic that the variables with mean and shown as mean(
## Also the one with std are shown as std. In addition in analysing the data it seems that the last
## 7 columns or so are also angle means and hence including them by getting the word mean with the capital M.
indexvalues <- grep("mean\\(|Mean|[Ss]td",features$V2)

## Now get only the columns with the mean and std into a new data set called measures
measures <- measures[,indexvalues]


## Create the labels for the header
labelmeasures <- features[indexvalues,2]
## Ensure that in the header names we are replacing the "()" , "(" and ")"
labelmeasures <- str_replace_all(labelmeasures,"\\(\\)|\\(|\\)","")
## Some of the labels have "," so replace them with "-"
labelmeasures <- str_replace_all(labelmeasures,"\\,","-")
## Also ensure that we expand on some of the common labels
## like Acc -> Accelerometer and Mag -> Magnitude
labelmeasures <- str_replace_all(labelmeasures,"Acc","Accelerometer")
labelmeasures <- str_replace_all(labelmeasures,"Mag","Magnitude")
## Noticed that in some labels we have the word BodyBody. Replacing these with Body
labelmeasures <- str_replace_all(labelmeasures,"BodyBody","Body")
  
## Now make the column namesof the measures dataset the string with the descriptive names
names(measures) <- labelmeasures
rm(labelmeasures)
## Further to make the column names more descriptive wanted to expand the t and f at the beginning
## of the names to Time and Frequence respectively
names(measures) <- gsub("^t","Time",names(measures))
names(measures) <- gsub("^f","Frequency",names(measures))


print("Processing: Getting the Activities column...")
## Now read the activities text file
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

## change the values in actions to the coressponding names given in the activity file
actions[,1] <- activities[actions[,1], 2]
names(actions) <- "Activity"

names(subject) <- "Subject"

## remove the helper datasets and variables
rm(features,activities,indexvalues)

print("Processing: Creating the tidy data set..." )
## create the complete tidy data set by column binding the 3 data sets
tidydataset <- cbind(subject,actions,measures)

## Remove those intermediate files 
rm(measures,actions,subject)

## Remove the vars used
rm(fileurl)

print("Writing the WearableTidyDataSet.txt...")
## create the text file for this data set
write.table(tidydataset, file = "WearableTidyDataSet.txt",row.names = FALSE)

print("Processing: Calculating the mean for each varaiable for each activity and subject...")
## Convert the data frame to a data table
tidydataset <- data.table(tidydataset)


## second dataset with the average of each variable for each activity and each subject
## Note: I am making use of the .SD to tell lapply that I mean all columns other than the group by columns.
tidygroupbyset <- tidydataset[, lapply(.SD, mean), by = 'Subject,Activity']

print("Writing the AverageActivityForSubject.txt file containing the contents of the average tidy data set.")
write.table(tidygroupbyset, file = "AverageByActivityForSubject.txt", row.names = FALSE)

rm(tidydataset,tidygroupbyset)

print("Process completed. Enjoy!!!")

