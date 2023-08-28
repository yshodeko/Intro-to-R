library(tidyverse)
library(ggplot2)
dat <- read.csv("EconomistData.csv")
View(dat)

# 1 Create a scatter plot with CPI on the x axis and HDI on the y axis.
ggplot(dat,aes(CPI, HDI))+
  geom_point()+
  labs(title="scatter plot with CPI on the x axis and HDI on the y axis.")

# 2 Create a scatter plot with CPI on the x axis and HDI on the y axis and color the points blue.
ggplot(dat)+
  geom_point(aes(CPI, HDI),color="blue")+
  labs(title="scatter plot with CPI on the x axis and HDI on the y axis and color the points blue..")

# 3 Create a scatter plot with CPI on the x axis and HDI on the y axis and color the points according to Region.
ggplot(dat)+
  geom_point(aes(CPI, HDI,color= Region))+
  labs(title="scatter plot with CPI on the x axis and HDI on the y axis and color the points according to Region.")

# 4 Create a scatter plot with CPI on the x axis and HDI on the y axis and set point size to 2 so that the points bigger than in other plots.
ggplot(dat)+
  geom_point(aes(CPI, HDI,size = 2))+
  labs(title="scatter plot with CPI on the x axis and HDI on the y axis and set point size to 2.")

# 5 Create a scatter plot with CPI on the x axis and HDI on the y axis and map the size of the points to HDI.Rank.
ggplot(dat)+
  geom_point(aes(CPI, HDI,size = HDI.Rank))+
  labs(title="scatter plot with CPI on the x axis and HDI on the y axis and map the size of the points to HDI.Rank")

dim(dat)
