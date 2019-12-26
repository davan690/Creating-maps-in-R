library(spData)
library(tidyverse)
library(sf)
library(bookdown)
library(leaflet)
library(leaflet.extras)
library(geojsonio)

dat.loc <- c("C://Code/Creating-maps-in-R/data/invasive-species-NAH-research.kml")

#if kmz file
# unzip(zipfile = "C://Code/Creating-maps-in-R/data/invasive species location research.kmz")

# xml.doc <- XML::xmlToList("doc.kml")
# xml.doc
# xml.locations <- xml2::xml_length("C://Code/Creating-maps-in-R/data/invasive-species-location-research.kml")
# tibble(xml.locations)

#using sf
library(sf)
#> Linking to GEOS 3.6.1, GDAL 2.1.3, PROJ 4.9.3
dat.st <- st_read("./data/invasive-species-NAH-research.kml")

glimpse(dat.st)

# using package from github

library(tidykml)

tidykml::kml_bounds("./data/invasive-species-NAH-research.kml")
tidykml::kml_info("./data/invasive-species-NAH-research.kml")

tidy.kat <- tidykml::kml_points("./data/invasive-species-NAH-research.kml")