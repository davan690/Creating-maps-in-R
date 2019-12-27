library(spData)
library(tidyverse)
library(sf)
library(bookdown)
library(leaflet)
library(leaflet.extras)
library(geojsonio)

dat.loc <- c("C://Phd/beech-anova-simple/data/doc.kml")
# dat.loc <- c("C://Code/Creating-maps-in-R/data/invasive-species-location-research-DATA.kmz")
#if kmz file
# unzip(zipfile = "C://Code/Creating-maps-in-R/data/invasive-species-location-research-DATA.kmz.zip")
# xml.doc <- XML::xmlToList("./doc.kml")
# xml.doc

#doesnt work
# library(rgdal)
# x = readOGR("C://Code/Creating-maps-in-R/data/invasive-species-location-research-DATA.kmz")


# #using sf
# library(sf)
# #> Linking to GEOS 3.6.1, GDAL 2.1.3, PROJ 4.9.3
# dat.st <- st_read("./doc.kml", )
# 
# xml.locations <- xml2::xml_length(only_elements = "./doc.kml")
# tibble(xml.locations)
# 
# glimpse(dat.st)

# using package from github
library(tidykml)

map.bounds <- tidykml::kml_bounds("./data/doc.kml")
map.info <- tidykml::kml_info("./data/doc.kml")

tidy.kat <- tidykml::kml_points("./data/doc.kml")
tidy.poly <- tidykml::kml_polygons("./doc.kml")

tidy.read <- tidykml::kml_read("./doc.kml")

