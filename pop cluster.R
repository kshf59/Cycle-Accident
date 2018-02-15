library(dplyr)
library(rgdal)
library(ggplot2)
library(raster)

library(readxl)
X2012_2017_population_statistics <- read_excel("Cycle Accident/2012-2017 population statistics.xls", 
                                               col_types = c("text", "text", "text", 
                                                             "numeric", "text", "text", "text", 
                                                             "text", "text", "text", "text", "text", 
                                                             "text", "text", "text", "text"))


pop <- X2012_2017_population_statistics[,-c(5:16)]
pop <- pop[,-3]
pop <- pop[-c(1:2),]

pop <- rename(pop,
              year = "기간",
              gu = "자치구",
              popul = "인구" 
)

pop <- pop %>%  filter(year == "2016.4/4")


korea_shp <- shapefile("C:/Users/kim/Documents/BigData/Cycle Accident/cycle/TL_SCCO_SIG.shp")
seoul_shp <- korea_shp[korea_shp$SIG_CD <= 17400, ]


df <- cbind.Spatial(seoul_shp, pop$popul)
df2 <- fortify(df, region="SIG_CD")

df <- as.data.frame(df)
df <- rename(df,
              id = SIG_CD,
              po = "c.161922..134409..245102..307161..372104..370312..415677..461617.."
              )

poly <- merge(df2,df,by='id')


# 서울시 행정구 지도
seoul_map <- ggplot() + geom_polygon(data = poly, aes(x=long, y=lat, group = group, fill = po), colour = "black")
seoul_map + scale_fill_gradient(low = 'white', high = '#004ea2')


