
for (i in 1:length(temp)) { 
  fbjson <- fromJSON(temp[i])
  fbjson <- person$checkins
  t1 <- as.integer(fbjson)
  print(t1)
}

temp    <- getURL(c(x1,x2,x3,x4))
x1 <- "https://graph.facebook.com/287128444662086?access_token=EAACEdEose0cBAGwKG2C7VMV052j1zp3MDCV8kglEAbYqqfBTR0lbovy8BDwP7X8btBQh7TgUhJWOUzjffDd4nb3Mde72K8j9ZAlIDF8kULld6US8q42AJCi9z25fSaLcdXOHxjxKti4nFNFQ3OfmsIATZCxPTlmiU72QcZCcQZDZD"

x2 <- "https://graph.facebook.com/129709117082025?access_token=EAACEdEose0cBACERwIUdeLZAsr0bUzQBkRw3ZCjbAi51msTw3zHwfGZBAMkK7ospHGOZBRINc8M7MF5MmEEKT9RLmdtFtNi7rH7JHg66nUz8S5BW26QEevzQMA2Mg7XauWnIZBbd5JBRQh6w9idww4U1iokmZAZAL9RuMdIhI5r1wZDZD"

x3 <- "https://graph.facebook.com/324945400922381?access_token=EAACEdEose0cBACERwIUdeLZAsr0bUzQBkRw3ZCjbAi51msTw3zHwfGZBAMkK7ospHGOZBRINc8M7MF5MmEEKT9RLmdtFtNi7rH7JHg66nUz8S5BW26QEevzQMA2Mg7XauWnIZBbd5JBRQh6w9idww4U1iokmZAZAL9RuMdIhI5r1wZDZD"

x4 <- "https://graph.facebook.com/177601598942937?access_token=EAACEdEose0cBACERwIUdeLZAsr0bUzQBkRw3ZCjbAi51msTw3zHwfGZBAMkK7ospHGOZBRINc8M7MF5MmEEKT9RLmdtFtNi7rH7JHg66nUz8S5BW26QEevzQMA2Mg7XauWnIZBbd5JBRQh6w9idww4U1iokmZAZAL9RuMdIhI5r1wZDZD"

x5 <- "https://graph.facebook.com/228187000576249?access_token=EAACEdEose0cBACERwIUdeLZAsr0bUzQBkRw3ZCjbAi51msTw3zHwfGZBAMkK7ospHGOZBRINc8M7MF5MmEEKT9RLmdtFtNi7rH7JHg66nUz8S5BW26QEevzQMA2Mg7XauWnIZBbd5JBRQh6w9idww4U1iokmZAZAL9RuMdIhI5r1wZDZD"

x <- "https://graph.facebook.com/228187000576249?access_token=EAACEdEose0cBACERwIUdeLZAsr0bUzQBkRw3ZCjbAi51msTw3zHwfGZBAMkK7ospHGOZBRINc8M7MF5MmEEKT9RLmdtFtNi7rH7JHg66nUz8S5BW26QEevzQMA2Mg7XauWnIZBbd5JBRQh6w9idww4U1iokmZAZAL9RuMdIhI5r1wZDZD"
x1 <- getURL(x)

data<-read.csv("travel.csv", header=F, sep=",")
dim(data)
i <- data$V2[1]

person <- fromJSON(x1)

length(data$v2)
View(data)
write()
#清除記憶體
rm(list=ls(all.names=TRUE))
library(httr)
#使用rjson套件將URL轉換json格式
library(rjson)
#將token儲存為變數
token <- "EAACEdEose0cBAMILTm52NZAwDcMqpe2jnurMOA6lNgtjU1WGokp8sKvfkLBCiZCe03jPZBfS6MBSzggCp2WeuM2XDPS8fuzSUBdZBSgpi2ZAVPpsKK8OlhQqP0pOroWhu0lAn8vbiJifX4pc65NqnJEZAuBlAMiFMeVcUBSXjZBiQZDZD"
#讀取csv檔案
data<-read.csv("travel.csv", header=F, sep=",")
#查看資料dimensions
dim(data)
#計算V2欄位的長度
length(data$V2)
#讀取v2欄第一筆資料
i <- data$V2[1]
#連接字串
urlPath <- paste0("https://graph.facebook.com/",i,"?access_token=",token)
#取得URL資料
temp <- getURL(urlPath)
#將資料轉成json
fbjson <- fromJSON(temp)
#讀取打卡數$checkins資料
fbjson$checkins
#轉換為數字
t1 <- as.integer(fbjson$checkins)

fbjson <- sapply(temp, fromJSON)

alldata <- length(data$V2)
allcheckins <- matrix(NA, nrow = alldata) 
for (i in 1:alldata) { 
  urlPath <- paste0("https://graph.facebook.com/",data$V2[i],"?access_token=",token)
  temp <- getURL(urlPath)
  fbjson <- fromJSON(temp)
  checkins <- fbjson$checkins
  print(checkins)
  allcheckins[i] <- checkins
}
allcheckins[1]

write.table(allcheckins, file = "allcheckins.CSV", sep = ",")
