# Project-UCI-HAR

The purpose of the program is the read data from the Human Activity Recognition using Smartphones study and to output a single dataset including the required measures / features which also complies with Tidy Data principles.  

### Step 0. Read all data into R
The following training datasets are read into R:
* Main training dataset
* Subject labels
* Activity lables
* Feature / measure labels

A new data frame is created based on the Main training dataset. Column names are added using the feature labels. The activity labes and Subject labels are added as new columns to the data frame.

The above process is repeated for the test data

### Step 1. 
The training and the test data frames generated from Step 0 are merged (or stacked) using 'rbind' to create a larger data frame with the same number of columns.

### Step 2.
Generate a reduced data frame that includes only the measurements on the mean and standard deviation for each measurement.
This is achieved by defining a new vector of the numbers of the columns required to be retained, and then generating a new tables which subsets the data table on these columns.

### Step 3. 
Use descriptive activity names to name the activities in the data set
A new data frame is defined which includes the activity lables 1 to 6 and text desciptions. This new data frame is merged which the frame from the previous step.

### Step 4. 
Appropriately labels the data set with descriptive variable names. 
This was achieved in Step 0 by naming the columns using the "features.txt" file. Further details in the codebook.

### Step 5. 
From this data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The dataset is aggregated using the reshape2 package by taking the mean across all measures and grouping the data by subject and activity type. The resultant dataset is a 'wide' form and meets all tidy data principles. The dataset is then output as tab delimited text file for submission.
















