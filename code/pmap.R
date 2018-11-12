sulsel[sulsel$Kecamatan == "MAKALE"]
name = c("Balai BMKG Wilayah IV Makassar", "Sta. Meteorologi Klas I Hasanuddin", 
         "Sta. Klimatologi Klas I Maros", "Sta. Maritim Klas II Paotere", 
         "Sta. Geofisika Klas II Gowa","Sta. Meteorologi Klas III Andi Jemma Masamba", 
         "Sta. Meteorologi Pongtiku Tana Toraja") 
# which(sulsel$Kecamatan == "PANAKUKANG")
# which(sulsel$Kecamatan == "MANDAI")
# which(sulsel$Kecamatan == "BANTIMURUNG") 
# which(sulsel$Kecamatan == "UJUNG TANAH") 
# which(sulsel$Kecamatan == "MASAMBA") 
# which(sulsel$Kecamatan == "RANTETAYO")
which(sulsel$Kecamatan == "SOMBAOPU")
isulsel = c(204, 162, 29, 326,271,188,  235)
stasiun = sulsel[isulsel,]
lng = c()
lat = c()
for(i in 1:length(stasiun)){
  lng[i] = stasiun@polygons[[i]]@labpt[1]
  lat[i] = stasiun@polygons[[i]]@labpt[2]
}
labs = paste0("<strong>",name,"</strong>")

greenLeafIcon <- makeIcon(
  iconUrl = "http://leafletjs.com/examples/custom-icons/leaf-red.png",
  iconWidth = 38, iconHeight = 95,
  iconAnchorX = 22, iconAnchorY = 94,
  shadowUrl = "http://leafletjs.com/examples/custom-icons/leaf-shadow.png",
  shadowWidth = 50, shadowHeight = 64,
  shadowAnchorX = 4, shadowAnchorY = 62
)

getColor <- function(colo) {
  sapply(quakes$mag, function(mag) {
    mag <= 4) {
      "green"
    } else if(mag <= 5) {
      "orange"
    } else {
      "red"
    } })
}

icons <- awesomeIcons(
  icon = 'ios-close',
  iconColor = 'black',
  library = 'ion'
  markerColor = red
)

stasiun = leaflet() %>% 
  addTiles(
    urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
    attribution = 'Developed by <a href="https://github.com/yosiknorman">Yosik Norman</a>'
  ) %>% 
  # addPopups(lng = lng, lat=lat, paste0("<strong>",name,"</strong>"), 
  #           options = popupOptions(closeButton = T)) %>% 
  addMarkers(
  lng = lng, lat = lat,
  label = name, icon = greenLeafIcon,
  labelOptions = labelOptions(noHide = T)
  ) 
stasiun$height = 700
stasiun$width = "100%"
saveWidget(file = "~/Videos/bmkg-sulsel.github.io/depend_html_gambar/stasiun.html", stasiun, selfcontained = T)

