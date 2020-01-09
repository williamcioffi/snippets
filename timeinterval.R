###
# timeinterval proof of concept

timeinterval2 <- function(t1, t2) {
  st <- max(min(t1), min(t2))
  en <- min(max(t1), max(t2))
  dur <- en - st
  if(dur < 0) {
    st <- NA
    en <- NA
    dur <- 0
  }
  list(st = st, en = en, dur = dur)
}


# test 1
a <- c(1, 5, 7, 9.2234, 105)
b <- c(99, 99.5, 99.7, 100)
# correct answer: [99, 100]
timeinterval2(a, b)

# test 2
a <- 1:10
b <- 5:10 + .5
# correct answer [5.5, 10]
timeinterval2(a, b)

# test 3
a <- 5:10
b <- c(1, 3, 5.5)
# correct answer [5, 5.5]
timeinterval2(a, b)

# test 4
a <- 1:5
b <- 10:15
timeinterval2(a, b)
