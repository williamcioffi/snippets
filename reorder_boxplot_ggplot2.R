# order a boxplot in ggplot2
library(ggplot2)

# generate some dummy data
set.seed(1)
y <- rnorm(100)
labs <- rep(LETTERS[1:10], each = 10)
dat <- data.frame(y, labs)

# take a look
p <- ggplot(dat, aes(x=labs, y=y))
p <- p + geom_boxplot()
p

# reorder the labs
dat$labs <- factor(dat$labs, levels = LETTERS[10:1])

# take another look


# take a look
p <- ggplot(dat, aes(x=labs, y=y))
p <- p + geom_boxplot()
p