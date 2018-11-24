library(lme4)
set.seed(1)

n <- 100 							# number of data points
ngroups <- 10 						# number of gorups
ran <- rnorm(ngroups) 				#random effects
w <- rep(ngroups, n/ngroups) 		# random effects variable
groups <- rep(1:ngroups, n/ngroups) # groups variable
x <- rnorm(100) 						# predictor
bet1 <- 1.5 							# beta
bet0 <- 0 							# interept
sigma <- 6							# error sigma

y <- x * bet1 + bet0 + rnorm(n, sd = sigma)

# look
plot(x, y, col = groups, pch = 16)

mod1 <- lm(y ~ x)
mod2 <- lmer(y ~ x + (x | groups))

coefs <- coef(mod2)$groups
for(i in 1:nrow(coefs)) {
	abline(coefs[i, 1], coefs[i, 2], col = i)
}