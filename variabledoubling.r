# variable doubling test

# set a seed
orcid <- 0000000311828578 # my orcid
set.seed(orcid)

nsim <- 100000
out <- matrix(NA, nsim, 4)

pb <- txtProgressBar(style = 3)
for(i in 1:nsim) {
if(i %% 100 == 0) setTxtProgressBar(pb, i/nsim)
  n <- 100
  x1 <- rnorm(n)
  y1 <- rnorm(n)
  z1 <- rnorm(n)
  w1 <- rnorm(n)

  resp <- y1 / x1
  resp2 <- y1 / w1
  pred <- x1 / z1

  out[i, 1] <- cor(pred, resp)
  out[i, 2] <- cor(pred, resp2)
  out[i, 3] <- cor(x1, y1)
  out[i, 4] <- cor(z1, y1)
  
}
close(pb)

par(mfrow = c(4, 1))
xrange <- range(out)
hist(out[, 1], nclass = 300, yaxt = 'n', ylab = '', xlab = '', xlim = xrange, main = 'cor(y/x ~ x/z)')
hist(out[, 2], nclass = 300, yaxt = 'n', ylab = '', xlab = '', xlim = xrange, main = 'cor(y/w ~ x/z)')
hist(out[, 3], nclass = 300, yaxt = 'n', ylab = '', xlab = '', xlim = xrange, main = 'cor(y ~ x)')
hist(out[, 4], nclass = 300, yaxt = 'n', ylab = '', xlab = '', xlim = xrange, main = 'cor(y ~ z)')
