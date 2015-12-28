
# Read features
features <- read.table("data/features.txt", header = FALSE, stringsAsFactors = FALSE)
features <- features[,2]

# Get positions for mean and standard deviation features
meanAndStdInd <- grep(pattern = "mean|std", x = features, ignore.case = FALSE)

# Read training data
trainData <- read.table("data/train/X_train.txt", header = FALSE, dec = ".", col.names = features)

# Extract mean and standard deviation measurements
trainData <- trainData[,meanAndStdInd]

# Read training labels
trainLabels <- read.table("data/train/y_train.txt", header = FALSE)
names(trainLabels)[1] <- "label"

# Read training subjects
trainSubjects <- read.table("data/train/subject_train.txt", header = FALSE)
names(trainSubjects)[1] <- "subject"

# Add labels and subjects to the training data set
trainData <- cbind(trainData, trainLabels, trainSubjects)

# Read testing data
testData <- read.table("data/test/X_test.txt", header = FALSE, dec = ".", col.names = features)

# Extract mean and standard deviation measurements
testData <- testData[,meanAndStdInd]

# Read testing labels
testLabels <- read.table("data/test/y_test.txt", header = FALSE)
names(testLabels)[1] <- "label"

# Read testing subjects
testSubjects <- read.table("data/test/subject_test.txt", header = FALSE)
names(testSubjects)[1] <- "subject"

# Add labels and subjects to the testing data set
testData <- cbind(testData, testLabels, testSubjects)

# Combine training data and test data
data <- rbind(trainData, testData)

# Read activity names
activities <- read.table("data/activity_labels.txt", header = FALSE)
names(activities)[1] <- "label"
names(activities)[2] <- "activity_name"

# Join data with activity names
data <- merge(data, activities, by = "label")
