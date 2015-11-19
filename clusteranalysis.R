 mydataset <- read.csv("C:/Users/vatsal/Desktop/PROJECT/flightscombined (Autosaved).csv") #import dataset
View(mydataset)
mydataset=mydataset[,c(-14:-18)] #removing unwanted variables
mydataset=na.omit(mydataset) #takes care of missing values
mydataset_cluster=data.frame(mydataset$ARR_DELAY_NEW) #convert to data frame 
names(mydataset_cluster)[1]="DELAY" 

# In order to find the ideal value of k for our kmeans clustering algorithm, we use the elbow method

wss <- (nrow(mydataset_cluster)-1)*sum(apply(mydataset_cluster,2,var)) # calculating within group sum of sqaures
for (i in 2:15) wss[i] <- sum(kmeans(mydataset_cluster,
                                     centers=i)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares",
     main="Assessing the Optimal Number of Clusters with the Elbow Method",   #plotting wss against number of clusters to plotelbow graph
     pch=20, cex=2)


# By th elbow graph, it appears that number of clusters must be 6 
km=kmeans(mydataset_cluster,6) #apply k means algorithm with k=6
km$size
km$centers

plot(mydataset_cluster$DELAY,col=km$cluster+1,ylab="DELAY") #visulalize the clusters formed

