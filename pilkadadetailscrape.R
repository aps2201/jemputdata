library(plyr)
library(data.table)
library(XML)
x=read.csv("datapilkada2015.csv")
id_paslon=as.character(unique(x$ID))
rm(x)
idpaslon=paste0("http://infopilkada.kpu.go.id/index.php?r=Dashboard/viewdetilparpol&id=",id_paslon)

calon=lapply(idpaslon,readHTMLTable,header=F,as.data.frame=F)

#split to data frames
ketua=list()
wakil=list()
dataketua=data.frame()
datawakil=data.frame()
for (i in 1:length(idpaslon)){
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
colnames(dataketua)=c("Idwilayah","Nama Calon","Jenis Kelamin","Tempat Lahir",
                      "Tanggal Lahir","Alamat","Pekerjaan","Status")
colnames(datawakil)=c("Nama Wakil Calon","Jenis Kelamin","Tempat Lahir",
                     "Tanggal Lahir","Alamat","Pekerjaan",
                     "Status")

write.csv(dataketua,"dataketua.csv")
write.csv(datawakil,"datawakil.csv")
write.csv(id_paslon,"idpaslon.csv")

#cleanup
rm(i,calon,id_paslon,idpaslon,ketua,wakil)
