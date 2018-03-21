library(reshape2)
##downloading and unziping the raw data
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists("./UCI HAR Dataset.zip")) { 
      download.file(url,"./UCI HAR Dataset.zip")
}
if (!file.exists("UCI HAR Dataset")) { 
      unzip("./UCI HAR Dataset.zip",exdir = ".") 
}

## reading data
wd<-getwd()
mainpath<-paste0(wd,"/UCI HAR Dataset")
trainpath<-paste0(wd,"/UCI HAR Dataset/train")
testpath<-paste0(wd,"/UCI HAR Dataset/test")
##reading features
features<-read.table(paste0(mainpath,"/features.txt"),colClasses = "character")
activitylables<-read.table(paste0(mainpath,"/activity_labels.txt"),colClasses = "character")
##reading train data
x_train<-read.table(paste0(trainpath,"/x_train.txt"))
subject_train<-read.table(paste0(trainpath,"/subject_train.txt"))
y_train<-read.table(paste0(trainpath,"/y_train.txt"))
dim(x_train)
dim(y_train)
dim(subject_train)
##reading test data
x_test<-read.table(paste0(testpath,"/x_test.txt"))
subject_test<-read.table(paste0(testpath,"/subject_test.txt"))
y_test<-read.table(paste0(testpath,"/y_test.txt"))

## data exploration
dim(x_test)
dim(y_test)
dim(subject_test)
dim(subject_train)

str(x_train)
head(x_train)
names(x_train)
dim(x_train)

str(x_test)
head(x_test)
names(x_test)
dim(x_test)

## merging test and train to shape the main data
x_data<-rbind(x_train,x_test)
y_data <- rbind(y_train, y_test)
subject_data<- rbind(subject_train, subject_test)
## giving the tag of activity lables to the associated subject data
y_data[,2]<-activitylables[y_data[,1],2]
colnames(y_data)<-c("subject","activity")
## renaming the x_data variables
library(dplyr)
for (i in 1:ncol(x_data)) {
      names(x_data)[[i]]<-features[i,2]
}

## extracting only the mean and Stdrv
meanstd<-x_data[,grep("mean|std",names(x_data))]
dim(meanstd)
## cbind the y_data to the meanstd dataset
meanstd<-cbind(y_data,meanstd)
dim(meanstd)
##create the mean dataset
library(plyr)
averages_data<- ddply(meanstd, .(subject, activity), function(x) colMeans(x[, 3:81]))

## writing the results into csv files
write.csv(meanstd,file = "./tidy.csv")
write.csv(averages_data,file = "./average_data.csv")


