#Datalucu

data=read.csv("paslonpilkada20151003.csv")

colnames(data)=gsub("\\.","_",colnames(data))
colnames(data)=tolower(colnames(data))
data=data[,-c(10:12)]

kerjaan=data$pekerjaan
kerjaan=tolower(kerjaan)
kerjaan=table(kerjaan)

#crosstabs
write.csv(kerjaan,"./crosstabs/ctkerjaan.csv")
write.csv(aggregate(kelamin~dapil,data,table),"./crosstabs/ctdaerahkelamin.csv")
write.csv(aggregate(dukungan~dapil,data,table),"./crosstabs/ctdaerahdukungan.csv")
write.csv(aggregate(kelamin~jabatan,data,table),"./crosstabs/ctkelaminjabatan.csv")
write.csv(aggregate(kelamin~dukungan,data,table),"./crosstabs/ctkelamindukungan.csv")