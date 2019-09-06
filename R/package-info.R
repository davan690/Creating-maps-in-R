# example
# ccg <- st_read("https://opendata.arcgis.com/datasets/de108fe659f2430d9558c20fe172638f_2.kml")
#> Reading layer `OGRGeoJSON' from data source `https://opendata.arcgis.com/datasets/de108fe659f2430d9558c20fe172638f_2.kml' using driver `KML'
#> Simple feature collection with 207 features and 2 fields
#> geometry type:  MULTIPOLYGON
#> dimension:      XY
#> bbox:           xmin: -6.418524 ymin: 49.86474 xmax: 1.762942 ymax: 55.81107
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs

# plot(ccg[1])

# example from stack...
# kml.dat <- xml2::download_xml
# zipF<- "C://Code/Creating-maps-in-R/data/invasive-species-location-research.kmz"
# outDir <- "C://Code/Creating-maps-in-R/data/unzipped-files/"
# # unzip(zipF,exdir="C://Code/Creating-maps-in-R/data/unzipped-files/")

# Aim: generate package metrics on common mapping packages
# devtools::install_github("ropenscilabs/packagemetrics")

# generic mapping packages ------------------------------------------------
generic_map_pkgs = c(
  "cartography",
  "ggplot2",
  "googleway",
  "ggspatial",
  "leaflet",
  "mapview",
  "plotly",
  "rasterVis",
  "tmap"
)
generic_map_pkgs = packagemetrics::package_list_metrics(generic_map_pkgs)
# pkg_table = packagemetrics::metrics_table(pkg_df)
readr::write_csv(generic_map_pkgs, "./data/generic_map_pkgs.csv")

# specific purpose mapping packages ---------------------------------------
specific_map_pkgs = c(
  "cartogram",
  "geogrid",
  "geofacet",
  "globe",
  "linemap"
)

specific_map_pkgs = packagemetrics::package_list_metrics(specific_map_pkgs)
# pkg_table = packagemetrics::metrics_table(pkg_df)
readr::write_csv(specific_map_pkgs, "./data/specific_map_pkgs.csv")
