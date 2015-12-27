
# 0a. Read variable lables data into R

features <- read.table(
    file= ".\\Getting Data\\UCI HAR Dataset\\features.txt",
    header = FALSE)


# 0b. Read Train data into R

train_in <- read.table(
    file= ".\\Getting Data\\UCI HAR Dataset\\train\\X_train.txt",
    header = FALSE)

ltrain_in <- read.table(
    file= ".\\Getting Data\\UCI HAR Dataset\\train\\Y_train.txt",
    header = FALSE)

strain_in <- read.table(
    file= ".\\Getting Data\\UCI HAR Dataset\\train\\subject_train.txt",
    header = FALSE)

colnames(train_in) <- features[,2]

n1 <- nrow(train_in)
subtype <- rep("Train", n1)

train_in$subtype <- subtype

train_in$labels <- ltrain_in[,1]

train_in$subject <- strain_in[,1]

head(train_in)
tail(train_in)


# 0c. Read test data into R

test_in <- read.table(
    file= ".\\Getting Data\\UCI HAR Dataset\\test\\X_test.txt",
    header = FALSE)

ltest_in <- read.table(
    file= ".\\Getting Data\\UCI HAR Dataset\\test\\Y_test.txt",
    header = FALSE)

stest_in <- read.table(
    file= ".\\Getting Data\\UCI HAR Dataset\\test\\subject_test.txt",
    header = FALSE)

colnames(test_in) <- features[,2]

n1 <- nrow(test_in)
subtype <- rep("test", n1)

test_in$subtype <- subtype

test_in$labels <- ltest_in[,1]

test_in$subject <- stest_in[,1]

head(test_in,4)
tail(test_in,4)



# 1. Merges the training and the test sets to create one data set.


merged <- rbind(train_in, test_in)

head(merged)

tail(merged, 3)


# 2. Extracts only the measurements on the mean and standard deviation 
# for each measurement. 

#Define vector of relevant columns numbers
measures <- c(
1,	2,	3,	4,	5,	6,	41,	42,	43,	44,	45,	46,	81,	82,	83,	84,	85,	86,	121,
122,	123,	124,	125,	126,	161,	162,	163,	164,	165,
166,	201,	202,	214,	215,	227,	228,	240,	241,	253,
254,	266,	267,	268,	269,	270,	271,	345,	346,	347,
348,	349,	350,	424,	425,	426,	427,	428,	429,	503,
504,	516,	517,	529,	530,	542,	543,	555,	556,	557,
558,	559,	560,	561,562,563,564
)
measures

# new merged dataset with only relevant columns
merged2 <- merged[,measures]


head(merged2)



# 3. Uses descriptive activity names to name the activities in the data set

library(plyr)

act_labels <- data.frame(
    labels = 1:6, activity = c(
        "WALKING",
        "WALKING_UPSTAIRS",
        "WALKING_DOWNSTAIRS",
        "SITTING",
        "STANDING",
        "LAYING"
        )
    )

merged3 <- arrange(join(merged2,act_labels),labels)

head(merged3)
tail(merged3)


# 4. Appropriately labels the data set with descriptive variable names. 


# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

library(reshape2)

measure_cols <- features[measures[1:73],2]

melt1 <- melt(merged3,id=c("activity","subject"),measure.vars=measure_cols)
head(melt1)
tail(melt1)

dim(melt1)
dim(merged3)

tidy <- dcast(melt1, activity + subject ~ variable,  fun.aggregate = mean)


head(tidy,3)
tail(tidy,3)

dim(tidy)

# Please upload the tidy data set created in step 5 of the instructions. Please
# upload your data set as a txt file created with write.table() using 
# row.name=FALSE (do not cut and paste a dataset directly into the text box, as 
# this may cause errors saving your submission).

write.table(
    tidy, 
    file= ".\\Getting Data\\UCI HAR Dataset\\tidy_out.txt",
    row.names = FALSE,
    sep = "\t"
            )





