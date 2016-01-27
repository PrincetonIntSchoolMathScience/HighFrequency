getQuote.yahoo.today<-function(Symbols){
  library('data.table')
  library('quantmod')
  what = yahooQF(names = unlist(strsplit("Symbols,Last Trade Time, Last Trade Date,Open,Days High, Days Low, Last Trade(Pirce Only), Volume",",")))
  url = paste('http://download.finance.yahoo.com/d/quotes.csv?s=',Symbols,'&f=',what[[1]],sep = '')
  
  txt = gsub ('"',",",readLines(url))
  txt = gsub (",+",",",txt)
  txt = sub(",","",txt)
  txt = c(txt,"\n")
  cat(txt,file = "data.csv",append =T)
}

Symbols = "^GSPC"

names = "Symbol,Time,Date,Open,High,Low,Close,Volume\n"

cat(names,file = "data.csv",append = F)

count  = 1
while (T){
  getQuote.yahoo.today(Symbols)
  Sys.sleep(60)
  
}