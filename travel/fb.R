############################################
#     使用 Facebook 應用程式編號與密鑰     #
############################################
require("Rfacebook")
fb.oauth <- fbOAuth(
  app_id="1107571462674704",
  app_secret="65eb1ad60b093ab96e8bec296675a2ad",
  extended_permissions = TRUE)
me <- getUsers("me",token=fb.oauth)
me$name
############################################
#將這個 token 儲存起來，以備未來使用
############################################
save(fb.oauth, file="fb_oauth")
#paste0("https://graph.facebook.com/search?q=[大眾廟]&type=place¢er=25.15887,121.43382&distance=1000&access_token=",fb.oauth)
############################################
#未來在使用前，只要使用 load 載入這個 token 就可以直接使用
############################################
load("fb_oauth")
############################################
#首先複製 facebook 粉絲專頁的 id，而常見的 id 有兩種，一種是純數字的，一種則是使用者自己命名的：
#https://www.facebook.com/G-T-Wang-489529864441673/
#  https://www.facebook.com/humansofnewyork
#接著使用 getPage 來取得粉絲專頁上面的文章資訊：
############################################
page.id <- "287128444662086" # G.T.Wang 粉絲專頁
page <- getPage(page.id, token=fb.oauth, n = 300)
str(page)
############################################
#取出按「讚」數最高的文章：
############################################
top.post <- page[which.max(page$likes_count), ]
top.post

