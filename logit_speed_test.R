# test which of these is faster
# this is stupid because i'm never doing a billion logits but i'm curious
library(microbenchmark)

# logit and invlogit
logit1 <- function(p) log(p / (1 - p))
logit2 <- function(p) log(p) - log(1 - p)
logit3 <- function(p) -log(1/p - 1)

invlogit1 <- function(a) exp(a) / (exp(a) + 1)
invlogit2 <- function(a) 1 / (1 + exp(-a))

xx <- seq(0, 1, length = 10000)
yy <- logit1(xx)

plot(microbenchmark(logit1(xx), logit2(xx), logit3(xx)))
plot(microbenchmark(invlogit1(yy), invlogit2(yy)))