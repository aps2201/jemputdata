
dana2=read.csv("https://github.com/pemiluAPI/pemilu-data/raw/master/laporan_dana_kampanye/2014/laporan_dana_kampanye_caleg_dpr_2014_periode_02.csv")
dana=read.csv("https://github.com/pemiluAPI/pemilu-data/raw/master/laporan_dana_kampanye/2014/laporan_dana_kampanye_caleg_dpr_2014_periode_01.csv")

dana=rbind(dana,dana2)
rm(dana2)

danasum=aggregate(jumlah~nama_partai,dana,sum,rm.na=T)
danaavg=aggregate(jumlah~nama_partai,dana,mean,rm.na=T)

caleg=subset(dana,dana$role=="calon anggota legislatif")
       calegsum=aggregate(jumlah~nama_partai,caleg,sum,rm.na=T)
       calegavg=aggregate(jumlah~nama_partai,caleg,mean,rm.na=T)

orang=subset(dana,dana$role=="sumbangan perseorangan")
       orggsum=aggregate(jumlah~nama,orang,sum,rm.na=F)
       orgavg=aggregate(jumlah~nama,orang,mean,rm.na=F)

#untuk search 
#caleg[grep("^.*nama",caleg$nama,ignore.case=T),]
