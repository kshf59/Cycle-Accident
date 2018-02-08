library(readxl)
cycle_road2012 <- read_excel("cycle road2012.xls", 
                             col_types = c("numeric", "text", "numeric", 
                                           "numeric", "numeric", "numeric", 
                                           "numeric", "numeric", "numeric", 
                                           "numeric"))
library(dplyr)
road <- rename(cycle_road2012,
               year = "기간",
               gu = "자치구/지역",
               tsec = "계",
               tleng = "계__1",
               csec = "자전거전용도로",
               cleng = "자전거전용도로__1",
               cwsec = "자전거보행자겸용도로",
               cwleng = "자전거보행자겸용도로__1",
               ccsec = "자전거전용차로",
               ccleng = "자전거전용차로__1"
               )
road <- road[-c(1:1),]
road <- road[-32,]

# 각 행정구역별 자전거도로 구간 합계
road_1 <- road %>% select(gu, tsec) %>% filter(gu != "합계" & gu != "한강둔치" & gu != "한강교량" & gu != "지천" & gu != "월드컵공원" & gu != "여의도공원" & !is.na(tsec))  
ggplot(data = road_1, aes(x= gu, y=tsec, fill = gu)) + geom_bar(stat = "identity", color = "black") + coord_flip()

# 각 행정구역별 자전거도로 길이 합계
road_2 <- road %>%  select(gu, tleng) %>%  filter(gu != "합계" & gu != "한강둔치" & gu != "한강교량" & gu != "지천" & gu != "월드컵공원" &  gu != "여의도공원" & !is.na(tleng))
ggplot(data = road_2, aes(x=gu, y= tleng, fill = gu)) + geom_bar(stat = "identity", color = "black")+ coord_flip()


