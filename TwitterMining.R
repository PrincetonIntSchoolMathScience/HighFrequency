#install necessary packages
list.of.packages <- c("twitteR","httr", "bit", "bit64", "rjson", "DBI","curl", "base64enc", "httpuv","sentiment","ROAuth","plyr","dplyr","stringr","ggplot2")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) {
  install.packages(new.packages)
  }

#require necessary libraries
sapply(list.of.packages, library, character.only = TRUE)
library (twitteR)
library(tm)

# after register the developer app on twitter, the consuemr key, consumer secret, acess token and 
#access secret will be given. Used for login in r.
#authentification
setup_twitter_oauth(consumer_key = 'me4TzRBA9mUpU0Fndn1mv7oWw', 
                    consumer_secret = 'N1Z9Ev0z6SPb1DpiSImlgOXxAEyao54tVzkvHY09f2yayem5sg', 
                    access_token = '4428756093-MbpUEsfNxviePaWmv5X6cv73NT0omVlmLSHkRge', 
                    access_secret = 'BDNV4leQjnrcn0KjZEL6nfOwveP5WrmztJcGRYgzUjQev')
 
#searchTwitter('house', 
           #   geocode='40.7361,-73.9901,5mi',  
            #  n= 100, 
             # retryOnRateLimit=1)
##Creating cumulative files of tweets

# mannualy collect twitter data --> the searching may vary and some data are missing because internet is unable to connect to Twitter
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
stock_tweets0114<-searchTwitter('stock+market',n=20000, since = '2016-01-14', until = '2016-01-15')
stock_tweets0115<-searchTwitter('stock+market',n=20000, since = '2016-01-15', until = '2016-01-16')
stock_tweets0116<-searchTwitter('stock+market',n=20000, since = '2016-01-16', until = '2016-01-17')
stock_tweets0117<-searchTwitter('stock+market',n=20000, since = '2016-01-17', until = '2016-01-18')
stock_tweets0118<-searchTwitter('stock+market',n=20000, since = '2016-01-18', until = '2016-01-19')
stock_tweets0119<-searchTwitter('stock+market',n=20000, since = '2016-01-19', until = '2016-01-20')
stock_tweets0120<-searchTwitter('stock+market',n=20000, since = '2016-01-20', until = '2016-01-21')
stock_tweets0121<-searchTwitter('stock+market',n=20000, since = '2016-01-21', until = '2016-01-22')
stock_tweets0122<-searchTwitter('stock+market',n=20000, since = '2016-01-22', until = '2016-01-23')
stock_tweets0123<-searchTwitter('stock+market',n=20000, since = '2016-01-23', until = '2016-01-24')
stock_tweets0124<-searchTwitter('stock+market',n=20000, since = '2016-01-24', until = '2016-01-25')
stock_tweets0125<-searchTwitter('stock+market',n=20000, since = '2016-01-25', until = '2016-01-26')
stock_tweets0126<-searchTwitter('stock+market',n=20000, since = '2016-01-26', until = '2016-01-27')
stock_tweets0127<-searchTwitter('stock+market',n=20000, since = '2016-01-27', until = '2016-01-28')
stock_tweets0128<-searchTwitter('stock+market',n=20000, since = '2016-01-28', until = '2016-01-29')
stock_tweets0129<-searchTwitter('stock+market',n=20000, since = '2016-01-29', until = '2016-01-30')
stock_tweets0130<-searchTwitter('stock+market',n=20000, since = '2016-01-30', until = '2016-01-31')
stock_tweets0131<-searchTwitter('stock+market',n=20000, since = '2016-01-31', until = '2016-02-01',lang = 'en')
stock_tweets<-searchTwitter('stock+market',n=200, since = '2016-01-31', until = '2016-02-01',lang = 'en')
stock_tweets0201<-searchTwitter('stock+market',n=20000, since = '2016-02-01', until = '2016-02-02')
stock_tweets0202<-searchTwitter('stock+market',n=20000, since = '2016-02-02', until = '2016-02-03')
stock_tweets0203<-searchTwitter('stock+market',n=20000, since = '2016-02-03', until = '2016-02-04')
# wish to achieve periodically proceed the data
count  = 1
while (T){
  #stock_tweets(count) <- c(stocktweets,is.vector(searchTwitter('stock+market', n = 1000 , lang = en)))
  stock_tweets <- c(stocktweets,is.vector(searchTwitter('stock+market', n = 1000 , lang = en)))
  stock_tweets_count <- as.list(stock_tweets)
  count = count +1
  Sys.sleep(60)
}
#Twitter Keywords Searching

tweets.df <- twListToDF(stock_tweets)

myCorpus <-Corpus(VectorSource(tweets.df$text))

## tm.plugin.mining for sentiment analysis
library(tm.plugin.sentiment)
library(tm.plugin.webmining)

# score corpus
corp_score <- score(myCorpus)
c<-0
# nn <- length(myCorpus)
# ff <- as.factor(5)## you can add validation set for example...
# ll <- split(as.matrix(myCorpus),ff)
some_txt = sapply(stock_tweets1230, function(x) x$getText())
score.sentiment<-function(sentences, pos.words, neg.words,)
checkscore(x)
for(i in length(some_txt)){
  some_txt_sample <- some_txt[i:(i+19)]
  some_txt_sample_corpus <- Corpus(VectorSource(some_txt_sample))
  corp_score_sample <- score(some_txt_sample_corpus)
  corp_score_sample
}
sentixts <- metaXTS(corp_score)

# chart sentiment scores
chartSentiment(sentixts)
#class(stock_tweets1230)
stock_text <-sapply(stock_tweets1230,function(x) x$getText())
some_txt = sapply(stock_tweets1230, function(x) x$getText())
# remove retweet entities
some_txt = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", some_txt)
# remove at people
some_txt = gsub("@\\w+", "", some_txt)
# remove punctuation
some_txt = gsub("[[:punct:]]", "", some_txt)
# remove numbers
some_txt = gsub("[[:digit:]]", "", some_txt)
# remove html links
some_txt = gsub("http\\w+", "", some_txt)
# remove unnecessary spaces
some_txt = gsub("[ \t]{2,}", "", some_txt)
some_txt = gsub("^\\s+|\\s+$", "", some_txt)
# define "tolower error handling" function 
try.error = function(x)
{
  # create missing value
  y = NA
  # tryCatch error
  try_error = tryCatch(tolower(x), error=function(e) e)
  # if not an error
  if (!inherits(try_error, "error"))
    y = tolower(x)
  # result
  return(y)
}
# lower case using try.error with sapply 
some_txt = sapply(some_txt, try.error)

# remove NAs in some_txt
some_txt = some_txt[!is.na(some_txt)]
names(some_txt) = NULL
# only run once
 pos <- read.table("p.txt")
neg <- read.table("n.txt")
pos.list <- as.list(as.data.frame(t(pos)))
neg.list <- as.list(as.data.frame(t(neg)))
#
toscore <- function(sentences){
  n <- 0
  for(i in length(sentences)){
    for (j in length(pos.list)){
      if(grepl(as.character(pos.list[[j]]),as.character(sentences))==TRUE){
        n = n+1
      }
    }
    for (k in length(neg.list)){
      if(grepl(as.character(neg.list[[k]]),as.character(sentences))==TRUE){
        n = n-1
      }
    }
  }
  return(n)
}
scorelist <- lapply(some_txt,toscore)
# The following codes are previously used for corpus format. However, it is much easier to use the txt cleaning methods
# It prevents the problem of different formats
stock_corpus <- Corpus(VectorSource(stock_text))
# WebCorpus(stock_corpus)
# #inspect(stock_corpus)
# stock_clean <- tm_map(stock_corpus,removePunctuation)
# stock_clean <- tm_map(stock_clean,content_transformer(tolower),lazy = TRUE)
# stock_clean <- tm_map(stock_clean, removeWords, stopwords("english"))
# stock_clean <- tm_map(stock_clean,stripWhitespace)
# #inspect(stock_clean)
