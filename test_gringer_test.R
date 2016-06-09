

#install.packages("lmtest")
library(lmtest)


?grangertest

str(ChickEgg)

data(ChickEgg)
grangertest(egg ~ chicken, order = 3, data = ChickEgg)

set.seed(1)
d_1 <- runif(100)
d_2 <- runif(100)

df <- data.frame("v1" = d_1, "v2" = d_2)
grangertest(v1 ~ v2, order = 1, data = df)

################
df <- data.frame("v1" = 1:100, "v2" = 2:101)
grangertest(v1 ~ v2, order = 1, data = df)


