setwd("C:/Users/AlexiaLeong.ALEXIARPI/OneDrive/Documents/Data Analytics/DataAnalytics2023_ALEXIA_LEONG/lab01")
multivariate <- read.csv("../../multivariate.csv")

head(multivariate)
attach(multivariate)
help(lm)
mm <- lm(Homeowners~Immigrant)
mm
summary(mm)$coef
plot(Homeowners~Immigrant)
help(abline)
abline(mm)
abline(mm,col=2,lwd=3)
newImmigrantData <- data.frame(Immigrant = c(0,20))

library(magrittr)
mm %>% predict(newImmigrantData)
abline(mm)
abline(mm,col=3,lwd=3)
attributes(mm)
mm$coefficients

#Creating plots - ggplot
plot(mtcars$wt, mtcars$mpg)
library(ggplot2)
#qplot(mtcars$wt, mtcars$mpg)
qplot(wt,mpg,data = mtcars)
help(qplot)
ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()

plot(pressure$temperature, pressure$pressure, type = "l")
points(pressure$temperature, pressure$pressure)

lines(pressure$temperature,pressure$pressure/2, col="red")
points(pressure$temperature,pressure$pressure/2, col = "blue")

library(ggplot2)
qplot(pressure$temperature,pressure$pressure,geom="line")
qplot(temperature,pressure,data=pressure,geom = "line")
ggplot(pressure, aes(x = temperature, y = pressure)) + geom_line() + geom_point()

#Creating bar graphs
barplot(BOD$demand, names.arg = BOD$Time)
table(mtcars$cyl)
barplot(table(mtcars$cyl))
qplot(mtcars$cyl)
qplot(factor(mtcars$cyl))

#Bar graph of counts