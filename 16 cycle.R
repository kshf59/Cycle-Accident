library(ggmap)
library(ggplot2)
library(dplyr)
library(readr)
X2016_cycle_accident <- read_csv("Cycle Accident/2016 cycle accident.csv")


X2016 <- arrange(X2016_cycle_accident, 스팟코드)
X2016[1:188,5] <- "서울특별시"
X2016 <- filter(X2016, 관할경찰서 == "서울특별시")

#1 서울 지도 가져오기
kor <- get_map("seoul", zoom=11, maptype='roadmap')
#2, 지도에 찍을 위도, 경도, 이름 저장하기
kor.map <- ggmap(kor) + geom_point(data=X2016,
                                   aes(x=경도, y=위도),
                                   size=2,
                                   alpha=0.7,
                                   colour = "blue"
                                   )

kor.map + geom_text(data=X2016,
                    aes(x=경도, y=위도+0.005, label=발생건수),
                    size=2.5)


# 발생건수 10 이상

ten <- X2016 %>% filter(발생건수 >= 10)
ten <- ten[-2,]
ten <- ten[-2,]
ten <- ten[-2,]
ten <- ten[-6,]
View(ten)
