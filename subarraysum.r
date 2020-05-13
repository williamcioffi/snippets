# cull a vector (find a subarray) so that sum is less than or equal to a given sum
# this can be better optimized...

find_subvec <- function(x, targetsum) {
  subx_index <- vector(length = length(x))
  cursum <- 0
  maxsum <- 0
  st <- 1

  x <- sort(x, decreasing = TRUE)
  for(i in 1:length(x)) {
    if(cursum <= targetsum) maxsum <- max(maxsum, cursum)

    while(cursum + x[i] > targetsum & st < i) {
      cursum <- cursum - x[st]
      subx_index[st] <- FALSE
      st <- st + 1
    }

    cursum <- cursum + x[i]
    subx_index[i] <- TRUE
  }

  x[subx_index]
}
