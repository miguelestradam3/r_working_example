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

## Create a simple linear regression model using the variables
simple_model <- lm(volume ~ sales, data=txhousing)
simple_model

## Plot the regression line for the model
ggplot(txhousing, aes(x = sales, y = volume)) +
  geom_point() +
  stat_smooth(method = lm) +
  labs(title = "Regression of Sales on Volume of Housing sales in TX",
       x = "Sales", y = "Volume")

## Plotting the fitted model
plot(simple_model)

## Assess the summary of the fitted model
summary(simple_model)

## Calculate the confidence interval for the coefficients
confint(simple_model)

## Build a log transformed regression model
model_transformed <- lm(log10(volume) ~ sales, data=txhousing)

## Return the summary of the model
summary(model_transformed)

## Return the first diagnostic plot for the model
plot(model_transformed, 1)

## Return the second diagnostic plot for the model
plot(model_transformed, 2)

## Return the third diagnostic plot for the model
plot(model_transformed, 3)

## Find the fitted values of the simple regression model
fitted_values <- predict.lm(simple_model)
head(fitted_values, 3)

## Return the model metrics
model_metrics <- augment(simple_model)
model_metrics

## Predict new values using the model
predict(simple_model, newdata= data.frame(sales = c(210, 27, 140)))

## Build the multiple regression model with volume as the y variable and sales, median and age on the x variables
multiple_reg <- lm(volume ~ sales + median, data=txhousing)

## This prints the result of the model
multiple_reg

## Check the summary of the multiple regression model
summary(multiple_reg)

## Plot the fitted multiple regression model
autoplot(multiple_reg)

## Create a broad overview of the data set
skim(house_sales)

## Drop the missing values in the LotFrontage variable
house_sales <- house_sales %>% drop_na(LotFrontage)

## Build the multiple regression model 
house_reg <- lm(SalePrice  ~ .,data=house_sales)

## Check the summary of the multiple regression model
summary(house_reg)

## Perform diagnostic plots of the fitted multiple regression model
autoplot(house_reg)