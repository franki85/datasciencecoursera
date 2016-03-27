#Code Book

This code book will describe the data used in this project, as well as the processing required to create the resulting tidy data set.

##Overview

30 volunteers performed 6 different activities while wearing a smartphone. The smartphone captured various data about their movements.

##Explanation of data

- features.txt: Names of the 561 features.
- activity_labels.txt: Names and IDs for each of the 6 activities.
- x_train.txt: 7352 observations of the 561 features, for 21 of the 30 volunteers.
- subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.
- y_train.txt: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.
- x_test.txt: 2947 observations of the 561 features, for 9 of the 30 volunteers.
- subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.
- y_test.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.

More information about the files is available in README.txt. More information about the features is available in features_info.txt.

##Data files that were not used

The only used files are those listed above. We did not use the raw signal data. Therefore, the data files in the "Inertial Signals" folders were ignored.

##Processing steps

1. All of the relevant data files were read and the training and test sets were combined into a single data set.
2. Extract the mean and standard deviation column names and data
3. Process the data. There are two parts processing test and train data respectively.
4. Uses descriptive activity names to name the activities in the data set
5. A tidy data set was created containing the mean of each feature for each subject and each activity.
6. The tidy data set was output to a CSV file.
