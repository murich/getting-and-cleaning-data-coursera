library(plyr)
#setwd('/Users/andriimurashkin/data_science/getting_cleaning_data/capstone/')
# Part 1. Load all data
xTest <- read.table('data/test/X_test.txt')
yTest <- read.table('data/test/y_test.txt')
subjectTest <- read.table('data/test/subject_test.txt')

xTrain <- read.table('data/train/X_train.txt')
yTrain <- read.table('data/train/y_train.txt')
subjectTrain <- read.table('data/train/subject_train.txt')

features <- read.table('data/features.txt')
activities <- read.table('data/activity_labels.txt')

#Merge it 
xData = rbind(xTest, xTrain)
yData = rbind(yTest, yTrain)
subjectData <- rbind(subjectTrain, subjectTest)

# Part 2
#Extract means and deviations using grep
meansDeviations = grep("-(mean\\(\\)|std\\(\\))",features[, 2])
# remove values we dont need from xData
xData = xData[, meansDeviations]
# add column names to xData
names(xData) <- features[meansDeviations, 2]

# Part 3. Descriptive activity names
yData[, 1] <- activities[yData[, 1], 2]
# correct column name
names(yData) <- "activity"

# Part 4. Appropriately label the data set... 
names(subjectData) <- "subject"

yData[, 1] <- activities[yData[, 1], 2]
names(yData) <- 'activity'

# bind all the data in a single data set
mergedData <- cbind(xData, yData, subjectData)

# Step 5
# Create a second, independent tidy data set with the average of each variable for each activity and each subject

# 66 <- 68 according to colums schema
averagesData <- ddply(mergedData, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averagesData, 'averagesData.txt', row.name=FALSE)