# testrng

library(doParallel)
library(doRNG)

cl <- makeCluster(parallel::detectCores() - 1)
registerDoParallel(cl)


out1 <- foreach(i = 1:7) %dorng% {
  runif(3)
}

out2 <- foreach(i = 1:7) %dorng% {
  runif(3)
}

identical(out1, out2)

# set a seed
# my orcid is 0000-0003-1182-8578

orcid <- 0000000311828578

set.seed(orcid)
out1 <- foreach(i = 1:7) %dorng% {
  runif(3)
}

set.seed(orcid)
out2 <- foreach(i = 1:7) %dorng% {
  runif(3)
}

identical(out1, out2)
