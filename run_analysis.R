run_analysis <- function() {
  
  #read the test and training data
  xtest<-read.table("X_test.txt")
  xtrain<-read.table("X_train.txt")
  features<-read.table("features.txt")
  names(xtest) <- features[,2]
  names(xtrain) <- features[,2]
  
  #read the subject
  testsubject<-read.table("subject_test.txt")
  names(testsubject) <- c("subject")
  trainsubject<-read.table("subject_train.txt")
  names(trainsubject) <- c("subject")
  
  #merge the subject
  xtest <- cbind(testsubject, xtest)
  xtrain <- cbind(trainsubject, xtrain)

  #read the activity
  ytest<-read.table("y_test.txt")
  names(ytest) <- c("activity")
  ytrain<-read.table("y_train.txt")
  names(ytrain) <- c("activity")

  #merge the activity
  xtest <- cbind(ytest, xtest)
  xtrain <- cbind(ytrain, xtrain)
  
  #consolidate test and training data
  con <- rbind(xtest, xtrain)
  
  #remove the mean and std cols
  con <- con[, c(TRUE, TRUE, grepl("mean\\(\\)|std\\(\\)", features[,2]))]
  
  #read the activity names
  alabels<-read.table("activity_labels.txt")
  names(alabels) <- c("activity", "activity_name")
  
  #add activity column
  con <- merge(alabels, con, by="activity")
  
  dtCon <- data.table(con)
  setkey(dtCon, "activity", "activity_name", "subject")
  
  #take mean for each column
  #t<- by(con, con[,c("subject","activity")], colMeans)
  
  temp <- aggregate(dtCon, list(subject = dtCon$subject, activity = dtCon$activity_name),mean)
  
  dtTidy <- dtCon[, list(count = .N, average = lapply(dtCon,mean)), by = key(dtCon)]
  
  #write.table(as.matrix(dtTidy), "data.txt", row.names=FALSE)
}
