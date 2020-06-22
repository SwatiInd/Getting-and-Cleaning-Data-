# seting the working directory
# setwd("C:/Users/Swati Gupta/Documents/Online_Courses/Data Analysis R Foundations/getting and cleaning data/assignment/UCI HAR Dataset")
library(dplyr)
library(plyr)

# # variable names and data of test subjects.
name <- read.table("features.txt")
test_set <- read.table("./test/X_test.txt", col.names = name$V2)
train_set <- read.table("./train/X_train.txt", col.names = name$V2)

## id and activity values of test and training data
test_id <- read.table("./test/subject_test.txt", col.names = "id")
test_label <- read.table("./test/y_test.txt", col.names = "activity")
train_id <- read.table("./train/subject_train.txt", col.names="id")
train_label <- read.table("./train/y_train.txt",col.names = "activity")

## combining activity and set values with id of subjects
test <- cbind(test_id, test_label, test_set)
train <- cbind(train_id,train_label,train_set)

## merging training and test sets to create one_data (including id and activity details)
one_data <- rbind(test,train)

## extracting only mean and std data from one_data and store in selected_data
selected_data <- one_data %>%
    select(id, activity, contains(c("mean","std"), ignore.case = FALSE)) %>%
    select(-contains("meanFreq"))

#renaming the activity in the data set
selected_data <- selected_data %>%
  mutate(activity = revalue(as.character(activity),
c("1"="WALK","2"="WALK_UP","3"="WALK_DOWN", "4"= "SIT", "5" = "STAND", "6"= "LAY"))) %>%
  arrange(id, activity)



# Descriptive variable names
name_var <- strsplit(names(selected_data), "\\.") %>%
        sapply(function(a) {a <- a[!a ==""];  a <- paste(a, collapse = "-")})
name_var <- strsplit(name_var, "(?<=.)(?=[[:upper:]])", perl=TRUE) %>%
                  sapply(function(x) x <- paste(x, collapse = "-"))
name_var <- strsplit(name_var, "--") %>%
      sapply(function(a) {a <- paste(a, collapse = "-")})

names(selected_data) <- name_var

# Average of variables for each activity and each subject
mean_activity <- selected_data %>% group_by(id, activity) %>%
        summarise_all(~ mean(.x, na.rm = TRUE))
write.table(colnames(mean_activity), file = "Activity_mean_variable.txt",row.name=TRUE, col.names = FALSE, quote = FALSE)
write.table(mean_activity, file = "Activity_mean.txt",row.name=FALSE)




