# these two functions use the color pallete
# described in https://sashat.me/2017/01/11/list-of-20-simple-distinct-colors/
# and inspired by Kenneth Kelly's 22 colors of maximum contrast
# Kelly's are better matched for "brightness" but these are more distinct to my eyes

trubetskoy_colors <- function(n) {
	if(n > 22) stop("i need an n in [1, 22]")
	c("#e6194b", "#3cb44b", "#ffe119", "#4363d8", "#f58231", "#911eb4", "#46f0f0", "#f032e6", "#bcf60c", "#fabebe", "#008080", "#e6beff", "#9a6324", "#fffac8", "#800000", "#aaffc3", "#808000", "#ffd8b1", "#000075", "#808080", "#ffffff", "#000000")[1:n]
}


trubetskoy_colors_nogreyscale <- function(n) {
	if(n > 19) stop("i need an n in [1, 19]")
	c("#e6194b", "#3cb44b", "#ffe119", "#4363d8", "#f58231", "#911eb4", "#46f0f0", "#f032e6", "#bcf60c", "#fabebe", "#008080", "#e6beff", "#9a6324", "#fffac8", "#800000", "#aaffc3", "#808000", "#ffd8b1", "#000075")[1:n]
}

