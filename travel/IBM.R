library(RSelenium)
library(data.table)
# library(RCurl)

ibm_job <- data.frame()

url <- 'https://krb-sjobs.brassring.com/TGWebHost/home.aspx?partnerid=26059&siteid=5016'
startServer()
remDr <- remoteDriver$new() #新開一個頁面
remDr$open()
remDr$navigate(url) #瀏覽網址網頁

search <- remDr$findElement('xpath', "//*/span[@class='TEXT TGAlignLeft']/a") #尋找按鈕
search$clickElement() #按下按鈕

#location <- remDr$findElement('xpath', "//*/option[@value='All']")
#location$clickElement()

start_search <- remDr$findElement('xpath', "//*/button[@type='submit']")
start_search$clickElement()

page.num <- remDr$findElement('xpath', "//*/div/span[@class='yui-pg-current']")
page.num <- page.num$getElementText()[[1]]
jobCount <- as.numeric(gsub('.*. of ', '', page.num))
page.num <- ceiling(jobCount /50)

ibm_job <- lapply(1:page.num, function(u){
  
  if(u != 1){
    nextpage <- remDr$findElement('id', 'yui-pg0-1-next-link')
    nextpage$clickElement()
  }
  
  doc <- htmlParse(remDr$getPageSource()[[1]])
  tmp.table <- readHTMLTable(doc, stringsAsFactors = F)
  job_table <- tmp.table[[14]][4:nrow(tmp.table[[14]]), 2:8]
  names(job_table) <- tmp.table[[14]][2, 2:8]
  
  links <- xpathSApply(doc, "//div[@class='yui-dt-liner']/a", xmlGetAttr, 'href')
  links <- paste0('https://krb-sjobs.brassring.com/TGWebHost/', links)
  job_table <- data.frame(job_table, links)

  Sys.sleep(runif(1)*3)
  
  job_table
})
ibm_job <- data.frame(rbindlist(ibm_job))
ibm_job$links <- as.character(ibm_job$links)

save(ibm_job,file="IBM_Job.RData")
