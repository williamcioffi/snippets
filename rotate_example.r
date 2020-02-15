###
# rotate along a ols line, e.g., centroids

# rotation function
rot <- function(x,y,theta) {
  cbind(x*cos(theta) - y*sin(theta), x*sin(theta) + y *cos(theta))
}

# import example centroids to rotate
cen <- read.table(
  text = "id,point_x,point_y
  1,775125.2941,7143769.463
  2,769092.9315,7152012.59
  3,776398.4907,7147422.794
  4,777116.4884,7148601.413
  4,776311.9042,7146863.146
  5,779310.7058,7141260.952
  6,775044.4349,7143194.94
  7,764961.1306,7156014.789
  8,772502.5477,7149289.373
  9,765667.4801,7155985.065
  10,772217.3778,7150147.382",
  header = TRUE, sep = ',', stringsAsFactors = FALSE
)

# grab unrotated centroids
x0 <- cen[,'point_x']
y0 <- cen[, 'point_y']

# set min x to origin
x1 <- x0 - min(x0)

# fit a line
m1 <- lm(y0 ~ x1)

# grab the int(ercept) and bet(a)
int <- coef(m1)[1]
bet <- coef(m1)[2]

# set min y to origin
y1 <- y0 - int

# calculate rotation angle theta
theta <- -atan(bet)

# rotate the centroids
cen_rotated <- rot(x1, y1, theta)

# x has to be dragged back to 0
x_rotated <- cen_rotated[, 1] - min(cen_rotated[, 1])
y_rotated <- cen_rotated[, 2]



###
### make a nice plot of the rotation
###

# make the plotting area
xx <- c(x1, cen_rotated[, 1])
yy <- c(y1, cen_rotated[, 2])

plot(xx, yy, 
  type = 'n', main = "", xlab = "", ylab = ""
)

# plot original (shifted to origin)
points(x1, y1, pch = 16)

# plot rotated
points(cen_rotated, pch = 16, col = "red")

## plot some frills
# guidelines
abline(h = 0, lty = 3)
abline(v = 0, lty = 3)
abline(0, bet)

# nice arrow
theta_seq <- seq(0, theta, .001)
x_seq <- median(x1)
y_seq <- x_seq * bet
rot_seq <- rot(x_seq, y_seq, theta_seq)

lines(rot_seq, col = "blue")

g0 <- rot_seq[length(rot_seq[, 1]) - 1, 1]
h0 <- rot_seq[length(rot_seq[, 1]) - 1, 2]
g1 <- rot_seq[length(rot_seq[, 1]), 1]
h1 <- rot_seq[length(rot_seq[, 1]), 2]

arrows(g0, h0, g1, h1, col = "blue", length = .1)
