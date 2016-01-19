library(XML)


#mytable<-c("this is title","rs1000","http://olx.com.pk/")

url = "http://olx.com.pk/mobiles-tablets/?page=" 
for(i in 498:500) 
{
  print(i)
  
  fileURL <-paste(url,i,sep='') 
  

doc <- htmlTreeParse(fileURL, useInternal = TRUE)


Links <- xpathSApply(doc, "//h3[@class='large lheight20 margintop10']/a/@href") 

for(link in Links)
{
  print(link)
  
  doc2 <- htmlTreeParse(link, useInternal = TRUE)
  
  price <-  gsub("[\t\n\r]", "", xpathSApply(doc2, "//div[@class='pricelabel tcenter']/strong[@class='xxxx-large margintop7 block not-arranged']", xmlValue)) 
  if(is.na(price[1]))
  { price <- "NA" }
  #print(price)
  
  title <-   gsub("[\t\n\r]", "", xpathSApply(doc2, "//div[@class='clr offerheadinner pding15 pdingright20']/h1[@class='brkword lheight28']", xmlValue) )
  if(is.na(title[1]))
  { title <- "NA" }
 # print(title)
  
  location <-   gsub("[\t\n\r]", "", xpathSApply(doc2, "//span[@class='fleft block clr pdingright10']", xmlValue) )
  if(is.na(location[1]))
  { location <- "NA" }
 # print(location)
  
  
  brand <- gsub("[\t\n\r]", "", xpathSApply(doc2, "//div[@class='pding5_10']/strong[@class='block']/a", xmlValue) )
  if(is.na(brand[1]))
  { brand <- "NA" }
 # print(brand)
  
  addid <-  gsub("[\t\n\r]", "", xpathSApply(doc2, "//span[@class='nowrap']/span[@class='rel inlblk']", xmlValue) )
  if(is.na(addid[1]))
  { addid <- "NA" }
 # print(addid)
  
  phone<-  gsub("[\t\n\r]", "", xpathSApply(doc2,"//div[@class='clr fleft marginleft5 pp  contactitem brkword']/strong[@class='large lheight20 fnormal  ']",xmlValue))
  if(is.na(phone[1]))
  { phone <- "NA" }
 # print(phone)
  
  description<-gsub("[\t\n\r]", "",xpathSApply(doc2,"//div[@id='offerdescription']//div[@id='textContent']/p[@class='pding10 lheight20 large']",xmlValue))
  if(is.na(description[1]))
  { description <- "NA" }
 # print(description)
  
  date <-  gsub("[\t\n\r]", "",xpathSApply(doc2, "//p[@class='x-large clr margintop10'][1]//span[@class='pdingleft10 brlefte5'][a]", xmlValue))
  if(is.na(date[1]))
  { date <- "NA" }
 # print(date)
  
  views <- gsub("[\t\n\r]", "", xpathSApply(doc2, "//div[@id='offerbottombar']/div[@class='pdingtop10']/strong", xmlValue)) 
  if(is.na(views[1]))
  { views <- "NA" }
 # print(views)
  
  username<-gsub("[\t\n\r]", "",xpathSApply(doc2, "//div[@class='userbox clr rel zi2 margintop10']/p[@class='userdetails fleft marginleft15']/span[@class='block color-5 brkword xx-large']", xmlValue))
  if(is.na(username[1]))
  { username <- "NA" }
  # print(username)
  
  img1 <-gsub("[\t\n\r]", "",xpathSApply(doc2, "//div[@class='photosbar']/ul[@id='bigGallery']/li[@class='fleft'][1]/a/@href"))
  if(is.na(img1[1]))
  { img1 <- "NA" }
  #print(img1)
  
  img2 <-gsub("[\t\n]", "",xpathSApply(doc2, "//div[@class='photosbar']/ul[@id='bigGallery']/li[@class='fleft'][2]/a/@href") )
  
  if(is.na(img2[1]))
  { img2 <- "NA" }
  #print(img2)
  
  dfrm <- data.frame(title=title ,link= link, price =price, location = location , addid = addid, phone=phone , brand=brand , addid=addid, phone=phone , description=description , date= date , views=views, username=username ,img1=img1, img2=img2)
  
  
    write.table(dfrm,file = "latest.csv", append = TRUE, row.names = FALSE, col.names = FALSE, sep = ',')
  
  
  
  
  
}





}


