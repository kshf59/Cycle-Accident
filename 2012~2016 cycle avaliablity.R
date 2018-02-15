library(readxl)
library(dplyr)
X2012_2016_cycle_avaliablity <- read_excel("Cycle Accident/2012~2016 cycle avaliablity.xls")

aval <- X2012_2016_cycle_avaliablity %>%  filter(기간 == "2016" & 분류 == "송파구")
str(aval)

aval2 <- X2012_2016_cycle_avaliablity %>%  filter(기간 == "2016" & 분류 == "영등포구" )
str(aval2)

aval3 <- X2012_2016_cycle_avaliablity %>%  filter(기간 == "2016" & 분류 == "동대문구" )
str(aval3)
