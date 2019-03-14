library(ggplot2)
library(grid)
library(jpeg)

court_file <- "../images/nba-court.jpg"

#Klay Shot Chart
thompson_shot_chart <- ggplot(data = thompson) +annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 Season)') +theme_minimal()

pdf(file = "../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
thompson_shot_chart
dev.off()

#Steph Shot Chart
curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +ggtitle('Shot Chart: Stephen Curry (2016 Season)') +theme_minimal()

pdf(file = "../images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
curry_shot_chart
dev.off()

#KD Shot Chart
durant_shot_chart <- ggplot(data = durant) +annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 Season)') +theme_minimal()

pdf(file = "../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
durant_shot_chart
dev.off()

#Andre Shot Chart
iguodala_shot_chart <- ggplot(data = iguodala) +annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 Season)') +theme_minimal()

pdf(file = "../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
iguodala_shot_chart
dev.off()

#Draymond Shot Chart
green_shot_chart <- ggplot(data = green) +annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 Season)') +theme_minimal()

pdf(file = "../images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
green_shot_chart
dev.off()

shot_data <-read.csv("../data/shots-data.csv", stringsAsFactors = FALSE)
shot_data_chart <- ggplot(data = shot_data) +annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 Season)') +theme_minimal()+facet_wrap(vars(name),ncol=3)
shot_data_chart

pdf(file = "../images/gsw-shot-charts.pdf", width = 8, height = 7)
shot_data_chart
dev.off()

png(filename = "../images/gsw-shot-charts.png",res=120,width=8,height=7,units='in')
shot_data_chart
dev.off()




