list.of.packages <- c("twitteR","httr", "bit", "bit64", "rjson", "DBI","curl", "base64enc", "httpuv")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) {
  install.packages(new.packages)
  }


sapply(list.of.packages, library, character.only = TRUE)

library (twitteR)
library(tm)

setup_twitter_oauth(consumer_key = 'me4TzRBA9mUpU0Fndn1mv7oWw', consumer_secret = 'N1Z9Ev0z6SPb1DpiSImlgOXxAEyao54tVzkvHY09f2yayem5sg', access_token = '4428756093-MbpUEsfNxviePaWmv5X6cv73NT0omVlmLSHkRge', access_secret = 'BDNV4leQjnrcn0KjZEL6nfOwveP5WrmztJcGRYgzUjQev')
searchTwitter('house', 
              geocode='40.7361,-73.9901,5mi',  
              n= 100, 
              retryOnRateLimit=1)
#authentification

stock_tweets1230<-searchTwitter('stock+market',n=20000, since = '2015-12-30', until = '2015-12-31')
stock_tweets1231<-searchTwitter('stock+market',n=20000, since = '2015-12-31', until = '2016-01-01')
stock_tweets0101<-searchTwitter('stock+market',n=20000, since = '2016-01-01', until = '2016-01-02')
stock_tweets0102<-searchTwitter('stock+market',n=20000, since = '2016-01-02', until = '2016-01-03')
stock_tweets0103<-searchTwitter('stock+market',n=20000, since = '2016-01-03', until = '2016-01-04')
stock_tweets0104<-searchTwitter('stock+market',n=20000, since = '2016-01-04', until = '2016-01-05')
stock-tweets0105<-searchTwitter('stock+market',n=20000, since = '2016-01-05', until = '2016-01-06')
stock_tweets0106<-searchTwitter('stock+market',n=20000, since = '2016-01-06', until = '2016-01-07')
stock_tweets0107<-searchTwitter('stock+market',n=20000, since = '2016-01-07', until = '2016-01-08')
stock_tweets0108<-searchTwitter('stock+market',n=20000, since = '2016-01-08', until = '2016-01-09')
stock_tweets0109<-searchTwitter('stock+market',n=20000, since = '2016-01-09', until = '2016-01-10')
stock_tweets0110<-searchTwitter('stock+market',n=20000, since = '2016-01-10', until = '2016-01-11')
stock_tweets0111<-searchTwitter('stock+market',n=20000, since = '2016-01-11', until = '2016-01-12')
stock_tweets0112<-searchTwitter('stock+market',n=20000, since = '2016-01-12', until = '2016-01-13')
stock_tweets0113<-searchTwitter('stock+market',n=20000, since = '2016-01-13', until = '2016-01-14')
count  = 1
while (T){
  #stock_tweets(count) <- c(stocktweets,is.vector(searchTwitter('stock+market', n = 1000 , lang = en)))
  stock_tweets <- c(stocktweets,is.vector(searchTwitter('stock+market', n = 1000 , lang = en)))
  stock_tweets(count) <- as.list(stock_tweets)
  count = count +1
  Sys.sleep(60)
}
#Twitter Keywords Searching

#class(stock_tweets1230)
stock_text <-sapply(stock_tweets1230,function(x) x$getText())
stock_corpus <- Corpus(VectorSource(stock_text))
#inspect(stock_corpus)
stock_clean <- tm_map(stock_corpus,removePunctuation)
stock_clean <- tm_map(stock_clean,content_transformer(tolower))
stock_clean <- tm_map(stock_clean, removeWords, stopwords("english"))
stock_clean <- tm_map(stock_clean,stripWhitespace)
#inspect(stock_clean)
