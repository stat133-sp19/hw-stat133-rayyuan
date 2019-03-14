##################################################
## title:Shots Data
## description: preparing the data that will contain the required variables for visualization
## inputs: andre-iguodala.csv,kevin-durant.csv,draymond-green.csv,klay-thompson.csv,stephen-curry.csv
## outputs:shots-data.csv, which contains the required variables for visualization
##################################################
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)

curry$name <- "Stephen Curry"
durant$name <- "Kevin Durant"
thompson$name <- "Klay Thompson"
green$name <- "Draymond Green"
iguodala$name <- "Andre Iguodala"

curry[curry$shot_made_flag == "y", "shot_made_flag"] <- "shot_yes"
curry[curry$shot_made_flag == "n", "shot_made_flag"] <- "shot_no"
durant[durant$shot_made_flag == "y", "shot_made_flag"] <- "shot_yes"
durant[durant$shot_made_flag == "n", "shot_made_flag"] <- "shot_no"
thompson[thompson$shot_made_flag == "y", "shot_made_flag"] <- "shot_yes"
thompson[thompson$shot_made_flag == "n", "shot_made_flag"] <- "shot_no"
green[green$shot_made_flag == "y", "shot_made_flag"] <- "shot_yes"
green[green$shot_made_flag == "n", "shot_made_flag"] <- "shot_no"
iguodala[iguodala$shot_made_flag == "y", "shot_made_flag"] <- "shot_yes"
iguodala[iguodala$shot_made_flag == "n", "shot_made_flag"] <- "shot_no"

curry$minute <- (curry$period - 1) * 12 + (12 - curry$minutes_remaining)
durant$minute <- (durant$period - 1) * 12 + (12 - durant$minutes_remaining)
thompson$minute <- (thompson$period - 1) * 12 + (12 - thompson$minutes_remaining)
green$minute <- (green$period - 1) * 12 + (12 - green$minutes_remaining)
iguodala$minute <- (iguodala$period - 1) * 12 + (12 - iguodala$minutes_remaining)

sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

shots_data <- rbind(curry, durant, thompson, green, iguodala)
write.csv(x = shots_data, file = "../data/shots-data.csv")
sink(file = '../output/shots-data-summary.txt')
summary(shots_data)
sink()
