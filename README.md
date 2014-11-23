Getting and Cleaning Data
=====================================


Parameters
----------
Make sure the inout data files are in the same directory as this file

Steps to reproduce this project
-------------------------------
1. Open file `run_analysis.R`
2. Run the script `run_analysis.R`. 

Algorithm
-------------------------------
1. Read the test and training data
2. Read the subject
3. Merge the subject with test and training data
4. Read the activity data
5. Merge the activity data with test and training data
6. Consolidate test and training data
7. Remove the mean and std cols
8. Read the activity names
9. Add the activity name coulmn 
10. Take mean for each column


Output
----------------
* Returns back a tidy data set

