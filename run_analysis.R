#Create and place all necessary files in the directory GCD

baseDir<-getwd()
dir.create("GCD")
dataDir<-paste(getwd(),"GCD",sep="/")

setwd("getdata_projectfiles_UCI HAR Dataset" )
setwd("UCI HAR Dataset")
title<-paste(getwd(),"features.txt",sep="/")

setwd("test")
testfile<-paste(getwd(),list.files()[3],sep="/")
testlabels<-paste(getwd(),list.files()[4],sep="/")
testSubject<-paste(getwd(),list.files()[2],sep="/")

setwd("../")
setwd("train")
trainfile<-paste(getwd(),list.files()[3],sep="/")
trainlabels<-paste(getwd(),list.files()[4],sep="/")
trainSubject<-paste(getwd(),list.files()[2],sep="/")

file.copy(testfile,dataDir)
file.copy(trainfile,dataDir)
file.copy(title,dataDir)
file.copy(testlabels,dataDir)
file.copy(trainlabels,dataDir)
file.copy(testSubject,dataDir)
file.copy(trainSubject,dataDir)
setwd(dataDir)

# read in, title and merge the test and train data

Xtest<-read.table("X_test.txt")
Xtrain<-read.table("X_train.txt")
features<-read.table("features.txt")
Xtestlabels<-read.table("y_test.txt")
Xtrainlabels<-read.table("y_train.txt")
testSubject<-read.table("subject_test.txt")
trainSubject<-read.table("subject_train.txt")

XtestWA<-cbind(testSubject,Xtestlabels,Xtest)
XtrainWA<-cbind(trainSubject,Xtrainlabels,Xtrain)

names(XtestWA)<-c("Subject","Activity",as.character(features[,2]))
names(XtrainWA)<-c("Subject","Activity",as.character(features[,2]))

Xmerged<-rbind(XtrainWA,XtestWA)

#Extract only measurements on the mean and std

featuresVector<-features[,2]
featuresVectorChar<-as.character(featuresVector) 
featuresSelectTF<-grepl("mean()",features[,2],fixed="TRUE") |  grepl("std()",features[,2],fixed="TRUE")
ExtractXmerged<-Xmerged[,featuresSelectTF]

tempData<-c()

for(i in 1:6){
for(j in 1:30){
    activity<-ExtractXmerged$Activity==i
    subject<-ExtractXmerged$Subject==j
    Cmeans<-sapply(ExtractXmerged[subject & activity,3:68],mean)
    tempData<-rbind(tempData,Cmeans)
  }
}
rowIndex=1:180
newIndex<-c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
activityIndex=rep(1:6,each=30)
subject_id=rep(1:30,6)
activityNames<-c(rep(newIndex[1],30),rep(newIndex[2],30),
                 rep(newIndex[3],30),rep(newIndex[4],30),
                 rep(newIndex[5],30),rep(newIndex[6],30))
ultData1<-cbind(activityIndex,activityNames,subject_id)
ultData<-cbind(ultData1,tempData)
rownames(ultData)<-rowIndex
write.table(UltData, "mydata.txt") 
