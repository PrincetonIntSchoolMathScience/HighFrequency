list.of.packages <- c("twitteR","httr", "bit", "bit64", "rjson", "DBI","curl", "base64enc", "httpuv")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) {
  install.packages(new.packages)
}
sapply(list.of.packages, library, character.only = TRUE)

library (twitteR)
library(tm)

setup_twitter_oauth(consumer_key = 'me4TzRBA9mUpU0Fndn1mv7oWw', consumer_secret = 'N1Z9Ev0z6SPb1DpiSImlgOXxAEyao54tVzkvHY09f2yayem5sg', access_token = '4428756093-MbpUEsfNxviePaWmv5X6cv73NT0omVlmLSHkRge', access_secret = 'BDNV4leQjnrcn0KjZEL6nfOwveP5WrmztJcGRYgzUjQev')

stock_tweets<-searchTwitter('stock',n=21, since = '2016-01-30', until = '2016-02-3',
                            lang = "en")

tweets.df <- twListToDF(stock_tweets)

myCorpus <-Corpus(VectorSource(tweets.df$text))

#library(devtools)
#install_github("mannau/tm.plugin.sentiment")
library(tm.plugin.sentiment)

corp <- score(myCorpus) # works only for limited number of documents in corpus?
sentixts <- metaXTS(corp, period = "days", k=1, aggFUN = mean)
chartSentiment(sentixts)





######################################################################
##original example from https://github.com/mannau/tm.plugin.sentiment
# Instead of twitter searching - for a souce of text courpus - 
# Use google finance publications to see words associated with certain stock

# install.packages("tm.plugin.webmining")

require(tm.plugin.webmining)

query = "AAPL"
data.from.google <- GoogleFinanceSource(params = list(hl = "en", q = query, ie = "utf-8",
                                                      start = 0, num = 20, output = "rss"))
corp = WebCorpus(data.from.google)


library(tm.plugin.sentiment)
# score corpus
corp <- score(corp)
sentixts <- metaXTS(corp)

# chart sentiment scores
chartSentiment(sentixts)

## tm.plugin.mining for sentiment analysis
library(tm.plugin.sentiment)
library(tm.plugin.webmining)
corp = WebCorpus(GoogleFinanceSource("AAPL"))

# score corpus
corp_score <- score(corp)
sentixts <- metaXTS(corp_score)
