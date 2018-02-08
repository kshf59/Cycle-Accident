library(readxl)
cycle_road2014 <- read_excel("cycle road2014.xls", 
                             col_types = c("numeric", "text", "text", 
                                           "numeric", "numeric", "numeric", 
                                           "numeric", "numeric", "numeric", 
                                           "numeric", "numeric"))
library(dplyr)
road <- rename(cycle_road2014,
               year = "기간",
               section = "구분",
               gu = "구분__1",
               tsec = "계",
               tleng = "계__1",
               csec = "자전거 전용도로",
               cleng = "자전거 전용도로__1",
               cwsec = "자전거보행자 겸용도로",
               cwleng = "자전거보행자 겸용도로__1",
               ccsec = "자전거 전용차로",
               ccleng = "자전거 전용차로__1"
)
road <- road[-c(1:1),]
road <- road[-32,]

# 각 행정구역별 자전거도로 구간 합계
road_1 <- road %>% select(gu, tsec) %>% filter(gu != "합계" & gu != "하천" & gu != "도로변 소계" & gu != "공원" & gu != "기타 소계" & gu != "교량" & !is.na(tsec))  
ggplot(data = road_1, aes(x= gu, y=tsec, fill = gu)) + geom_bar(stat = "identity", color = "black") + coord_flip()

# 각 행정구역별 자전거도로 길이 합계
road_2 <- road %>%  select(gu, tleng) %>%  filter(gu != "합계" & gu != "하천" & gu != "도로변 소계" & gu != "공원" & gu != "기타 소계" & gu != "교량" & !is.na(tleng))
ggplot(data = road_2, aes(x=gu, y= tleng, fill = gu)) + geom_bar(stat = "identity", color = "black")+ coord_flip()


