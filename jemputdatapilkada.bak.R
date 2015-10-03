datajemput="https://docs.google.com/spreadsheets/d/1qls13W-2Bm8FWIAzSOpdSwxYEW34t1dC63nilIaqQyU/pub?gid=0&single=true&output=csv"
datakpu="https://docs.google.com/spreadsheets/d/1YHfa3M85tuckuGK9p9WSlL_2Cz1ADE4Rszzrv6hXWxw/pub?gid=1975305692&single=true&output=csv"
#Dataset data entri
jemputdata=read.csv(datajemput)
jemputdata$Pekerjaan=tolower(jemputdata$Pekerjaan)
colnames(jemputdata)=tolower(colnames(jemputdata))
#weeklybackup
write.csv(jemputdata,paste0("./jemputdatabackup/","jemputdatapilkada",format(Sys.time(),"%Y%m%d"),".csv"))

#Dataset KPU
kpudata=read.csv(datakpu)
colnames(kpudata)=tolower(colnames(kpudata))
#weeklybackup
write.csv(kpudata,paste0("./jemputdatabackup/","darikpu",format(Sys.time(),"%Y%m%d"),".csv"))
