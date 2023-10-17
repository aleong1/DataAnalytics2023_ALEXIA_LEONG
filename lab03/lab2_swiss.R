data(swiss)
View(swiss[2])
sclass <- kmeans(swiss[1:6], 3) 
table(sclass$cluster, swiss[,1])    
# 
library(e1071)
m <- naiveBayes(swiss[1:6], swiss[,6])    
table(predict(m, swiss[,-6]))

