#Data extraction and clean up
#http://www.marketcalls.in/database/google-realtime-intraday-backfill-data.html
# EXCHANGE%3DNSE
# MARKET_OPEN_MINUTE=555 9:15 AM
# MARKET_CLOSE_MINUTE=930 3:30 PM
# INTERVAL=60
# COLUMNS=DATE,CLOSE,HIGH,LOW,OPEN
# DATA=
#   TIMEZONE_OFFSET=330 Timestamp converts to usual time and plus offset. However, it is not UTC. IT IS THE REAL TIME MARKET OPEN
library(RCurl)
library(stringr)
tmp <- getURL(
  str_c('http://www.google.com/finance/getprices?',
        'q=.NSEI',
        '&i=60',
        '&p=15d',
        '&f=d,o,h,l,c,v')
)

tmp <- str_split(tmp,'\n')
tmp <- unlist(tmp)

offset <- tmp %>% 
  str_subset("TIMEZONE_OFFSET=") %>%
  str_replace(pattern = 'TIMEZONE_OFFSET=', "") %>%
  as.numeric()

offset.line.num <- which(str_detect(tmp, pattern = "TIME"))


data <- tmp[ -c(1:offset.line.num) ]
#data <- str_replace(data, str_c("a", as.character(base.date) ), "0")

data <- str_split(data, ",")
data <- do.call('rbind',data)
df <- as.data.frame(data)

names(df) <- tmp %>% 
  str_subset("COLUMNS=") %>%
  str_replace(pattern = 'COLUMNS=', "") %>%
  str_split(",") %>% 
  unlist() 

PriceTS <- subset(df,select = c(1,2))
PriceTS["Time2"]<-NA
base.date<-0
for (i in 1:length(PriceTS$DATE)){
  if (str_detect(PriceTS$DATE[i], pattern = "a")==TRUE){
    base.date <- PriceTS$DATE[i] %>%
      str_extract("a[0-9]+") %>%
      str_extract("[0-9]+") %>%
      as.numeric()
    b.d <- as.POSIXct(base.date+offset*60, origin = '1970-01-01',tz = "UTC")
    b.d <- str_replace(b.d," UTC","")
    PriceTS$Time2[i]<-b.d
  }
  else{
    b.d <- as.POSIXct(base.date+(offset+as.numeric(as.character(PriceTS$DATE[i])))*60, origin = '1970-01-01',tz = "UTC")
    b.d <- str_replace(b.d," UTC","")
    PriceTS$Time2[i]<-b.d
  }
  
}

PriceTS <- subset(PriceTS,select = c(2,3))

