library(dplyr)
library(ggplot2)
loker20082012=read.csv("lowongankerjayangterdaftarmenurutkabkotaadm20082012.csv")

#jumlah sepanjang tahun
lokerpertahun=aggregate(jumlah_loker~tahun,loker20082012,sum)
ggplot(lokerpertahun,aes(tahun,jumlah_loker))+geom_line()

