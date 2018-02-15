# 서울시 자전거 도로 현황

# 필요 library
library(rgdal)
library(ggplot2)
library(raster)

# 서울시 행정구 지도
korea_shp <- shapefile("C:/Users/kim/Documents/BigData/Cycle Accident/cycle/TL_SCCO_SIG.shp")
seoul_shp <- korea_shp[korea_shp$SIG_CD <= 17400 , ]
seoul_map <- ggplot() + geom_polygon(data = seoul_shp, aes(x=long, y=lat, group = group),colour = "black", fill = "white")
print(seoul_map)

# 서울시 자전거 도로
Bicycle_Lane_shp <- readOGR(dsn = "C:/Users/kim/Documents/BigData/Cycle Accident/cycle",layer = "Bicycle_Lane_Seoul", encoding = "utf-8")
#WGS84 좌표계 변환
Bicycle_Lane_shp <- spTransform(Bicycle_Lane_shp, CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
Bicycle_Lane <- fortify(Bicycle_Lane_shp)

lane <- ggplot() + geom_polygon(data = Bicycle_Lane, aes(x=long, y=lat, group = group),color="red", fill="white", size=.12)
print(lane)

# 합치기
lane <- ggplot() + geom_polygon(data = seoul_shp, aes(x=long, y=lat, group = group),color="black", fill = "white", size=0.5) + 
  geom_polygon(data = Bicycle_Lane , aes(x = long, y = lat, group=group), colour = "red", size = .5) + coord_map() + theme_void()
print(lane)
