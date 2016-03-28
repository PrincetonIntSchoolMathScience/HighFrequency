source("toscore.R")

toscore("good")

lapply(some_txt,toscore)

scorelist <- lapply(some_txt,toscore)

for (i in 1:length(scorelist)){
  n = n+scorelist[[i]]
}

library(stringr)
  str_count("man drives man", "man")
str_match_all()
