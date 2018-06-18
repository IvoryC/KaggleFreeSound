
# download the audio_train data folder
# download the train.csv file that has the labels for each sound file, and put it in the audio_train folder

# Make directories: automated_classification and manually_verified
# The lines below are the R code I used to move the files
# I think using sed might be more efficient, 
# but this was the fasted I could knock something out, so I didn't care that took several minutes to finish.

setwd("audio_train/")
csv = read.csv("train.csv", header=T)
head(csv)

csv$dest = as.factor(csv$manually_verified)
levels(csv$dest) = c("automated_classification", "manually_verified")
head(csv)

csv$newName = paste0(csv$dest, "/", csv$label, "--", csv$fname)
head(csv)

for (i in 1:nrow(csv)){system(paste("mv", csv[i,"fname"], csv[i,"newName"]))}