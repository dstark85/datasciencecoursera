# run_analysis.R
library(dplyr)

# 1. Merge training and test sets to create one data set.

### DO WORK
# A) Download the data to a data directory:
if(!file.exists('data')) {dir.create('data')}
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
              destfile = "./data/uci_data", method = "curl")
data_download_date <- Sys.Date()

# B) Unzip the files:
unzip('./data/uci_data', exdir = './data', junkpaths = T)

# remove the zip file:
file.remove('./data/uci_data')

# Read in the train dataset: It appears to be separated by a space, not a comma.
train_data <- read.csv('./data/X_train.txt', sep = "", header = F)
train_y_data <- read.csv('./data/y_train.txt', sep = "", colClasses = 'factor', 
                         header = F, col.names = 'activity') 
train_subjects <- read.csv('./data/subject_train.txt', sep = "", header = F, col.names = 'subject')

test_data <- read.csv('./data/X_test.txt', sep = "", header = F)
test_y_data <- read.csv('./data/y_test.txt', sep = "", colClasses = 'factor', header = F,
                        col.names = 'activity')
test_subjects <- read.csv('./data/subject_test.txt', sep = "", header = F, col.names = 'subject')

feature_names <- read.delim('./data/features.txt', sep = ' ', header = FALSE)
activity_levels <- read.csv('./data/activity_labels.txt', sep ="", header = FALSE, colClasses = 'factor',
                            col.names = c('activity_code', 'activity_description'))

# Set names of each dataset:
names(train_data) <- feature_names$V2
names(test_data) <- feature_names$V2

# To get the activity level from id:
left_join(train_y_data, activity_levels, by = c('activity' = 'activity_code'))

# Bind the train data:
train_complete <- cbind(train_data, train_y_data, train_subjects)
test_complete <- cbind(test_data, test_y_data, test_subjects)

all_data <- rbind(train_complete, test_complete)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
pattern <- '*.(mean|std)\\('
mean_std_extraction <- all_data[, grep(pattern, names(all_data))]


# 3. Use descriptive activity names to name the activities.
### Meaning 1 --> Walking, 2 --> Walking_upstairs

## all_data_descriptive <- merge(all_data, activity_levels, by.x = 'activity', by.y = 'activity_code')
## left_join(all_data, activity_levels, by = c('activity' = 'activity_code'))

activity_descriptors <- activity_levels[all_data$activity, 2]
all_data$activity <- activity_descriptors

# 4. Appropriately name the variables

# Already done:
names(all_data)

# 5. Create a summary with average of each variable and each subject.
all_data %>% 
    group_by(activity) %>% 
    