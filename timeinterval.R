###
# timeinterval proof of concept

# required helper function
matchtimes <- function(t1, t2) {
  # t1, t2 are numeric
  findInterval(t1, c(-Inf, head(t2, -1)) + c(0, diff(t2)/2))
}

# the candidate
timeinterval <- function(t1, t2) {
  # t1, t2 must be increasing numeric
  t2prime <- t2[matchtimes(t1, t2)]
  t1prime <- t1[matchtimes(t2, t1)]
  st <- min(t1prime[1], t2prime[1])
  en <- min(t1prime[length(t1prime)], t2prime[length(t2prime)])
  
  list(start = st, end = en)
}


##
## test it
##

# test 1
a <- c(1, 5, 7, 9.2234, 105)
b <- c(99, 99.5, 99.7, 100)
# correct answer: [99, 100]
timeinterval(a, b)

# test 2
a <- 1:10
b <- 5:10 + .5
# correct answer [5.5, 10]
timeinterval(a, b)

# test 3
a <- 5:10
b <- c(1, 3, 5.5)
# correct answer [5, 5.5]
timeinterval(a, b)
