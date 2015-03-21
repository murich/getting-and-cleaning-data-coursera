# About

`run_analysis.R` prepares tidy data.
##Steps:

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