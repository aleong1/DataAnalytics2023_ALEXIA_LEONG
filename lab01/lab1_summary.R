summary(EPI) 	# stats
fivenum(EPI,na.rm=TRUE)
help(stem)
stem(EPI)		 # stem and leaf plot
help(hist)
hist(EPI)
hist(EPI, seq(30., 95., 1.0), prob=TRUE)
help(lines)
lines(density(EPI,na.rm=TRUE,bw=1.)) # or try bw=“SJ”
help(rug)
rug(EPI) 

plot(ecdf(EPI), do.points=FALSE, verticals=TRUE) 

par(pty="s")
qqnorm(EPI); qqline(EPI)

x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for tdsn")
qqline(x)

##Same exploration for other 2 variables: BIODIVERSITY and FORESTRY
BIODIVERSITY
summary(BIODIVERSITY)
fivenum(BIODIVERSITY,na.rm=TRUE)
stem(BIODIVERSITY)
hist(BIODIVERSITY)
help("seq")
hist(BIODIVERSITY, seq(0., 100., 1.0), prob=TRUE)
lines(density(BIODIVERSITY,na.rm=TRUE,bw=1.)) # or try bw=“SJ”
rug(BIODIVERSITY)
plot(ecdf(BIODIVERSITY), do.points=FALSE, verticals=TRUE) 

par(pty="s")
qqnorm(BIODIVERSITY); qqline(BIODIVERSITY)

x<-seq(0,100,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for tdsn")
qqline(x)

FORESTRY
summary(FORESTRY)
fivenum(FORESTRY,na.rm=TRUE)
stem(FORESTRY)
hist(FORESTRY)
hist(FORESTRY, seq(0., 100., 1.), prob=TRUE)
lines(density(FORESTRY,na.rm=TRUE,bw=1.)) # or try bw=“SJ”
rug(FORESTRY)
plot(ecdf(FORESTRY), do.points=FALSE, verticals=TRUE) 

par(pty="s")
qqnorm(FORESTRY); qqline(FORESTRY)

x<-seq(0,100,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for tdsn")

boxplot(EPI,DALY)
qqplot(EPI,DALY)

boxplot(EPI,
        ENVHEALTH, ECOSYSTEM, DALY, AIR_H,
        WATER_H, AIR_E, WATER_E,
        BIODIVERSITY)

EPILand<-EPI[!Landlock]
ELand <- EPILand[!is.na(EPILand)]
hist(ELand)
hist(ELand, seq(30., 95., 1.0), prob=TRUE)

EPI_South_Asia <- EPI[EPI_regions == "South Asia"]
E_South_Asia <- EPI_South_Asia[!is.na(EPI_South_Asia)]
hist(E_South_Asia)