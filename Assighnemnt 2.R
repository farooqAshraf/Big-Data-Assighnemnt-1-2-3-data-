library(stringdist)
olx<-read.csv('latest111.csv' ,sep = ",")
newmobil<-read.csv('whatmobilepk2.csv' , sep="|" )

name <- newmobil$title
price <- newmobil$price
#name<- as.vector(name)
title<-olx$Title



for(i in name)
{
  
 titles <- agrep(i,title, max.distance = 0 , costs = NULL,ignore.case = TRUE, fixed = TRUE, useBytes = TRUE ,value = FALSE)
  
 #titles <- amatch("apple" , olx$Title , maxDist=2)

 
#titles <- grep(i , olx$Title , ignore.case = TRUE , value = TRUE )

#print(titles)


for (j in titles)
{
  
  
  
  a= data.frame( olxtitle = title[j] , newtitle = i , olxprice = olx$price[j] , newprice = price[which(newmobil$title == i)] )
  
  write.table(a ,file = "mappings5.csv", append = TRUE, row.names = FALSE, col.names = FALSE, sep = ',')


}




}

