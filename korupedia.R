library(jsonlite)
library(dplyr)
korupedia=fromJSON("http://korupedia.org/json",flatten=T)
korupedia=korupedia[[2]]
#cleaning
korupedia=select(korupedia,-properties.category,-properties.color,
                 -geometry.coordinates)
korupedia$properties.name=gsub("</a>","",korupedia$properties.name)
korupedia$properties.name=gsub(".*>","",korupedia$properties.name)

#make csv
write.csv(korupedia,"korupedia.csv")
