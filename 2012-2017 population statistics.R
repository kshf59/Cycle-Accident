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
ggplot(data = pop, aes(x = gu, y = popul, fill = gu)) + geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 55, hjust = 1)) + coord_flip()

