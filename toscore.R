 sent <- "good well bad"
toscore <- function(sentences){
  result_score <- runif(length(sentences))
  for(a in 1:length(sentences) ){
    sentence <- sentences[a]
 
    pos_sum <- 0
    neg_sum <- 0
    pos_words <- as.character(unlist(pos.list))
    neg_words <- as.character(unlist(neg.list))
    p <- str_count(sentence, fixed(pos_words))
    if (sum(p)>0){
    index_pos<-which( p>0, arr.ind=TRUE)
    value_pos<- p[index_pos]
    words_pos<-pos_words[index_pos]
    for (i in 1:length(value_pos)){
      for (j in 1:length(value_pos)){
        if(i==j){
        }
        else {
          if (str_detect(words_pos[i],words_pos[j])==TRUE){
            if(value_pos[j]!=0){
              value_pos[j]<-value_pos[j]-value_pos[i]
            }
          }
        }
      }
    }
    pos_frame <- data.frame(value_pos, words_pos)
    pos_sum <-sum(value_pos)
    }
    n <- str_count(sentence, fixed(neg_words))
    if(sum(n)>0){
    index_neg<-which( n>0, arr.ind=TRUE)
    value_neg<- n[index_neg]
    words_neg<-neg_words[index_neg]
    for (i in 1:length(value_neg)){
      for (j in 1:length(value_neg)){
        if(i==j){
        }
        else {
          if (str_detect(words_neg[i],words_neg[j])==TRUE){
            if(value_neg[j]!=0){
              value_neg[j]<-value_neg[j]-value_neg[i]
            }
          }
        }
      }
    }
    neg_frame <- data.frame(value_neg, words_neg)
    neg_sum <-sum(value_neg)
    }
    m<- pos_sum - neg_sum
    
    result_score[a] <- m
    print(paste0("score progress ",a/length(sentences)*100, " %"))
  
  }
  return(result_score)
}


#toscore("terribleness")

#str_count(sent, pos_words)


