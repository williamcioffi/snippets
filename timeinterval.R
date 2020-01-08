###
# timeinterval proof of concept

# helper function
matchtimes <- function(t1, t2) {
  # t1, t2 are numeric
  findInterval(t1, c(-Inf, head(t2, -1)) + c(0, diff(t2)/2))
}

# x1, x2 are inputs
# must be increasing numeric vectors
x1 <- c(1, 5, 7, 9.2234, 105)
x2 <- c(99, 99.5, 99.7, 100)

# another one to try
# x1 <- 1:10
# x2 <- 5:10 + .5

x2prime <- x2[matchtimes(x1, x2)]
x1prime <- x1[matchtimes(x2, x1)]
st <- min(x1prime[1], x2prime[1])
en <- min(x1prime[length(x1prime)], x2prime[length(x2prime)])

st
en

