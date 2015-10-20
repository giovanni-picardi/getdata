##############################################################
# Obtain raw data from the URL specific for the Course Project
##############################################################

# Local filename of dataset
rawFilename <- "getdata-projectfiles-UCI HAR Dataset.zip"

# Download only if not already done
if (!file.exists(rawFilename) & !file.exists("UCI HAR Dataset")) {
    # URL provided for the Course Project
    rawUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

    # Other methods may be applied...
    download.file(rawUrl, destfile=rawFilename, method="wget")
    
    # Store and show download date
    downloadDate <- date()
    downloadDate

    # Output when raw date has been downloaded for the Course Project 
    ## > downloadDate
    ##
    ## [1] "Thu Oct 15 16:27:32 2015"
}

##################
# Unzip raw data #
##################

# Unzip only if not already done
if (!file.exists("UCI HAR Dataset")) {
    unzip(rawFilename)
}

########################################################
# Build tidy dataset of means and stds of measurements #
########################################################

# Enter the raw data directory
setwd("./UCI HAR Dataset")

# Read in feature list (names as strings)
features <- read.table("features.txt", col.names = c("ID","name"), as.is = TRUE)

# Row indexes of features containing "mean" or "std" in their name
ind <- grep("mean|std", features$name, value = FALSE)
## > ind
# Value of ind resulting with the raw data used for the Course Project
##  [1]   1   2   3   4   5   6  41  42  43  44  45  46  81  82  83  84  85  86 121 122 123
## [22] 124 125 126 161 162 163 164 165 166 201 202 214 215 227 228 240 241 253 254 266 267
## [43] 268 269 270 271 345 346 347 348 349 350 424 425 426 427 428 429 503 504 516 517 529
## [64] 530 542 543

# Subset features keeping only means and stds
features <- features[ind,]

# Read in measurements from test and training sets
Xtest <- read.table("./test/X_test.txt")
Xtrain <- read.table("./train/X_train.txt")

# Subset measurements extracting columns corresponding to means and stds
Xtest <- Xtest[,ind]
Xtrain <- Xtrain[,ind]

# Merge means and stds from test and training sets
data <- rbind(Xtest, Xtrain)

# Apply appropriate column names to data
colnames(data) <- features$name

# Read in activity list (labels as factor)
activities <- read.table("activity_labels.txt", col.names = c("ID","name"))

# Read in activity IDs from test and training sets
ytest <- read.table("./test/y_test.txt")
ytrain <- read.table("./train/y_train.txt")

# Merge activity IDs from test and training sets
y <- rbind(ytest, ytrain)

# Convert activity IDs into labels (as factor) and add "Activity" column to data
data$Activity <- activities[as.matrix(y), "name"]

# Read in subject IDs from test and training sets
subjtest <- read.table("./test/subject_test.txt")
subjtrain <- read.table("./train/subject_train.txt")

# Merge subject IDs from test and training sets
subj <- rbind(subjtest, subjtrain)

# Add "Subject" column to data (subject IDs as factors)
data$Subject <- as.factor(data.matrix(subj))

# Melt and cast data in order to store in avgdata the means of features for each
# couple of Activity and Subject
library(reshape2)
avgdata <- melt(data, id=c("Activity","Subject"), measure.vars=(names(data)[1:79]))
avgdata <- dcast(avgdata, Activity + Subject ~ variable, mean)

# Apply prefix "Average_" to average measurements columns of avgdata
names(avgdata)[3:81] <- paste0("Average_", names(avgdata)[3:81])

# Clean unnecessary objects and move up in the directory tree
rm(list = c("features", "Xtest", "Xtrain", "ytest", "ytrain", "y", "activities",
            "subjtest", "subjtrain", "subj"))
setwd("..")

# Write avgdata as a text file
write.table(avgdata, file="avgdata.txt", row.names = FALSE)