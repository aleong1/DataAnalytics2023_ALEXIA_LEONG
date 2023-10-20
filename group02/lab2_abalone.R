setwd("C:/Users/AlexiaLeong.ALEXIARPI/OneDrive/Documents/Data Analytics/DataAnalytics2023_ALEXIA_LEONG/lab03")

library(class)

# read data in
aba<-read.csv("../../abalone.csv")
View(aba)
aba <- aba[which(aba$Length > 0 & aba$Diameter > 0 & aba$Height > 0 & aba$Whole.weight > 0 & aba$Shucked.weight > 0 & aba$Viscera.weight > 0 & aba$Shell.weight > 0),]
order <- c("M","F","I")
aba$Sex <- match(aba$Sex, order)


naba<-dim(aba)[1]
#90% to train
sampling.rate=0.9
#remainder to test
num.test.set.labels=naba*(1.-sampling.rate)
#construct a random set of training indices (training)
training <-sample(1:naba,sampling.rate*naba, replace=FALSE)
#build the training set (train)
train<-subset(aba[training,],select=c(Sex,Length,Diameter,Height,Whole.weight,Shucked.weight,Viscera.weight,Shell.weight))
#construct the remaining test indices (testing)
testing<-setdiff(1:naba,training)
#define the test set
test<-subset(aba[testing,],select=c(Sex,Length,Diameter,Height,Whole.weight,Shucked.weight,Viscera.weight,Shell.weight))
#construct labels for another variable (Rings) in the training set
crings<-aba$Rings[training]
#construct true labels the other variable in the test set
true.labels<-aba$Rings[testing]
#run the classifier, can change k

classif<-knn(train,test,crings,k=5)
#view the classifier
classif
#looks at attributes
attributes(.Last.value)

#now do bayes.
library("e1071")
classifier<-naiveBayes(aba[,1:8], aba[,9])
table(predict(classifier, aba[,-9]), aba[,9],
      dnn=list('predicted','actual'))
