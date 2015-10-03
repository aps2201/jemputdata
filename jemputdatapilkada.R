#load semua library
library(dplyr)
library(plyr)
library(data.table)
library(XML)


# Tahap I: data peserta tetap ---------------------------------------------
#bikin list referensi untuk tarik data
#sesuaikan 'list' dengan jumlah halaman
list=1:28

#bikin url list
url=paste0(
       "http://infopilkada.kpu.go.id/index.php?r=dashboard/paslon&ajax=yw2&tahap=3&page=",
           list
       )
       paslon=lapply(url,readHTMLTable)

#tarik datanya dari list yang dibikin
paslonpilkada2015=data.frame()
for (i in list){
       paslonpilkada2015=rbind(paslonpilkada2015,paslon[[i]][[2]])
       }

#rapih-rapih

       #split wakil
       wakilaja=data.frame()
       wakilaja=rbind(wakilaja,paslonpilkada2015[,c(1:2,6:10)])
       #bersihin data utama
       paslonpilkada2015=paslonpilkada2015[,-c(6:8,11)]       
       #define jabatan
       wakilaja=dplyr::mutate(wakilaja,
                              jabatan=ifelse(
                                     rownames(wakilaja) %in% grep(
                                     "^kota",wakilaja$`DAERAH PEMILIHAN`,
                                     ignore.case = T),
                                     "wakil walikota",
                                     ifelse(
                                            rownames(wakilaja) %in% grep(
                                            "^kab\\.",wakilaja$`DAERAH PEMILIHAN`,
                                                   ignore.case = T),
                                            "wakil bupati","wakil gubernur"
                                     )
                                     )
                              )
       
       paslonpilkada2015=dplyr::mutate(paslonpilkada2015,
               jabatan=ifelse(
                      rownames(paslonpilkada2015) %in% grep(
                             "^kota",paslonpilkada2015$`DAERAH PEMILIHAN`,
                             ignore.case = T),
                      "walikota",
                      ifelse(
                             rownames(paslonpilkada2015) %in% grep(
                                    "^kab\\.",paslonpilkada2015$`DAERAH PEMILIHAN`,
                                    ignore.case = T),
                             "bupati","gubernur"
                             )
                      )
               )
       colnames(wakilaja)=colnames(paslonpilkada2015)

       #datalengkap
       paslonpilkada2015=rbind(paslonpilkada2015,wakilaja)
       paslonpilkada2015=dplyr::mutate(paslonpilkada2015,id=1:length(rownames(paslonpilkada2015)))
       colnames(paslonpilkada2015)=c("id_paslon","dapil","nama",
                                     "kelamin","pekerjaan","dukungan",
                                     "pendukung","jabatan","id")

# Tahap II: rincian peserta tetap ---------------------------------------------
#bikin list url
id_paslon=as.character(unique(paslonpilkada2015$id_paslon))
url=paste0("http://infopilkada.kpu.go.id/index.php?r=Dashboard/viewdetilparpol&id=",
           id_paslon)
calon=lapply(url,readHTMLTable,header=F,as.data.frame=F)

       #split to data frames
       ketua=list()
       wakil=list()
       dataketua=data.frame()
       datawakil=data.frame()
       for (i in 1:length(id_paslon)){
              ketua=c(ketua,calon[[i]][1])
              wakil=c(wakil,calon[[i]][2])
              dataketua=rbind.fill(dataketua,
                                   as.data.frame(
                                          t(
                                          as.data.frame(ketua[[i]][2]))))
              datawakil=rbind.fill(datawakil,
                                   as.data.frame(
                                          t(
                                          as.data.frame(wakil[[i]][2]))))
}

#name columns
colnames(dataketua)=c("idwilayah","nama","kelamin","tempat.lahir",
                      "tanggal.lahir","alamat","pekerjaan","status")
colnames(datawakil)=c("nama","kelamin","tempat.lahir",
                      "tanggal.lahir","alamat","pekerjaan",
                      "status")
dataketua=dplyr::mutate(dataketua,
                        id_paslon=id_paslon)
datawakil=dplyr::mutate(datawakil,
                        id_paslon=id_paslon,idwilayah=dataketua$idwilayah)

datarinci=rbind(dataketua,datawakil)
datarinci=dplyr::mutate(datarinci,id=1:length(rownames(datarinci)))


# final -------------------------------------------------------------------
#gabung gabung
paslonpilkada2015=merge(paslonpilkada2015,datarinci[,-c(2,3,7,9)],by="id")

#bersih-bersih
rm(list=setdiff(ls(), "paslonpilkada2015"))

#output
write.csv(paslonpilkada2015,paste0("paslonpilkada",format(Sys.time(),"%Y%m%d"),".csv"),row.names = F)
