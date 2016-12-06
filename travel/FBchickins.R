#清空記憶體
rm(list=ls(all.names=TRUE))

#載入RCurl套件
library(RCurl)

#使用rjson套件將URL資料轉換json格式
library(rjson)

#將token儲存為變數
token <- "EAACEdEose0cBAMILTm52NZAwDcMqpe2jnurMOA6lNgtjU1WGokp8sKvfkLBCiZCe03jPZBfS6MBSzggCp2WeuM2XDPS8fuzSUBdZBSgpi2ZAVPpsKK8OlhQqP0pOroWhu0lAn8vbiJifX4pc65NqnJEZAuBlAMiFMeVcUBSXjZBiQZDZD"

#讀取csv檔案
data<-read.csv("travel.csv", header=F, sep=",")

#查看資料維度dimensions
dim(data)

#計算V2欄位的長度
length(data$V2)

#讀取v2欄第一筆資料
i <- data$V2[1]

#連接URL字串
urlPath <- paste0("https://graph.facebook.com/",i,"?access_token=",token)

#取得URL資料
temp <- getURL(urlPath)

#將資料轉成json
fbjson <- fromJSON(temp)

#讀取打卡數$checkins資料
fbjson$checkins

#轉換為數字資料型態
t1 <- as.integer(fbjson$checkins)


############
#用迴圈執行#
############
#清空記憶體
rm(list=ls(all.names=TRUE))
#載入RCurl套件
library(RCurl)
#使用rjson套件將URL資料轉換json格式
library(rjson)
#將token儲存為變數
token <- "EAACEdEose0cBAMILTm52NZAwDcMqpe2jnurMOA6lNgtjU1WGokp8sKvfkLBCiZCe03jPZBfS6MBSzggCp2WeuM2XDPS8fuzSUBdZBSgpi2ZAVPpsKK8OlhQqP0pOroWhu0lAn8vbiJifX4pc65NqnJEZAuBlAMiFMeVcUBSXjZBiQZDZD"
#讀取csv檔案
data<-read.csv("travel.csv", header=F, sep=",")
#將資料長度儲存為變數
alldata <- length(data$V2)
#宣告allcheckins為陣列型態
allcheckins <- array(dim = alldata) 
#i從1到alldata
for (i in 1:alldata) { 
  #合併URL字串
  urlPath <- paste0("https://graph.facebook.com/",data$V2[i],"?access_token=",token)
  #取得URL內容
  temp <- getURL(urlPath)
  #轉換資料為JSON格式
  fbjson <- fromJSON(temp)
  #取得打卡數$checkins
  checkins <- fbjson$checkins
  #印出打卡數
  print(checkins)
  #將打卡數存入陣列
  allcheckins[i] <- checkins
}
#輸出CSV
write.table(allcheckins, file = "allcheckins.CSV", sep = "," , col.names = FALSE)
