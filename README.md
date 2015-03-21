Course Project - Getting and Cleaning Data
==========================================
Here you can find К code and docs for the Course Project for the Data Science's track course "Getting and Cleaning data", which I am taking at coursera.org

The code designed for following dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Files

`run_analysis.R` contains code which will make tidy data dataset and store it to averagesData.txt
Before running the file, you need to install plyr. Use following command:
`install.packages("plyr")`

`CodeBook.md` describes the data and it’s transformations on the way to tidy data.

`averagesData.txt` contains output tidy data.


The output file name is `averagesData.txt`.

## How to run: 

Download data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and unzip it. Rename unzipped directory to `data`

`run_analysis.R` is ready to run now.