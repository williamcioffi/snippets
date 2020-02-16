# functions for converting binary sighting matrix to a reasonable dataframe and back again

# covnert binary sighting to df
sightbin2df <- function(mat) {
  id <- vector()
  sight <- vector()
  for(i in 1:nrow(mat)) {
    cursight <- colnames(mat)[mat[i, ] != 0]
    curid <- rep(rownames(mat)[i], length(cursight))
  
    id <- c(id, curid)
    sight <- c(sight, cursight)
  }

  data.frame(id, sight)
}

# convert df to binary sighting
df2sightbin <- function(datdf) {
  require(reshape2)
  datdf$value <- rep(1, nrow(datdf))
  mat <- acast(datdf, datdf[, 1] ~ datdf[, 2], value.var = 'value')
  mat[is.na(mat)] <- 0
  mat
}
