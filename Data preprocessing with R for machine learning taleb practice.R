data <- read.csv("Data.csv")

#handling missing data
# select col, check there missing, take mean, dont use missing while
# calculation mean 

data$Age[is.na(data$Age)] <- mean(data$Age, na.rm = TRUE)
print(data)

data$Salary[is.na(data$Salary)] <- mean(data$Salary, na.rm = TRUE)

# encode catagorical data using R by converting to factor
# input name of col, what to change, where to change 

data$Country = factor(data$Country,levels = c('France', 'Spain','Germany'),
                      labels= c(1,2,3))
data$Purchased = factor(data$Purchased,levels = c('No', 'Yes'),
                        labels = c(0,1)) 


# cut the data into training and test sets using caTools
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(data$Purchased, SplitRatio = 0.8)
# the result is true flase, true data part of training set, false is part
# of test set 



training_set <- subset(data, split== TRUE)
test_set <- subset(data, split == FALSE)

# feature scalling of the model 
# before scalling factor should be emitted 

training_set[,2:3] <- scale(training_set[,2:3])
test_set[,2:3] <- scale(test_set[,2:3])
# now data is ready for meachine learning model 
# in most libraries we do not need to use feature scalling, library
# will do it for us  





