
# load the dataset
data <- read.csv('Salary_Data.csv')

# load library 
library(caTools)
# split the data into training and test sets 
set.seed(123)
split = sample.split(data$Salary, SplitRatio = 2/3)


training_set <- subset(data, split== TRUE)
test_set <- subset(data, split == FALSE)

# train simple linear regration 
# simple linear regression do feature scalling itself, we will not do it

# fit the simple linear regression in test set use lm model,input formula,
# input data
regressor <- lm(formula = Salary ~ YearsExperience, training_set )


# predicting the result of test sets use predict()

y_ped <- predict(regressor, newdata = test_set)

# visualizing the trainig set result and test set result in graph 
# visualizing training set

library(ggplot2)
ggplot() +
  geom_point(aes(x= training_set$YearsExperience, y = training_set$Salary),
             color='red')+
  geom_line(aes(x=training_set$YearsExperience, 
                y=predict(regressor, newdata = training_set) ),
            colour= 'blue')


# visualizing test set 

ggplot()+
  geom_point( aes(x= test_set$YearsExperience, y =test_set$Salary),
              colour = 'red')+
  geom_line( aes(x= training_set$YearsExperience, 
                 y =predict(regressor, newdata = training_set) ))
  
  


 


