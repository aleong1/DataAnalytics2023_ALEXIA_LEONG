library(XLS)
library(readxl)
#EPI_data <- read.csv("../2010EPI_data.csv")

#or
EPI_data <- read_excel("../2010EPI_data.xls", sheet = "EPI2010_onlyEPIcountries")
# Note: replace default data frame name – cannot start with numbers!
names(EPI_data) <- as.matrix(EPI_data[1, ])
EPI_data <- EPI_data[-1, ]
EPI_data[] <- lapply(EPI_data, function(x)
  type.convert(as.character(x)))
EPI_data
View(EPI_data)
#
attach(EPI_data) 	# sets the ‘default’ object
fix(EPI_data) 	# launches a simple data editor
EPI 			# prints out values EPI_data$EPI
tf <- is.na(EPI) # records True values if the value is NA
E <- EPI[!tf] # filters out NA values, new array

#other data
GRUMP_data <- read.csv("../GPW3_GRUMP_SummaryInformation_2010.csv")

summary(EPI)
fivenum(EPI,na.rm=TRUE)
stem(EPI)
hist(EPI)
hist(EPI, seq(30., 95., 1.0), prob=TRUE)
lines(density(EPI,na.rm=TRUE,bw="SJ")) # or try bw=“SJ”
rug(EPI)
