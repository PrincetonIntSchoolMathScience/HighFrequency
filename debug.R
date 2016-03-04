toscore <- function(sentences){
  n <- 0
    for (i in 1: length(pos.list)){
        n = n+ str_count(as.character(sentences),as.character(pos.list[[i]]))
    }  
    for (k in 1: length(neg.list)){
        n = n-str_count(as.character(sentences),as.character(neg.list[[k]]))
    }
  return(n)
}
scorelist <- lapply(some_txt,toscore)


library(stringr)
  str_count("man drives man", "man")
str_match_all()
