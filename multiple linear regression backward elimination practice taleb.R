# find optimal team of independent variable in multiple regression regression

# read dataset 

datas <- read.csv('50_Startups.csv')



# Encoding catagorical variable 
datas$State <- factor(datas$State, levels = c('New York','California','Florida'),
                      labels = c(1,2,3))
# splitting the datasets into training and test 
library(caTools)
split <- sample.split(datas$Profit, SplitRatio = 0.8)

train_set <- subset(datas, split==TRUE)
test_set <- subset(datas, split == FALSE)
# making regression model 

regressor <- lm(formula =Profit ~ ., train_set)

# predicting 

y_pred <- predict(regressor, test_set)

summary(regressor)

# bulding the model with backward elimination, build the regressor with whole dataset


regressor <- lm(formula = Profit ~ R.D.Spend+Administration+Marketing.Spend+State,datas )
summary(regressor)

# as sate is not significant, remove it 

regressor <- lm(formula = Profit ~ R.D.Spend+Administration+Marketing.Spend,datas )
summary(regressor)
# remove Amininstration as with most p value 

regressor <- lm(formula = Profit ~ R.D.Spend+Marketing.Spend,datas )
summary(regressor)
