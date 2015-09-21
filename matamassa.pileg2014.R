library(jsonlite)
library(dplyr)
pileg2014=fromJSON("http://pileg2014.matamassa.org/json",flatten=T)
pileg2014=pileg2014[[2]]
#cleaning
pileg2014=select(pileg2014,-properties.category,-properties.color,
                 -geometry.coordinates)
pileg2014$properties.name=gsub("</a>","",pileg2014$properties.name)
pileg2014$properties.name=gsub(".*>","",pileg2014$properties.name)

#make csv
write.csv(pileg2014,"pileg2014.csv")
