# reduce variance false positives

# get a random seed
# my oricd id is 0000-0003-1182-8578
orcid <- 0000000311828578
set.seed(orcid)

# regular
n <- 100
nsim <- 1000

bvalue <- vector(length = nsim)
x <- rnorm(n)  
for(i in 1:nsim) {
  y <- rnorm(n)
  bvalue[i] <- coef(summary(lm(y ~ x)))[2, 1]
}
  
hist(bvalue)

bvalue2 <- vector(length = nsim)
x <- rnorm(n)
for(i in 1:nsim) {
  y <- rnorm(n, sd = 0.05)
  bvalue2[i] <- coef(summary(lm(y ~ x)))[2, 1 ]
}

windows()
hist(bvalue2)


