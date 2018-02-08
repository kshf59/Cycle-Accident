library(readxl)
accident_time <- read_excel("accident time.xlsx", 
                            col_types = c("numeric", "text", "text", 
                                          "text", "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric", "numeric", "numeric", 
                                          "numeric"))
library(dplyr)
time <- rename(accident_time,
               year = X__1,
               si = 시도,
               gu = 시군구,
               division = 구분,
               total = "2012",
               "0~2" = X__2,
               "2~4" = X__3,
               "4~6" = X__4,
               "6~8" = X__5,
               "8~10" = X__6,
               "10~12" = X__7,
               "12~14" = X__8,
               "14~16" = X__9,
               "16~18" = X__10,
               "18~20" = X__11,
               "20~22" = X__12,
               "22~24" = X__13
               )

time <- time[-(1:7),]
library(bindrcpp)

time_total12 <- time %>% filter(gu == "합계" & division == "발생건수" & year == 2012 )
time_total12 <- c(time_total12$`0~2`,
                  time_total12$`2~4`,
                  time_total12$`4~6`,
                  time_total12$`6~8`,
                  time_total12$`8~10`,
                  time_total12$`10~12`,
                  time_total12$`12~14`,
                  time_total12$`14~16`,
                  time_total12$`16~18`,
                  time_total12$`18~20`,
                  time_total12$`20~22`,
                  time_total12$`22~24`
                  )

#시간별 사고 현황
gd_rate <- round(time_total12/sum(time_total12)*100, 1) #백분율 구하고
gd_labels <- paste(gd_rate, "%") # 그걸 퍼센트로 낸다
library(plotrix)
# 3D파이 그래프
pie3D(time_total12,
      main= "연령별 구성비",
      col=rainbow(length(time_total12)), 
      labels=gd_labels,
      explode = 0.05
)
legend(0.8,1.1,c("0~2시","2~4시","4~6시","6~8시","8~10시","10~12시",
               "12~14시","14~16시","16~18시","18~20시","20~22시","22~24시"), 
       cex=0.5, fill=rainbow(length(time_total12)))

#시간별 사고 현황

barplot(time_total12,
        main = "시간별 사고 현황",
        xlab = "시간",
        ylab = "현황",
        col=rainbow(12),
        names.arg=c("0~2","2~4","4~6","6~8","8~10","10~12","12~14","14~16","16~18","18~20","20~22","22~24")
)

