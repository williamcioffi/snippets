# function for fitted line

drawafit <- function(mod, lty = 2, add = TRUE, ...) {
	fitfn <- function(x) cbind(1, x) %*% coef(mod)
	xx <- mod$mode[, 2]
	fro <- min(xx, na.rm = TRUE)
	too <- max(xx, na.rm = TRUE)
	
	curve(fitfn, from = fro, to = too, lty = lty, add = add, ...)
}