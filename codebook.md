 The executable is run_analysis.R
 You will have to download the data folder in this project
 you will have to set your working directory to the root of the data folder("UCI HAR Dataset")
 once that is complete you can execute the full script and it will  merge the data files together in memory, 
 strip the non pertinent information and produce the clean data file chich is called Final.csv

The script functions as follows
* Start data prep, load into memory all the necessary files

* Merges the training and the test sets to create one data set.

* Set the headers in the merged data set

* Merge the  activities to get their descriptions
* extract only the mean and the std()
* write the clean data file
