 mydataset <- read.csv("C:/Users/vatsal/Desktop/PROJECT/flightscombined (Autosaved).csv")
View(mydataset)
mydataset=mydataset[,c(-14:-18)]
mydataset=na.omit(mydataset)
mydataset_cluster=data.frame(mydataset$ARR_DELAY_NEW)
names(mydataset_cluster)[1]="DELAY"



wss <- (nrow(mydataset_cluster)-1)*sum(apply(mydataset_cluster,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(mydataset_cluster,
                                     centers=i)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares",
     main="Assessing the Optimal Number of Clusters with the Elbow Method",
     pch=20, cex=2)



km=kmeans(mydataset_cluster,6)
km$size
km$centers

plot(mydataset_cluster$DELAY,col=km$cluster+1,ylab="DELAY")

