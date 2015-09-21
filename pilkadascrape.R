library(XML)
list=1:27
url=paste0("http://infopilkada.kpu.go.id/index.php?r=dashboard/paslon&ajax=yw2&tahap=3&page=",list)
paslon=lapply(url,readHTMLTable)

paslonpilkada2015=data.frame()
for (i in list){
       paslonpilkada2015=rbind(paslonpilkada2015,paslon[[i]][[2]])
       
}

write.csv(paslondatapilkada2015,"datapilkada2015.csv")