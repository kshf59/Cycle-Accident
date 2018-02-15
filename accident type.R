library(readxl)
accident_type <- read_excel("Cycle Accident/accident type.xlsx", 
                            col_types = c("numeric", "text", "text", 
                                          "text", "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric"))
library(dplyr)
act <- rename(accident_type,
              year = X__1,
              총합계 = "2012",
              차대사람합계 = X__2,
              횡단중 = X__3,
              차도통행증 = X__4,
              길가장자리구역통행중 = X__5,
              보도통행중 = X__6,
              차대사람기타 = X__7,
              차대차합계 = X__8,
              차대차기타 = X__9,
              정면충돌 = X__10,
              측면즉각충돌 = X__11,
              진행중추돌 = X__12,
              주정차중추돌 = X__13,
              차량단독합계 = X__14,
              전도전복 = X__15,
              공작물충돌 = X__16,
              도로이탈추락 = X__17,
              도로이탈기타 = X__18,
              차량단독기타 = X__19
              )
act <- act[-(1:8),]
act <- act[-(781:1482),]
act <- act[,-c(24:100)]

library(ggplot2)
# 2012~2016년 발생건수 총합계 비
act2 <- act %>%  filter(시군구 == "합계" & 구분 == "발생건수")
ggplot(data = act2, aes(x= year, y=총합계, fill = 구분)) + geom_bar(stat = "identity")
act2

# 2016  사고구분별 막대그래프
act3 <- act %>% filter(year == "2016" & 시군구 == "합계" & 시군구 == "합계")
act3 <- ggplot(act3, aes(x = year, y = 총합계, fill = 구분)) + geom_col(position = "dodge")
act3

# 2012 ~2016년 각 시군구별 발생건수 선그래프
act4 <- act %>%  filter(시군구 != "합계" & 구분 == "발생건수")
ggplot(act4, aes(x = year, y = 총합계, group = 시군구, colour = 시군구)) + geom_line(lwd=1) + geom_point(lwd=1)

# 2016년 사고구분별 자전거 사
act5 <- act %>% filter(year == "2016" & 시군구 == "합계" & 구분 == "발생건수")
act5 <- c(act6$차대사람합계, act6$차대차합계, act6$차량단독합계)

barplot(act5,
        names.arg = c("차대사람","차대차","차량단독"),
        main = "자전거 사고 종류"
        )

