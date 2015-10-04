library(XML)
urlDPT="https://data.kpu.go.id/dps2015.php"

#Untuk Data Nasional
dptpilkadanas=readLines(urlDPT)
dptpilkadanas=readHTMLTable(dptpilkadanas)
dptpilkadanas=(dptpilkadanas[[1]])

#rapih-rapih
{
colnames(dptpilkadanas)=c("Kabupaten/Kota",
                             "Jml. TPS",
                             "L",
                             "P",
                             "Nihil (%)",
                             "Total",
                             "Tanggal Lahir Nihil(%)",
                             "Status Kawin Nihil (%)",
                             "Di Bawah Umur /Belum Kawin (%)"
)
dptpilkadanas=dptpilkadanas[-c(1:2,35),]
}

#Untuk Data Kab
idprov={c(ACEH="1",
          BALI="53241",
          BANTEN="51578",
          BENGKULU="20802",
          DAERAH_ISTIMEWA_YOGYAKARTA="41863",
          DKI_JAKARTA="25823",
          GORONTALO="74716",
          JAMBI="15885",
          JAWA_BARAT="26141",
          JAWA_TENGAH="32676",
          JAWA_TIMUR="42385",
          KALIMANTAN_BARAT="58285",
          KALIMANTAN_SELATAN="61965",
          KALIMANTAN_TENGAH="60371",
          KALIMANTAN_TIMUR="64111",
          KALIMANTAN_UTARA="928068",
          KEPULAUAN_BANGKA_BELITUNG="24993",
          KEPULAUAN_RIAU="25405",
          LAMPUNG="22328",
          MALUKU="76096",
          MALUKU_UTARA="77085",
          NUSA_TENGGARA_BARAT="54020",
          NUSA_TENGGARA_TIMUR="55065",
          PAPUA="78203",
          PAPUA_BARAT="81877",
          RIAU="14086",
          SULAWESI_BARAT="75425",
          SULAWESI_SELATAN="69268",
          SULAWESI_TENGAH="67393",
          SULAWESI_TENGGARA="72551",
          SULAWESI_UTARA="65702",
          SUMATERA_BARAT="12920",
          SUMATERA_SELATAN="17404",
          SUMATERA_UTARA="6728"
)}
urlDPTkab=paste0("https://data.kpu.go.id/dps2015.php?cmd=select&grandparent=0&parent=",idprov)
dptpilkadakab=lapply(urlDPTkab, readLines)
dptpilkadakab=lapply(dptpilkadakab, readHTMLTable)
idprovnames=names(idprov)
for (i in 1:length(idprov))
       {
       write.csv(dptpilkadakab[[i]],paste("./dpspilkada2015/",names(idprov[i]),".csv"))
}

