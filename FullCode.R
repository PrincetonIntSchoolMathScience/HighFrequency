##this is full code
list.of.packages <- c("twitteR","httr", "bit", "bit64", "rjson", "DBI","curl", "base64enc", "httpuv","sentiment","ROAuth","plyr","dplyr","stringr","ggplot2")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) {
  install.packages(new.packages)
}
#require necessary libraries

sapply(list.of.packages, library, character.only = TRUE)
library (twitteR)
library(tm)

filterStream("tweets.json", track = c("Obama", "Biden"), timeout = 10, 
             oauth = my_oauth)
clean(tweets.df$text)
