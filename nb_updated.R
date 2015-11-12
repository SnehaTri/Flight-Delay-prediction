library(klaR)
library(caret)
library(caret)
AIR <- read.csv("C:/Users/vatsal/Desktop/PROJECT/flightscombined (Autosaved).csv")
View(AIR)
air=AIR[,c(2,4,5,6,9,10,13)] #defining predictors
View(air)
air=na.omit(air)
# Converting numerical attributes to categorical attributes
air$day=ifelse(air$DAY_OF_WEEK==1,"MONDAY",
               ifelse(air$DAY_OF_WEEK==2,"TUESDAY",
                      ifelse(air$DAY_OF_WEEK==3,"WEDNESDAY",
                             ifelse(air$DAY_OF_WEEK==4,"THURSDAY",
                                    ifelse(air$DAY_OF_WEEK==5,"FRIDAY",
                                           ifelse(air$DAY_OF_WEEK==6,"SATURDAY",
                                                  ifelse(air$DAY_OF_WEEK==7,"SUNDAY","NA")))))))
air$day=as.factor(air$day)
air$month=ifelse(air$MONTH==5,"MAY","DECEMBER")
air$month=as.factor(air$month)
air$distance=ifelse(air$DISTANCE<1118,"SHORT","LONG")
air$distance=as.factor(air$distance)
air=air[,c(-2,-3,-5,-7)] #removing unwanted numerical predictors

#randomising the data 
air_random=air[order(runif(nrow(air))),]  
air_random=air_random[,-4] #removing numerical distance attribute
View(air_random) 
# Splitting the data into training and testing sets 
# using 90% as training data and 10 % as test data
trainIndex=createDataPartition(air$DELAY,p=0.9,list=FALSE)
air_train=air_random[trainIndex,]
air_test=air_random[-trainIndex,]
View(air_train)
View(air_test)

#Applying the Naive Bayes model to the training data
model=NaiveBayes(air_train[,-3],air_train$DELAY)
#Exploring the Naive Bayes model
model$levels
model$tables

#Applying the model used for training data to predict test data
predictor=predict(model,air_test[,-3])
#Viewing the first 10 predictions and comparing with observed values
head(cbind(Predicted=as.character(predictor$class),Actual=as.character(air_test$DELAY)),10)
#Calculating accuracy of the predicted model
Err=1-sum(predictor$class == air_test$DELAY)/length(air_test$DELAY)
Err


