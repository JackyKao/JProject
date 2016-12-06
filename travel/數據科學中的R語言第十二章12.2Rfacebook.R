library(Rfacebook)
#fbOAuth("1249947508355327", "6c9b22736c28815d2016e5a6cee08150")

library(devtools)
library(Rweibo)
#install_github("Rfacebook", "pablobarbera", subdir="Rfacebook")
token <- "CAACEdEose0cBAFgd1y6wX5sAKkCJvKBIdgTC7PZCKSiMrp1uVxXZAtWj2AjZCRq8GQSGgUllBNJPHyG1wQQ2geKcIivOX0M8x32Yy5qdKlvZBqZCipxUjZAw6bBaxwsLvnQn4Hcug40u7EkJZC2OXi7sEYi99mw3SNaAMOe4jMja2LwTjwkaHZCG4eVaXdzSectumWAyOoZBCTAZDZD"
me <- getUsers("887643007919114", token, private_info = TRUE) 
#getUsers讀取使用者公開資訊
me$name # my name

my_friends <- getFriends(token, simplify = TRUE) #simplify簡化
head(my_friends$id, n = 1) # get lowest user ID
#my_friends_info <- getUsers(my_friends$id, token, private_info = TRUE)
#table(my_friends_info$gender)  # gender
my_friends_info <- getUsers(my_friends$id, token, private_info = TRUE)
mat <- getNetwork(token, format = "adj.matrix") #getNetwork獲得網路format格式
dim(mat)



page <- getPage("humansofnewyork", token, n = 5000) #humansofnewyork

## convert Facebook date format to R date format 從fb資料格式到r資料格式
format.facebook.date <- function(datestring) {
  date <- as.POSIXct(datestring, format = "%Y-%m-%dT%H:%M:%S+0000", tz = "GMT")
}
## aggregate metric counts over month 超過本月總指標
aggregate.metric <- function(metric) {
  m <- aggregate(page[[paste0(metric, "_count")]], list(month = page$month), 
                 mean)
  m$month <- as.Date(paste0(m$month, "-15"))
  m$metric <- metric
  return(m)
}
# create data frame with average metric counts per month 創建data frame每月平均測量次數
page$datetime <- format.facebook.date(page$created_time)
page$month <- format(page$datetime, "%Y-%m")
df.list <- lapply(c("likes", "comments", "shares"), aggregate.metric)
df <- do.call(rbind, df.list)
# visualize evolution in metric
library(ggplot2)
library(scales)
ggplot(df, aes(x = month, y = x, group = metric)) + geom_line(aes(color = metric)) + 
  scale_x_date(breaks = "years", labels = date_format("%Y")) + scale_y_log10("Average count per post", 
                                                                             breaks = c(10, 100, 1000, 10000, 50000)) + theme_bw() + theme(axis.title.x = element_blank())

#theme_bw改主題 theme預印結果＝element_blank元素空白
