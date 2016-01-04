#http://www.marketcalls.in/database/google-realtime-intraday-backfill-data.html

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

base.date <- tmp[ offset.line.num+1 ] %>%
  str_extract("a[0-9]+") %>%
  str_extract("[0-9]+") %>%
  as.numeric()
  
b.d <- as.POSIXct(base.date+offset*60, origin = '1970-01-01', tz='UTC')

library(lubridate)
#check in estern time
with_tz(b.d, "EST")

data <- tmp[ -c(1:offset.line.num) ]
data <- str_replace(data, str_c("a", as.character(base.date) ), "0")

data <- str_split(data, ",")
data <- do.call('rbind',data)
df <- as.data.frame(data)

names(df) <- tmp %>% 
  str_subset("COLUMNS=") %>%
  str_replace(pattern = 'COLUMNS=', "") %>%
  str_split(",") %>% 
  unlist()
