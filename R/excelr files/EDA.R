a <- c(1,2,3,100)
var(a) 
sd(a) 
mean(a)
median(a)
mfv(a) 
install.packages("modeest")
library(modeest)
mfv(a)
scores <- c(1,2,2,2,3,4,4,4,5,6)
mfv(scores)

#x = read.csv("E:\\Datasets\\Datasets_BA 2\\mba.csv")
getwd()
setwd("C:/Users/varun/Documents")     
mba2 <- read.csv("mba.csv")
View(mba2) 
mba <- read.csv("C:/Users/varun/Downloads/mba.csv")
mba 
# Path needs to be modified to either / or \\
mba1 <- read.csv(file.choose())
rm(mba1) 
wine <- read.csv(file.choose()) 
#Measures of Central Tendency
View(mba) 
View(wine)  
mean(mba$gmat) 
mean(mba$workex)
median(mba$gmat)
median(mba$workex)

summary(mba) 

library(modeest)
mfv(mba$gmat) 
mfv(mba$workex) 

install.packages("modeest")


attach(mba) 
mfv(gmat)
summary(gmat) 
mean(gmat) 
mfv(mba$workex) 

median(mba$workex) 


mean(mba$workex)
median(mba$gmat)
median(mba$workex) 
mfv(mba$gmat) 
mfv(mba$workex)  


summary(mba) 
summary(mba$gmat) 
summary(gmat) 
summary(mba)   

attach(mba) 
mean(gmat) 
mean(workex)
summary(gmat) 

detach(mba)  
mean(mba$gmat) 
str(mba)


#Measures of Dispersion
var(mba$gmat)
var(mba$workex)
sd(mba$gmat) 
sd(mba$workex) 
range(mba$workex)
range(mba$gmat) 

rangevalue <- function(x){max(x)-min(x)}
rangevalue(mba$workex)

max(mba$workex)
min(mba$workex) 

#Measures of skewness
install.packages("moments")
library(moments)

#Measures of skewness
skewness(mba$gmat) 
hist(mba$gmat) 
hist(mba$workex)
?hist
?mean  
?median 
View(mba)
head(mba)
tail(mba) 

my_data1 <- mba[10:50,-c(1)]
my_data1 
View(my_data1)   
is.numeric(mba$datasrno) 
is.numeric(mba$workex)
is.numeric(mba$gmat) 
mba3 <- as.character(mba$gmat) 
mba3 <- as.numeric(mba3)   
str(mba3) 
?str 
?sapply 


colMeans(mba[sapply(mba,is.numeric)])  
sapply(Filter(is.numeric,my_data1),mean)          
my_data1 
#Measures of Kurtosis 
kurtosis(mba$gmat)
kurtosis(mba$workex)
plot(density(mba$gmat))
plot(density(mba$workex))


#Graphical R,epresentation
#Boxplot
#Histogram
#Barplot

boxplot(mba$gmat)
boxplot(mba$gmat)$out 
summary(mba$gmat)
View(mba) 


hist(mba$gmat,breaks =c(600,625,650,675,700,725,750,800),freq = T,col = 'blue',labels = T)    
hist(mba$gmat)
hist(mba$workex)  
?hist    
?mean
?median
barplot(mba$gmat) 

install.packages("moments") 
library(moments)
skewness(mba$gmat)
skewness(mba$workex)
library(modeest)
kurtosis(mba$gmat)
kurtosis(mba$workex)

data = c(15,24,38,54)
names = c("one","two","three","four")
pie(data,labels = names,radius =1 ) 
barplot(data,axes= TRUE,ylab = "values",names.arg =c("one","two","three","four"))
?barplot 
?
  
barplot(GNP ~ Year, data = longley) 
barplot(cbind(Employed, Unemployed) ~ Year, data = longley) 


str(mba)
x = c(1,1,1,2,1,2,1,2,1,2,1,2,1,2,1) 
y = as.factor(x)
str(y)
mba$datasrno <- as.numeric(mba$datasrno)
class(mba$datasrno)

summary(mba)
?describe


df <- read.table(text =
                   "x y
4     71.88
20    65.80
40    63.92
60    63.47", header = T);

library(ggplot2)
ggplot(df, aes(x,as.factor(y))) + 
  geom_point() + 
  labs(y = "Percentage correct", x = "Categorical variable")


?ggplot

plot(df$x,df$y) 


getwd()
library(Rcpp) 


install.packages("data.table")
install.packages("ggplot2")


pnorm(1) 
pnorm(70,60,10) 
?pnorm 
pnorm(680,711,29)
pnorm(740,711,29)-pnorm(697,711,29)

qnorm(0.975) 
qnorm(0.95)
qt(0.975,139) 

qt(0.975,79) 


barplot(GNP ~ Year, data = longley)  
barplot(workex ~ datasrno , data = mba)     
View(longley) 
barplot(cbind(Employed, Unemployed) ~ Year, data = longley)


