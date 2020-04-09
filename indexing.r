# some ways to index

# sim some data
nsim <- 25
set.seed(311828578)
rawnums <- sample(1:10^5, nsim, replace = FALSE)
reps <- rpois(nsim, 2) + 1

a <- rep(rawnums, reps)

###
# the task:
# i1 goes from 1 to length(unique(a)) and changes when a does
# i2 is a running index for each unqiue(a) restarting at 1
###

### reinvent the wheel
n <- length(a)

i1 <- c(1, cumsum(a[2:n] != a[1:(n - 1)]) + 1)
i2 <- i1*NA
for(p in 1:max(i1)) {
  i2[i1 == p] <- 1:length(which(i1 == p))
}

# check
cbind(a, i1, i2)



### nesty for i2
i2_prime <- unlist(lapply(split(a, a), seq_along))

# check
cbind(a, i1, i2, i2_prime)
