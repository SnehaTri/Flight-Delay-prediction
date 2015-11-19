# Flight-Delay-prediction
Project Description

Introduction
Every year a considerable number of flights are delayed or cancelled due to a variety of reasons. These delays not only result in inconvenience to travelers, but also cost millions of dollars in revenue to the airline companies. Flights are delayed due to a variety of reasons ranging from weather conditions, security, carrier delays and so on. While many delays are caused due to unforeseen circumstances, a considerable amount of these delays can be minimized and predicted by studying historic airline data. 

Objective
The objective of the project is to perform analysis of the historic flight data to gain valuable insights and build a predictive model to predict whether a flight will be delayed or not given a set of flight characteristics.
Questions to be answered post analysis:
•	Does the month of flight have any impact on flight delays?
•	Flights to which destination have seen the most delays?
•	Which day of the week sees the least and most flight delays?
•	Which time of day is most suitable for preventing flight delays?
•	Which airline has the most number of flights delayed?
•	What are the primary causes for flight delays?
The objective of the predictive model is to build a model to predict whether a flight will be delayed or not based on certain characteristics of the flight. Such a model may help both passengers as well as airline companies to predict future delays and minimize them.

Dataset Description
The dataset for this problem was obtained from the Bureau of Transportation Statistics which consists of all commercial flight operations from the year 1987 to 2015. But in order to limit the size of the dataset, a subset of the dataset has been obtained as follows:
•	For the purpose of this project the most recent flight operations have been considered i.e flight operations for the month of May,2015 has been considered.
•	Additionally flight operations from December 2014 have also been considered for the purpose of comparison and analysis.
•	This project considers all flight operations (inbound and outbound) from the state of California, United States, since it is one of the busiest airports.
This has reduced the dataset to 200,020 records.
The dataset consists of the following flight features:
•	YEAR : Year Of Flight Departure/Arrival
•	CRS_DEP_TIME : Flight Departure time in Hours
•	MONTH : Month of Flight Departure/Arrival (5-May and 12- December)
•	DAY_OF_WEEK : Day of Week (1-7)
•	CARRIER : Code assigned by IATA and commonly used to identify a carrier. 
•	ORIGIN_CITY_NAME: Origin City of flight
•	DEST_CITY_NAME: Destination City of flight
•	ARR_DELAY_NEW : Difference in minutes between scheduled and actual arrival time. Early arrivals set to 0.
•	ARR_DEL15: Arrival Delay Indicator, 15 Minutes or More (1=Yes)
•	DISTANCE : Distance between origin and destination in miles.
•	CARRIER_DELAY: Carrier Delay, in Minutes
•	WEATHER_DELAY: Weather Delay, in Minutes
•	NAS_DELAY: National Air System Delay, in Minutes
•	SECURITY_DELAY: Security Delay, in Minutes
•	LATE_AIRCRAFT_DELAY: Late Aircraft Delay, in Minutes

In order to build the predictive model, the following attributes have been considered:
•	Timeslot
•	Carrier
•	Distance
•	Month 
Since the above factors played the most important role in determining delays, other factors have not been considered to maintain model accuracy.

For the purpose of this project 2 types of models have been built and accuracy of both models have been compared. The 2 algorithms used are:
•	Naïve Bayes Classification Algorithm
•	Random Forest Algorithm

The RScript files nb_updated.R and randomforest.R contain the entire R code that has been used to develop these models.

Initial discovery of relationships is usually done with a training set while a test set and validation set are used for evaluating whether the discovered relationships hold. More formally, a training set is a set of data used to discover potentially predictive relationships. A test set is a set of data used to assess the strength and utility of a predictive relationship.

For the purpose of our predictive model, 80% of the data has been used as training data (to train the classifier) and 20% of the data has been considered as test data.

The file clusteranalysis.R divides all flight operations into clusters using K-Means algoirthm.
