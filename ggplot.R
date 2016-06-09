library(ggplot2)
SD<-ggplot(data = CompareData, aes(y = summary.score, x = 1)) + 
  geom_boxplot() +
  ylab("Score") +
  ggtitle("Score Distribution")
save(SD, file="ScoreDistribution.Rdata")