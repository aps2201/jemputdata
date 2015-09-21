library(dplyr)
library(ggplot2)
library(scales)

loker20082012=read.csv("http://data.go.id/dataset/e492490a-fe8c-4291-afd3-0e1ae9c0df27/resource/3bf16e2a-eeaa-4217-b9ed-005d8ebf86a0/download/lowongankerjayangterdaftarmenurutkabkotaadm20082012.csv")
loker20082012$jumlah_loker=as.numeric(loker20082012$jumlah_loker)

#jumlah sepanjang tahun
lokerpertahun=aggregate(jumlah_loker~tahun,loker20082012,sum)
png("jumlahlokerpertahun.png")
ggplot(lokerpertahun,aes(tahun,jumlah_loker))+
       geom_line()+ 
       scale_y_continuous(labels=comma)
dev.off()
