# beepr test
library(beepr)

for(i in 1:2) { Sys.sleep(1) }
beepr::beep("data/stop.wav")