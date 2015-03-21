## The data source

* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The data

The dataset includes the following files:

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

##Steps performed by `run_analysis.R`:

* merge data same entities data using `rbind()` function. This also possible thanks to that those datasets contains same rows count.

* Next, we extract mean and standard deviation measures from the dataset using grep by column name. After that we assign proper names to columns taken from `features.txt` using names function.

* Same about activity. Instead of 1:6 activity values, we assign the activity names by IDs from `activity_labels.txt`.

* After everything is ready, we generate a new dataset, using ddply function. The dataset contains all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file name is `averagesData.txt`.

# Variables

* `xTrain`, `yTrain`, `xTest`, `yTest`, `subjectTrain` and `subjectTest` contains the data from the downloaded files.

* `xData`, `yData` and `subjectData` merge the previous datasets.

* `features` contains the correct names for the `xData` dataset, which are stored in `meansDeviations` (numeric vector) to make it easy to extract the data we need.

* `mergedData` merges `xData`, `yData` and `subjectData` in a big dataset. Names assigned from `activities` variable.

* As a script result, `averagesData` contains the relevant averages which will be later stored in a `.txt` file. `ddply()`  is used to apply `colMeans()`, which makes development ease.