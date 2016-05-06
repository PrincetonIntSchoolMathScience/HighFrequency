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
library(stringr)

filterStream("tweets.json", track = c("Stock Market", "AAPL","GOOGL"),  oauth = my_oauth)
clean_txt <- clean(tweets.df$text)
Time1 <- str_split_fixed(tweets.df[, "created_at"] , pattern = "\\+", n=2)[, 1]
Time2<- strptime(Time1, format = "%a %b %d %H:%M:%S")
DataChart <- data.frame(clean_txt,Time2, toscore(clean_txt))

library(dplyr)
DataChart2 <- DataChart %>% 
  group_by(Time2) %>%
  summarise(summary.score = sum(toscore.clean_txt.))

library(lubridate)
DFF <- DataChart2
second(DFF$Time2) <- 0

DFF <- DFF %>%
  group_by(Time2)%>%
  summarize(summary.score = sum(summary.score))

CompareData <- merge.data.frame(DFF,PriceTS)
