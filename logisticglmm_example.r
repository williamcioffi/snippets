library(lme4)

set.seed(1)

#inverse logit function
invlogit <- function(x) 1 / (1 + exp(-x))

#simulate some data
#n <- 1					#if bernoulli
n <- rpois(100,10)   	#trials
ran <- rnorm(10) 		#random effects
w <- rep(ran, 10)    	#random effects variable
groups <- rep(1:10, 10) #group variable
x <- rnorm(100) 		#predictor
b <- 1.5    				#beta
b0 <- 0					#intercept
p <- invlogit(b*x + w + b0) 	#binomial probability
y <- rbinom(100, n, p)  #binomial successes

#random intercept model
glmer.model1 <- glmer (
					cbind(y, n-y) ~ x 
					+ (1|groups),
					family = "binomial"
				)

#take a look at the group by group coefficients
coefficients(glmer.model1)
				
#random slope and intercept model
glmer.model2 <- glmer (
					cbind(y, n-y) ~ x 
					+ (1|groups)
					+ (x|groups),
					family = "binomial"
				)
				
#take a look at the group by group coefficients
coefficients(glmer.model2)

#plot
u_groups <- unique(groups)
n_groups <- length(u_groups)
col_groups <- 1:n_groups * NA
for(i in 1:n_groups) 
	col_groups[which(groups == u_groups[i])] <- rainbow(n_groups)[i]


ratio <- y/n
#ratio <- jitter(ratio) #if bernoulli
plot(ratio ~ x, pch = 16, col = col_groups)

#draw curves
for(i in 1:n_groups) {
	bet = coefficients(glmer.model2)$groups[i, 2]
	int = coefficients(glmer.model2)$groups[i, 1]
	
	thisgroup = which(groups == u_groups[i])
	
	curve (
				invlogit(bet*x + int),
				lty = 1,
				col = col_groups[i],
				xlim = c(min(x, na.rm = TRUE), max(x, na.rm = TRUE)),
				add = TRUE
	)
}