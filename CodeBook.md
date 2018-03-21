### Codebook for the data manipulation process - Getting and Cleaning Data Programming Assignment

## Variables
1. mainpath: path to the "/UCI HAR Dataset" directory inside the working directory
2. trainpath : path to the "/UCI HAR Dataset/train" directory in the working directory
3. testpath : path to the "/UCI HAR Dataset/test" directory in the working directory
4. url : path to the raw Data
5. features : cotains the data for the "/features.txt" Files
6. activitylables : contains the data from the "/activity_labels.txt" Files
7. "X_train", "y_train" , "subject_train" are downloaded from the respective files in the train folder with same names
8. "X_test", "y_test", "subject_test" are downloaded from the respective files in the test folder with same names
9. x_data : rbind of X_train and x_test
10. y_data : rbind of y_train and y_test
11. subject_data : rbind of subject_train and subject_test
12. meanstd : table contains the variables with mean|std in their names plus the subject and activity indicators
13. average_data: is an independent tidy data set with the average of each variable for each activity and each subject





## Getting and Cleaning process steps
1. downloading the raw data from the data link
2. reading features.txt and activity_labels.txt
3. reading x_train.txt and subject_train.txt and y_train.txt
4. reading x_test.txt and subject_test.txt and y_test.txt
5. data exploration on the read Data
6. rbind x_train and x_test to shape x_data
7. rbind y_train and y_test to shape y_data
8. rbind subject_train and subject_test to shape subject_data
9. Assigning the tag of activity labels to the associated subject data to the second column of y_data
10. assigning "subject" and "activity" to the column names of y_data
11. replacing the column names in x_data table with the associated name in the "features" table
12. Extracting only the columns that had "mean" or "std" in their column names from the x_data table and shaping the "meanstd" table
13. cbind the y_data to the meanstd table to shape the tidy dataset
14. write the tidy dataset to tidy.csv
15. calculate the mean of each column in the meanstd table based on subject and activity into the average_data
16. write the average_data.csv from the average_data table
