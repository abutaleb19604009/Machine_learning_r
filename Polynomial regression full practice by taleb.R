# polynomial regression 
# load data set

data <- read.csv('Position_Salaries.csv')
data <- data[,2:3]

# make the model first linear regression 

linear_regression <- lm(formula = Salary ~., data)

# summery() the result of linear regression 

summary(linear_regression)

# input polynomial variable 

data$Level2 <- data$Level^2

data$Level3 <- data$Level^3

# fit model in updated data

poly_model <- lm(formula = Salary ~., data)

# summary of poly model 

summary(poly_model)


# present the model in graph 

library(ggplot2)

# visualizing the result of linear regressio 

ggplot()+
  geom_point( aes(x= data$Level, y = data$Salary),color='red')+
  geom_line( aes( x = data$Level , y= predict(linear_regression, newdata = data)),
             color='blue')+
  ggtitle('Polynomial Regression o order')+
  xlab('Lavel 1')+
  ylab('Salary')

# Visulaizing result of polynomial regression 

ggplot()+
  geom_point( aes(x= data$Level, y= data$Salary), color='red')+
  geom_line( aes(x = data$Level, y= predict(poly_model, newdata = data)), 
             color='yellow')+
  ggtitle('Polynomial Graph')+
  xlab('Level')+
  ylab('Salary')

# add a new degree in the data set

data$Level4 <- data$Level^4

# fit polymodel in new data

poly_model <- lm(formula = Salary ~., data)

# visualization of newly updated data 

ggplot()+
  geom_point( aes(x= data$Level, y = data$Salary), color='red')+
  geom_line( aes( x= data$Level, y = predict(poly_model, newdata = data)),color='green')+
  ggtitle('Polynomial with 4th power')+
  xlab('Level')+
  ylab('Salary')


# check the summary of poly_model for significance of newly added variable 
summary(poly_model)


# making single prediction using polynomial regression 

y_pred <- predict(linear_regression, data.frame(Level=6.5))