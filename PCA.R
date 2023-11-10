#------------iris Dataset-----------------
data("iris")
head(iris)

irisdata1 <- iris[,1:4]
irisdata1

head(irisdata1)
help("princomp")
library(stats)
principal_components <- princomp(irisdata1, cor = TRUE, score = TRUE)
summary(principal_components)
plot(principal_components)
plot(principal_components, type = "l")
help("biplot")
biplot(principal_components)

#------------Boston Dataset-----------------
install.packages("MASS")
data(Boston, package="MASS")
help(prcomp)

pca_out <- prcomp(Boston, scale. = T)
pca_out
plot(pca_out)

biplot(pca_out, scale = 0)
boston_pc <- pca_out$x
boston_pc
head(boston_pc)
summary(boston_pc)

#------------US Arrests Dataset-----------------
states = row.names(USArrests)
states
names(USArrests)
apply(USArrests, 2, mean)
apply(USArrests, 2, var)

pr.out = prcomp(USArrests, scale = TRUE)
names(pr.out)

pr.out$center
pr.out$scale
pr.out$rotation
dim(pr.out$x)
biplot(pr.out, scale = 0)

pr.out$rotation=-pr.out$rotation
pr.out$x=-pr.out$x
biplot (pr.out , scale =0)

pr.out$sdev
pr.var=pr.out$sdev ^2
pr.var

pve=pr.var/sum(pr.var)
pve

plot(pve , xlab="Principal Component", ylab="Proportion of
  Variance Explained ", ylim=c(0,1),type='b')

plot(cumsum(pve), xlab="Principal Component ", ylab="
  Cumulative Proportion of Variance Explained ", ylim=c(0,1),
       type='b')

a=c(1,2,8,-3)
cumsum(a)
