library(ggmap)
library(ggplot2)
library(dplyr)

X2015 <- arrange(X2015_cycle_accident, 스팟코드)
X2015[1:228,5] <- "서울특별시"
X2015 <- filter(X2015, 관할경찰서 == "서울특별시")

#1 서울 지도 가져오기
kor <- get_map("seoul", zoom=11, maptype='roadmap')
#2, 지도에 찍을 위도, 경도, 이름 저장하기
kor.map <- ggmap(kor) + geom_point(data=X2015,
                                   aes(x=경도, y=위도),
                                   size=2,
                                   alpha=0.7,
                                   colour = "blue"
                                   )

kor.map + geom_text(data=X2015,
                    aes(x=경도, y=위도+0.005, label=발생건수),
                    size=2.5)


