---
  title: "Homework 3"
author: "Animesh Sengupta"
date: "9/27/2022"
output: pdf_document
---
  
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r set up workspace}

setwd("/Users/animeshsengupta/Work Directory/DACSS/STAT625/Homeworks") 
library(alr4)  # loads the installed package into the workspace so you can use it
library(summarytools)
library(ggplot2)

```


### Answer 1



### Answer 2

### Answer 4


### Answer 5 
Answer 2.16.1 and 2.16.2

```{r 2b}
unml<-lm(log(fertility)~log(ppgdp),UN11)
b3<- ggplot(UN11,aes(x=log(ppgdp), y=log(fertility))) + 
  geom_point()+
  stat_smooth(method="lm")+
  xlab("gdp per person")+
  ylab("Fertility")+
  ggtitle("ppgdp vs fertility")
b3
```
answer 2.16.3 and 2.16.4
```{r}
summary(unml)
```
The t test for slope = 0 , th ep value computed is p<2X10^-16 which is very small and thus very less probable. so we reject the null hypothesis that the slope ==0 . The significance level for this test would be 0.05 as default. 

Coefficient of determination is 0.526, means that 52.6% of the variation in fertility can be explained by the ppgdp.

Answer 2.16.5 

```{r}
p1<-predict(unml,data.frame(ppgdp=c(1000)),interval="prediction")
p1
exp(p1[2])
exp(p1[3])

```
so prediction interval for fertility is (1.87, 6.32)

###Answer 6

The prediction interval of new value y star will be more than the confidence interval of E(y star|x star).

### Answer 9
```{r}
#Answer 2.13.1
summary(Heights)
m9<-lm(dheight ~ mheight, data=Heights)
summary(m9)
#answer 2.13.2
confint(m9,level=0.99)
#answer2.13.3
p9<-predict(m9,data.frame(mheight=64),level=0.99,interval="prediction")
p9
```
2.13.1: The T test for hypothesis b1=0 has a very small p value , thus we can reject this hypothesis and can say that the b1 has some value.
2.13.2 the 99% confidence interval value for b1 is 0.608
2.13.3 Best fir prediction is 64.589 

### Answer 10
```{r}
#answer 2.4.1
summary(UBSprices)
plot10<-ggplot(UBSprices,aes(x=bigmac2003, y=bigmac2009))+
  geom_point()+
  stat_smooth(method="lm")+
  geom_smooth(method='lm', formula= y~x)

plot10
```

2.4.2
The simple linear regression will not be a best way to fit a model to this distribution because most of the data is clustered is one region. In both the axes it has a very skewed distribution with having very less values at the higher end of axes. Due to skewed distribution , it is not a good idea.


```{r}
plot102<-ggplot(UBSprices,aes(x=log(bigmac2003), y=log(bigmac2009)))+
  geom_point()+
  stat_smooth(method="lm")
plot102
```
After the log transformation , it linearly distributes the points across the axes somewhat uniformly. After the transformation there also visible a simple linear relation among both the variables. This is attributed to normal distribution around the axes after log transform. Hence it makes more sense to run simple linear regression for this log transformed model.

### Answer 11


```{r}
summary(ftcollinssnow)
colnames(ftcollinssnow)
m11<-lm(Early~Late,ftcollinssnow)
summary(m11)
```
As per the t test for slope for the linear model , we get the p value of 0.124, which is somewhat lower 