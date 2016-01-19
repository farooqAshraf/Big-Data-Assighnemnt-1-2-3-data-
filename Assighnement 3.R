adds<-read.csv('latest111.csv' ,sep = ",")

views<-adds$views


max<-max(views ,na.rm = FALSE)

firstmax <- which.max(views)

secondmax <- which.max(views < max-1)




names(sort(summary(as.factor(adds$Title)), decreasing=T)[1:3])


summary(as.factor(adds$Title) )



mapped<-read.csv('mappings4.csv')

summary(as.factor(mapped $Apple.iphone.5.16GB) )



sort(summary(as.factor(adds$username)), decreasing=T)

sort(summary(as.factor(adds$location)), decreasing=T)




mapped5<-read.csv('mappings5.csv' )

mapped5 <- as.data.frame(mapped5)
olxprices <- as.numeric(as.character( mapped5$olxprice ))

newprice <- as.numeric(sub("\\,","", mapped5$newprices))


mapped5$diference <- newprice - olxprices

mapped5$percentdiference <- ((newprice - olxprices)/olxprices) *100

write.table(mapped5,"pricescalculations.csv" , sep = ",")

average <-sum(mapped5$percentdiference , na.rm=TRUE)
lenth <- length(mapped5$percentdiference)
averagepercen <- average/lenth
