temp="temp.zip"
if (!file.exists(temp)){
download.file("http://databank.worldbank.org/data/download/INDODAPOER_csv.zip",
              temp,mode="wb")
}
if (!file.exists("INDODAPOER-Data.csv")){
unzip(temp)
}

indodapoer=read.csv("INDODAPOER-Data.csv")
colnames(indodapoer)=gsub("\\.","_",colnames(indodapoer))
colnames(indodapoer)=gsub("X","",colnames(indodapoer))
colnames(indodapoer)=tolower(colnames(indodapoer))
