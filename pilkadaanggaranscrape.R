library(XML)
list=1:17
url=paste0("http://infopilkada.kpu.go.id/index.php?r=anggaran/admin&Anggaran_sort=anggaran_guna.desc&ajax=anggaran-grid&Anggaran_page=",list)
anggaranpilkada=lapply(url,readHTMLTable)

dataanggaran2015=data.frame()
for (i in list){
       dataanggaran2015=rbind(dataanggaran2015,anggaranpilkada[[i]][[1]])       
}

colnames(dataanggaran2015)=c("Namawilayah",       
"Anggaran yang Diajukan",
  "Anggaran yang Disetujui",
  "Anggaran yang Digunakan",
  "No Surat NPHD",
  "Upload Dokumen NPHD")

write.csv(dataanggaran2015,"dataanggaran2015.csv")

#downloadfiles
##grab file list
urldana="http://infopilkada.kpu.go.id/assets/9891ea05/"
anggaranpaslonfilelist=readHTMLTable(urldana)
anggaranpaslonfilelist=anggaranpaslonfilelist[[1]][2]

##clean,clean,clean!!!
anggaranpaslonfilelist=anggaranpaslonfilelist[-c(1,2,597),]
anggaranpaslonfilelist=paste0(urldana,anggaranpaslonfilelist)
anggaranpaslonfilelist=gsub("\\s","%20",anggaranpaslonfilelist)


##do
#for (i in anggaranpaslonfilelist){
#download.file(i,destfile=paste0(length(i),".pdf"))
}