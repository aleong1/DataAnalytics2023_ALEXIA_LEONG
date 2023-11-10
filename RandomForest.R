install.packages("randomForest")
library(randomForest)

data1 <- read.csv(file.choose(), header = TRUE)   #read car.data
head(data1)

colnames(data1) <- c("BuyingPrice", "Maintenance", "NumDoors", 
                     "NumPersons", "BootSpace", "Safety", "Condition")

head(data1)
str(data1)

levels(data1$Condition)
summary(data1)
