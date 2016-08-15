
## Read outcome data
#install.packages("dplyr","tidyr")

setwd("/Users/daniel/Desktop/UCI\ HAR\ Dataset/")
library(plyr)
library(dplyr)
library(tidyr)
library(reshape2)
library(data.table)

## Start data prep, load into memory
aLabel <- read.table("activity_labels.txt",quote="\"", stringsAsFactors=FALSE) 
features <- read.table("features.txt", quote="\"", stringsAsFactors=FALSE)
Xtrain <- read.table("train/X_train.txt", quote="\"", stringsAsFactors=FALSE)
Ytrain <- read.table("train/y_train.txt", quote="\"", stringsAsFactors=FALSE)
Xtest <- read.table("test/X_test.txt", quote="\"", stringsAsFactors=FALSE)
Ytest <- read.table("test/y_test.txt", quote="\"", stringsAsFactors=FALSE)

#Merges the training and the test sets to create one data set.
XTotal <- bind_rows(Xtrain, Xtest)
YTotal <- bind_rows(Ytrain, Ytest)
#Set the headers in the merged data set
names(XTotal) = features$V2
View(XTotal)
View(YTotal)
s3 <- join(YTotal, aLabel)
View(s3)
entireSet <- merge(s3, XTotal, by="row.names", all.x=TRUE)
View(entireSet)
#Merge the  activities to get their descriptions
setnames(entireSet, old = 'V2', new = 'Action')
#extract only the mean and the std()
reducedSet <-entireSet[ , grepl( "mean|std" , names( entireSet ) ) ]
View(reducedSet)
#write the clean data file
write.csv(reducedSet, file = "FinalSet.csv")
write.table(reducedSet, 'tidy.txt', row.names=FALSE)

