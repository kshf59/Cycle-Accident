library(readr)
library(dplyr)
library(ggplot2)
road_case <- read.csv("Cycle Accident/cycle/road type.csv")
View(road_case)
#road_case <- t(road_case)

road_case_2016 <- select(.data = road_case, 도로형태대분류, 도로형태, 기준년도, X2016)
View(road_case_2016)
colnames(road_case_2016) <- c("도로형태대분류","도로형태","구분","발생건수")
View(road_case_2016)

# 도로형태 대분류별
road_case_sum <- road_case_2016[road_case_2016$도로형태 %in% "합계",]
View(road_case_sum)
case_sum <- road_case_sum[road_case_sum$구분 %in% "발생건수",]
case_sum <- case_sum[,-c(2)]
case_sum <- case_sum[-c(1),]
case_sum$발생건수 <- gsub(",","",case_sum$발생건수)
case_sum <- transform(case_sum, 발생건수 = as.numeric(발생건수))
View(case_sum)
ggplot(case_sum, aes(x=도로형태대분류,y=발생건수,fill=구분)) + geom_bar(stat="identity")

# 도로형태별
road_case_sum2 <- road_case_2016[road_case_2016$구분 %in% "발생건수",]
road_case_sum2 <- road_case_sum2[!road_case_sum2$도로형태 %in% "합계",]
road_case_sum2$발생건수 <- gsub(",","",road_case_sum2$발생건수)
road_case_sum2 <- transform(road_case_sum2,발생건수 = as.numeric(발생건수))
View(road_case_sum2)
ggplot(road_case_sum2, aes(x=도로형태대분류,y=발생건수,fill=도로형태)) + geom_bar(stat="identity")
