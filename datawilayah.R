library(dplyr)
dapildata=read.csv("https://github.com/pemiluAPI/pemilu-data/raw/master/dapil/data_dapil.csv")
dapil=read.csv("https://github.com/aps2201/pemilu-data/raw/master/dapil/dapil.csv")
kursidapil=read.csv("https://github.com/aps2201/pemilu-data/raw/master/perolehan_suara_partai/data_dapil.csv")
kursipartai=read.csv("https://github.com/aps2201/pemilu-data/raw/master/perolehan_suara_partai/perolehan_suara.csv")
wil=read.csv("https://raw.githubusercontent.com/pemiluAPI/pemilu-data/master/dapil/data_wilayah.csv")
partai=read.csv("https://github.com/aps2201/pemilu-data/raw/master/partai/partai.csv")

camp=merge(wil,dapildata,by.x="id_dapil",by.y="id")
camp=merge(camp,dapil,by.x="id_provinsi",by.y="id_provinsi")
colnames(camp)=c("id_provinsi","id_dapil","id_wilayah",
                 "nama_wilayah","jumlahkursi",
                 "id_dapil2","id_gapenting",
                 "id_gapenting2","nama_gapenting","nama_lengkap",
                 "nama_lembaga","nama_provinsi",
                 "jumlah_kursi","jumlah_penduduk")

datawilayah=select(camp,id_provinsi,id_dapil,id_wilayah,nama_wilayah,nama_lengkap,nama_provinsi)

write.csv(datawilayah,"datawilayah.csv")

partai=select(partai,id,nama_lengkap)

kursi=merge(kursidapil,kursipartai,by="dapil_id")
kursi=merge(kursi,partai,by.x="party_id",by.y="id")
kursi=kursi[,c(-3,-5)]
       kursi$jumlah=gsub("[[:punct:]]","",kursi$jumlah)
       kursi$jumlah=as.numeric(kursi$jumlah)
       A=mutate(kursi,lolos=ifelse(
                       kursi$jumlah>(
                              sum(kursi$jumlah)*(3.5/100)
                              ),
                             "lolos","tidak"))
