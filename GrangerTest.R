year<-ts(CompareData$Time2) 
egg<-ts(CompareData$summary.score)
chic<-ts(CompareData$CLOSE)
"granger" <-function(d, L, k = 1) 
{
  #d is a bivariate time-series:  regress d[,k] on L lags of d[,1] and d[,2].
  #This is a modified version for R, in which the command ts.matrix was substituted by ts.intersect.
  names.d <- dimnames(d)[[2]]
  D <- d
  for(i in 1:L) 
  {
    D <-ts.intersect(D, lag(d,  i))
    #don't you find -1 bizarre here and it annoying to need the loop
  }
  dimnames(D)[[2]] <- paste(rep(names.d, L + 1), "_", rep(0:L, times = rep(2, L + 1)), sep = "")
  y  <- D[, k]
  n  <- length(y)
  x1 <- D[,  - (1:2)]
  x0 <- x1[, ((1:L) * 2) - (k %% 2)]
  z1 <- lm(y ~ x1)
  z0 <- lm(y ~ x0)
  S1 <- sum(z1$resid^2)
  S0 <- sum(z0$resid^2)
  ftest <- ((S0 - S1)/L)/(S1/(n - 2 * L - 1))
  list(ftest = ftest, p.val = 1 - pf(ftest, L, n - 2 * L - 1), R2 = summary(z1)$r.squared)
}
granger(cbind(egg,chic),L=1)
