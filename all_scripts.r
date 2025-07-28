library(ggplot2)
library(tidyverse)
library(lmtest)
library(ggpubr)
library(broom)
library(ggfortify)
library(skimr)

## Import the built-in R data set
data("txhousing")

## View and check the dimension of the data set
View(txhousing)
dim(txhousing)

txhousing %>% drop_na()

## Check the column names for the data set
names(txhousing)

## Take a peek using the head and tail functions
head(txhousing)
tail(txhousing)

## Check the internal structure of the data frame
glimpse(txhousing)

## Create a broad overview of a data set
skim(txhousing)

## Find the correlation between the variables
cor(txhousing["sales"], txhousing["volume"])

## Plot a scatter plot for the variables with sales on the x-axis
## volume on the y-axis

ggplot(data=txhousing, aes(x=sales, y=volume)) + geom_point() + stat_smooth(se=FALSE)

## Import the house sales data
house_sales <- read_csv("house_sales_prices.csv")

## Get a glimpse of the data set
glimpse(house_sales)

## Create a broad overview of a data set
skim(house_sales)