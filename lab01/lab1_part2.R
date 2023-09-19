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

qplot(factor(cyl), data = mtcars)
ggplot(mtcars,aes(x=factor(cyl))) + geom_bar()

#Creating histograms
hist(mtcars$mpg)
hist(mtcars$mpg, breaks = 10)
hist(mtcars$mpg, breaks = 5)
hist(mtcars$mpg, breaks = 12)
qplot(mpg, data = mtcars, binwidth = 4)
ggplot(mtcars,aes(x=mpg)) + geom_histogram(binwidth = 4)
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth = 5)

#Creating box plot
plot(ToothGrowth$supp, ToothGrowth$len)
boxplot(len ~ supp, data = ToothGrowth)
boxplot(len ~ supp + dose, data = ToothGrowth)
qplot(ToothGrowth$supp, ToothGrowth$len, geom = "boxplot")
qplot(supp, len, data = ToothGrowth, geom = "boxplot")
ggplot(ToothGrowth, aes(x=supp, y=len)) + geom_boxplot()
qplot(interaction(ToothGrowth$supp, ToothGrowth$dose), ToothGrowth$len, geom = "boxplot")
qplot(interaction(supp,dose), len, data = ToothGrowth, geom = "boxplot")
ggplot(ToothGrowth, aes(x = interaction(supp, dose), y = len)) + geom_boxplot()


# ggplot exercise
df <- data.frame(
  gp = factor(rep(letters[1:3], each = 10)),
  y = rnorm(30)
)
ds <- plyr::ddply(df, "gp", plyr::summarise, mean = mean(y), sd = sd(y))

ggplot(df, aes(gp, y)) +
  geom_point() +
  geom_point(data = ds, aes(y = mean), colour = 'red', size = 3)

ggplot(df) +
  geom_point(aes(gp, y)) +
  geom_point(data = ds, aes(gp, mean), colour = 'red', size = 3)

ggplot() +
  geom_point(data = df, aes(gp, y)) +
  geom_point(data = ds, aes(gp, mean), colour = 'red', size = 3) +
  geom_errorbar(
    data = ds,
    aes(gp, mean, ymin = mean - sd, ymax = mean + sd),
    colour = 'red',
    width = 0.4
  )