---
title: "README"
author: "Giovanni Picardi"
date: "21 ottobre 2015"
output: pdf_document
---

# The run_analysis.R script
The run_analysis.R script in this repo, creates the datasets required in the Course Project of the course "Getting and Cleaning Data", part of the "Data Science Specialization" offered by the Johns Hopkins University on the Coursera MOOC platform.

## Input data

The script operates on the dataset described at  

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>  

and more precisely on a copy of such dataset available at  

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.

If the current working directory when the script is launched does not contain

* either a zipfile named _getdata-projectfiles-UCI HAR Dataset.zip_
* or a directory named _UCI HAR Dataset_ holding the unzipped contents of such file

the dataset is automatically downloaded and unzipped in the current working directory.

Otherwise the script unzips its contents in the _UCI HAR Dataset_ directory, if not already present.

## How it works

The run_analysis.R script should be launched in the directory where the input data has been already downloaded and/or unzipped, if exists; otherwise it can be launched in whatever directory, in which the input data will be automatically downloaded and unzipped.
The script does the following.

* Reads from the file _./UCI HAR Dataset/features.txt_ the list of the features associated to each observation contained in the dataset.
* Extracts from the list the indexes and names of the features containing _"mean"_ or _"std"_ in their name: such features are means and standard deviations of raw measurements collected from the accelerometers of the smartphones used in the experiment described in <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.
* Reads from the files *./test/X_test.txt* and *./train/X_train.txt* the features of the observations in the training and test sets provided in the dataset.
* Extracts only the columns containing means and standard deviations of raw measurements, identified by previously found indexes, labelled with the corresponding feature names.
* Merges the resulting data in a single dataframe _data_.
* Reads from the file *./UCI HAR Dataset/activity_labels.txt* the list of the activities of the subjects monitored during the experiment, together with the corresponding IDs.
* Reads from the files *./test/y_test.txt* and *./train/y_train.txt* the IDs of the activities corresponding to the observations in the training and test sets.
* Merges the IDs of the activities in a single set, converts the IDs into names of activities (as factor) and adds a column "Activity" to the dataframe _data_.
* Reads from the files *./test/subject_test.txt* and *./train/subject_train.txt* the IDs of the subjects corresponding to the observations in the training and test sets, merges the IDs in a single set, converts the IDs into factors and adds a column "Subject" to the dataframe _data_.
* Creates a second dataframe _avgdata_ reshaping (melting and casting) _data_ in order to obtain a single row for each [Activity, Subject] couple and to have data columns holding the average (mean) of the corresponding features as indicated in the prefix "Average_" applied to the column name.
* Writes _avgdata_ in the file _avgdata.txt_ in the current working directory.

## Output

The output of the script is the file _avgdata.txt_ in the current working directory, containing average features (means and standard deviations of raw measurements collected from the accelerometers of the smartphones) for each physical activity and for each subject monitored in the experiment described in <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> (indeed for each copuple [activity, subject]).

If the script is launched from the R command line in the workspace will also be created:

* a dataframe _data_ with the features (means and standard deviations of raw measurements collected from the accelerometers of the smartphones) of all the observations;
* a dataframe _avgdata_ with the average features for each couple [activity, subject] (and whose content is saved in the _avgdata.txt_ file).