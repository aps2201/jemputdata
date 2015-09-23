jemputdata=read.csv("https://docs.google.com/spreadsheets/d/1qls13W-2Bm8FWIAzSOpdSwxYEW34t1dC63nilIaqQyU/pub?gid=0&single=true&output=csv")
jemputdata$Pekerjaan=tolower(x$Pekerjaan)
colnames(jemputdata)=tolower(colnames(jemputdata))
#weeklybackup
write.csv(x,paste0("./jemputdatabackup/","jemputdata2015",format(Sys.time(),"%Y%m%d"),".csv"))