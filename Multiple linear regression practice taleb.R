# Multiple linear regression 
# load the datasets 
data <- read.csv('50_Startups.csv')

# Encode catagoricla data

data$State <- factor(data$State, 
                     levels = c('New York','California','Florida'),
                     labels = c(1,2,3))

# split the data into training and test sets

library(caTools)
set.seed(123)

split <- sample.split(data$Profit, SplitRatio = 0.8)

training_set <- subset(data, split==TRUE)

test_set <- subset(data, split==FALSE)


# building and interpreating multiple regressor 

regressor <- lm(formula = Profit ~ ., training_set)

#based on the summary of the regressor, if only one variable is dominant
# we can convert multiple to simple linear regression 

# building predictor 
y_pred <- predict(regressor, test_set)


library(ggplot2)
ggplot() +
  geom_point( aes(x= training_set$R.D.Spend, y = training_set$Profit), color='red')+
  geom_line( aes( x= training_set$R.D.Spend, 
                  y = predict(regressor, training_set)))





