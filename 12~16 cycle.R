library(ggmap)
library(ggplot2)
library(dplyr)

library(readr)
X2012_2014_cycle_accident <- read_csv("Cycle Accident/2012_2014 cycle accident.csv")
X2015_cycle_accident <- read_csv("Cycle Accident/2015 cycle accident.csv")
X2016_cycle_accident <- read_csv("Cycle Accident/2016 cycle accident.csv")

X2012_14 <- arrange(X2012_2014_cycle_accident, 스팟코드)
X2012_14[1:576,5] <- "서울특별시"
X2012_14 <- filter(X2012_14, 관할경찰서 == "서울특별시")
X2015 <- arrange(X2015_cycle_accident, 스팟코드)
X2015[1:228,5] <- "서울특별시"
X2015 <- filter(X2015, 관할경찰서 == "서울특별시")
X2016 <- arrange(X2016_cycle_accident, 스팟코드)
X2016[1:188,5] <- "서울특별시"
X2016 <- filter(X2016, 관할경찰서 == "서울특별시")

#1 서울 지도 가져오기
kor <- get_map("seoul", zoom=11, maptype='roadmap')
#2, 지도에 찍을 위도, 경도, 이름 저장하기
kor.map <- ggmap(kor) + geom_point(data=X2012_14,
                                   aes(x=경도, y=위도),
                                   size=2,
                                   alpha=0.7,
                                   colour = "blue"
) + geom_point(data=X2015,
              aes(x=경도, y=위도),
              size=2,
              alpha=0.7,
              colour = "green"
) + geom_point(data=X2016,
               aes(x=경도, y=위도),
               size=2,
               alpha=0.7,
               colour = "red"
)

kor.map
