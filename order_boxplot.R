# how to order a boxplot

# generate some dummy data
set.seed(1)
y <- rnorm(100)
labs <- rep(LETTERS[1:10], each = 10)
dat <- data.frame(y, labs)

# take a look
boxplot(y ~ labs, data = dat)dat

# reverse the order of the levels
dat$labs <- factor(dat$labs, levels = LETTERS[10:1])

# take another look
boxplot(y ~ labs, data = dat)
