library(streamR)
load("my_oauth.Rdata")
filterStream("tweets.json", track = c("Obama", "Biden"), 
             oauth = my_oauth)
tweets.df <- parseTweets("tweets.json", simplify = TRUE)
c( length(grep("obama", tweets.df$text, ignore.case = TRUE)),
   length(grep("biden", tweets.df$text, ignore.case = TRUE)) )

# library(ggplot2)
# library(grid)
# map.data <- map_data("state")
# points <- data.frame(x = as.numeric(tweets.df$lon), y = as.numeric(tweets.df$lat))
# points <- points[points$y > 25, ]
# ggplot(map.data) + geom_map(aes(map_id = region), map = map.data, fill = "white", 
#                             color = "grey20", size = 0.25) + expand_limits(x = map.data$long, y = map.data$lat) + 
#   theme(axis.line = element_blank(), axis.text = element_blank(), axis.ticks = element_blank(), 
#         axis.title = element_blank(), panel.background = element_blank(), panel.border = element_blank(), 
#         panel.grid.major = element_blank(), plot.background = element_blank(), 
#         plot.margin = unit(0 * c(-1.5, -1.5, -1.5, -1.5), "lines")) + geom_point(data = points, 
#                                                                                  aes(x = x, y = y), size = 1, alpha = 1/5, color = "darkblue")
# 
