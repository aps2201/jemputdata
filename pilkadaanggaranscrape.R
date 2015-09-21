library(XML)
anggaran1=readHTMLTable("http://infopilkada.kpu.go.id/index.php?r=anggaran/admin&Anggaran_sort=anggaran_guna.desc&ajax=anggaran-grid")
anggaran2=readHTMLTable("http://infopilkada.kpu.go.id/index.php?r=anggaran/admin&Anggaran_sort=anggaran_guna.desc&ajax=anggaran-grid&Anggaran_page=2")
anggaran3=readHTMLTable("http://infopilkada.kpu.go.id/index.php?r=anggaran/admin&Anggaran_sort=anggaran_guna.desc&ajax=anggaran-grid&Anggaran_page=3")
anggaran4=readHTMLTable("http://infopilkada.kpu.go.id/index.php?r=anggaran/admin&Anggaran_sort=anggaran_guna.desc&ajax=anggaran-grid&Anggaran_page=4")
anggaran5=readHTMLTable("http://infopilkada.kpu.go.id/index.php?r=anggaran/admin&Anggaran_sort=anggaran_guna.desc&ajax=anggaran-grid&Anggaran_page=5")
anggaran6=readHTMLTable("http://infopilkada.kpu.go.id/index.php?r=anggaran/admin&Anggaran_sort=anggaran_guna.desc&ajax=anggaran-grid&Anggaran_page=6")
anggaran7=readHTMLTable("http://infopilkada.kpu.go.id/index.php?r=anggaran/admin&Anggaran_sort=anggaran_guna.desc&ajax=anggaran-grid&Anggaran_page=7")
anggaran8=readHTMLTable("http://infopilkada.kpu.go.id/index.php?r=anggaran/admin&Anggaran_sort=anggaran_guna.desc&ajax=anggaran-grid&Anggaran_page=8")
anggaran9=readHTMLTable("http://infopilkada.kpu.go.id/index.php?r=anggaran/admin&Anggaran_sort=anggaran_guna.desc&ajax=anggaran-grid&Anggaran_page=9")
anggaran10=readHTMLTable("http://infopilkada.kpu.go.id/index.php?r=anggaran/admin&Anggaran_sort=anggaran_guna.desc&ajax=anggaran-grid&Anggaran_page=10")
anggaran11=readHTMLTable("http://infopilkada.kpu.go.id/index.php?r=anggaran/admin&Anggaran_sort=anggaran_guna.desc&ajax=anggaran-grid&Anggaran_page=11")
anggaran12=readHTMLTable("http://infopilkada.kpu.go.id/index.php?r=anggaran/admin&Anggaran_sort=anggaran_guna.desc&ajax=anggaran-grid&Anggaran_page=12")
anggaran13=readHTMLTable("http://infopilkada.kpu.go.id/index.php?r=anggaran/admin&Anggaran_sort=anggaran_guna.desc&ajax=anggaran-grid&Anggaran_page=13")
anggaran14=readHTMLTable("http://infopilkada.kpu.go.id/index.php?r=anggaran/admin&Anggaran_sort=anggaran_guna.desc&ajax=anggaran-grid&Anggaran_page=14")
anggaran15=readHTMLTable("http://infopilkada.kpu.go.id/index.php?r=anggaran/admin&Anggaran_sort=anggaran_guna.desc&ajax=anggaran-grid&Anggaran_page=15")
anggaran16=readHTMLTable("http://infopilkada.kpu.go.id/index.php?r=anggaran/admin&Anggaran_sort=anggaran_guna.desc&ajax=anggaran-grid&Anggaran_page=16")
anggaran17=readHTMLTable("http://infopilkada.kpu.go.id/index.php?r=anggaran/admin&Anggaran_sort=anggaran_guna.desc&ajax=anggaran-grid&Anggaran_page=17")

dataanggaran2015=rbind(anggaran1[[1]],
                      anggaran2[[1]],
                      anggaran3[[1]],
                      anggaran4[[1]],
                      anggaran5[[1]],
                      anggaran6[[1]],
                      anggaran7[[1]],
                      anggaran8[[1]],
                      anggaran9[[1]],
                      anggaran10[[1]],
                      anggaran11[[1]],
                      anggaran12[[1]],
                      anggaran13[[1]],
                      anggaran14[[1]],
                      anggaran15[[1]],
                      anggaran16[[1]],
                      anggaran17[[1]]
                     )
rm(anggaran1,
   anggaran2,
   anggaran3,
   anggaran4,
   anggaran5,
   anggaran6,
   anggaran7,
   anggaran8,
   anggaran9,
   anggaran10,
   anggaran11,
   anggaran12,
   anggaran13,
   anggaran14,
   anggaran15,
   anggaran16,
   anggaran17
   )
colnames(dataanggaran2015)=c("Namawilayah",       
"Anggaran yang Diajukan",
  "Anggaran yang Disetujui",
  "Anggaran yang Digunakan",
  "No Surat NPHD",
  "Upload Dokumen NPHD")

write.csv(dataanggaran2015,"dataanggaran2015.csv")