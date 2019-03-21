# simulate some data
set.seed(10)
n <- 100
month <- sample(c(6, 7, 8), n, replace = TRUE)
year <- sample(c(2016, 2017, 2018), n, replace = TRUE)
transect_id <- cumsum(sample(c(1, 0), n, replace = TRUE)) + 1

dat <- data.frame(transect_id, month, year)

# so if each row is a sighting

# count up the number of sightings in each month-year
num_sightings <- aggregate(transect_id ~ month + year, dat, length)

# count up the number of transects in each month-year
num_transects <- aggregate(transect_id ~ month + year, dat, function(x) length(unique(x)))

# make a new data frame with the new variables combined
dat_yearmonth <- data.frame(month = num_sightings$month, year = num_sightings$year, numsight = num_sightings$transect_id, numtrans = num_transects$transect_id)

# calculate your sighting per transect rate
dat_yearmonth$numsight_per_transect <- dat_yearmonth$numsight / dat_yearmonth$numtrans

# calculate per month mean
dat_month <- aggregate(numsight_per_transect ~ month, dat_yearmonth, mean)

# calculate per month sd
dat_month$sd <- aggregate(numsight_per_transect ~ month, dat_yearmonth, sd)[, 2]

# calculate the tops and bottoms of the error bars
dat_month$top <- dat_month$numsight_per_transect + dat_month$sd
dat_month$bot <- dat_month$numsight_per_transect - dat_month$sd

# make a blank plot first big enough to hold everything including the error bars
plot(
	rep(dat_month$month, 2), c(dat_month$top, dat_month$bot), # x and the extreme ys
	las = 1, # make the numbers on the y axis go the right way
	type = 'n', # don't plot anything
	xlab = "", # no xlabel because it will be self explanatory
	ylab = "num sightings / transect",
	xaxt = 'n', # skip the xaxis we'll draw it ourselves
	xlim = c(5.75, 8.25) # just some padding on the edges
)

# add in the error bars first
segments(dat_month$month, dat_month$bot, dat_month$month, dat_month$top)

# add in mean points next using an opaque marker
points(
	dat_month$month, dat_month$numsight_per_transect, # x, y
	pch = 21, # opaque marker
	bg = "white" # fill of the marker
)

# add in the xaxis
axis(1, at = c(6, 7, 8), lab = c("June", "July", "August"))
