library(readxl)
cycle_aval <- read_excel("Cycle Accident/cycle aval.xlsx")

cyav <- ggplot(cycle_aval, aes(x=region, y= aver)) + geom_bar(stat = "identity") + coord_flip()
cyav


