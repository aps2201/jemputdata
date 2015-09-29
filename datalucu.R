#Datalucu

data=read.csv("datapilkada2015_4.csv")

colnames(data)=gsub("\\.","_",colnames(data))
colnames(data)=tolower(colnames(data))
data=data[,-c(10:12)]

kerjaan=data$pekerjaan
kerjaan=tolower(kerjaan)
kerjaan=table(kerjaan)

write.csv(kerjaan,"ctkerjaan.csv")
write.csv(aggregate(jenis_kelamin~daerah_pemilihan,data,table),"ctdaerahkelamin.csv")
write.csv(aggregate(jenis_dukungan~daerah_pemilihan,data,table),"ctdaerahdukungan.csv")
write.csv(aggregate(jenis_kelamin~jabatan,data,table),"ctkelaminjabatan.csv")
write.csv(aggregate(jenis_kelamin~jenis_dukungan,data,table),"ctkelamindukungan.csv")