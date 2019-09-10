# Work in progress {#wnp}


```r
library(tmap)    # for static and interactive maps
library(leaflet) # for interactive maps
library(mapview) # for interactive maps
library(ggplot2) # tidyverse data visualization package
library(shiny)   # for web applications
library(spData)
library(dplyr)
library(sf)
library(bookdown)
library(leaflet)
library(leaflet.extras)
library(geojsonio)
library(sf)
library(raster)
library(dplyr)
library(spData)

# library(spDataLarge)
```

As I work through the steps I will add code and notes to this section of the `gitbook`. The first step I have done is to convert the downloaded my-maps data. To conbvert a my-maps online map into a tidy format we can work in I have done the following.

### [Static maps](https://geocompr.robinlovelace.net/adv-map.html)

Static maps are the most common type of visual output from geocomputation. Standard formats include .png and .pdf for raster and vector outputs respectively. Initially, static maps were the only type of maps that R could produce. Things advanced with the release of sp (see Pebesma and Bivand 2005) and many techniques for map making have been developed since then. However, despite the innovation of interactive mapping, static plotting was still the emphasis of geographic data visualisation in R a decade later (Cheshire and Lovelace 2015).

The generic plot() function is often the fastest way to create static maps from vector and raster spatial objects (see sections 2.2.3 and 2.3.2). Sometimes, simplicity and speed are priorities, especially during the development phase of a project, and this is where plot() excels. The base R approach is also extensible, with plot() offering dozens of arguments. Another approach is the grid package which allows low level control of static maps, as illustrated in Chapter 14 of Murrell (2016). This section focuses on tmap and emphasizes the important aesthetic and layout options.

tmap is a powerful and flexible map-making package with sensible defaults. It has a concise syntax that allows for the creation of attractive maps with minimal code which will be familiar to ggplot2 users. It also has the unique capability to generate static and interactive maps using the same code via tmap_mode(). Finally, it accepts a wider range of spatial classes (including raster objects) than alternatives such as ggplot2 (see the vignettes tmap-getstarted and tmap-changes-v2, as well as Tennekes (2018), for further documentation).

1. Download the `kmz` file from online.

A `KMZ` file is just a zipped `KML` [file](https://en.wikipedia.org/wiki/Keyhole_Markup_Language), possibly with associated embedded images, icons, etc. 

So any program that supports `KMZ` files internally unzips them to access their KML files. That may be a reason why many open source programs do not bother supporting KMZ once KML support is implemented: you just need to use an additional unzipping library of your choice, to convert the KMZ to KML. The linked posts give some JavaScript-based solutions for unzipping.


```r
dat.loc <- c("C://Code/Creating-maps-in-R/data/invasive-species-location-research.kmz")
```


```r
  # kml.dat <- xml2::download_xml
zipF<- "C://Code/Creating-maps-in-R/data/invasive-species-location-research.kmz"
outDir <- "C://Code/Creating-maps-in-R/data/unzipped-files/"
# unzip(zipF,exdir="C://Code/Creating-maps-in-R/data/unzipped-files/")

# unzip(zipfile = "C://Code/Creating-maps-in-R/data/Canberra-transit/images/invasive-species-location-research.kmz")
# xml.locations <- XML::xmlToDataFrame("./doc.kml")
```

- `exdir` defines the directory to extract files to. It will be created if not already available. If you don't set `exdir`, `unzip` will just unzip it to your current working directory.


```r
# glimpse(xml.locations)
# str(xml.locations)
```


```r
# install dev version of ggmap
# devtools::install_github("dkahle/ggmap")

library(ggmap)
```

```
## Google's Terms of Service: https://cloud.google.com/maps-platform/terms/.
```

```
## Please cite ggmap if you use it! See citation("ggmap") for details.
```

```r
#> Loading required package: ggplot2
#> Google Maps API Terms of Service: http://developers.google.com/maps/terms.
#> Please cite ggmap if you use it: see citation("ggmap") for details.

# # save api key
# register_google(key = "YOUR_API_KEY")
# 
# # check if key is saved
# has_goog_key()
# #> [1] TRUE
# 
# ggmap(
#   ggmap = get_map(
#     "Dayton",
#      zoom = 13, scale = "auto",
#      maptype = "satellite",
#      source = "google"),
#   extent = "device",
#   legend = "topright"
#   )
#> Source : https://maps.googleapis.com/maps/api/staticmap?center=Dayton&zoom=13&size=640x640&scale=2&maptype=satellite&language=en-EN&key=AIzaSyBmXB5S5_NIqo6lAGH-_U-TbhrQjhOsplU
#> Source : https://maps.googleapis.com/maps/api/geocode/json?address=Dayton&key=AIzaSyBmXB5S5_NIqo6lAGH-_U-TbhrQjhOsplU
```


## My notes

These resources are very basic but they may be helpful for me later.

- Found in [stack comments here](https://stackoverflow.com/questions/35867793/using-kmz-file-in-leaflet-map)


```r
library(tidyverse)
```

```
## -- Attaching packages ---------------------------------------------- tidyverse 1.2.1 --
```

```
## v tibble  2.1.3     v purrr   0.3.2
## v tidyr   0.8.3     v stringr 1.4.0
## v readr   1.3.1     v forcats 0.4.0
```

```
## -- Conflicts ------------------------------------------------- tidyverse_conflicts() --
## x tidyr::extract() masks raster::extract()
## x dplyr::filter()  masks stats::filter()
## x dplyr::lag()     masks stats::lag()
## x raster::select() masks dplyr::select()
```

```r
library(kableExtra)
```

```
## 
## Attaching package: 'kableExtra'
```

```
## The following object is masked from 'package:dplyr':
## 
##     group_rows
```


```r
source("./R/kml_to_tidy.R")
```

```
## Multiple layers are present in data source C:\Code\Creating-maps-in-R\data\invasive-species-NAH-research.kml, reading layer `Hollyford'.
## Use `st_layers' to list all layer names and their type in a data source.
## Set the `layer' argument in `st_read' to read a particular layer.
```

```
## Warning in evalq((function (..., call. = TRUE, immediate. = FALSE,
## noBreaks. = FALSE, : automatically selected the first layer in a data
## source containing more than one.
```

```
## Reading layer `Hollyford' from data source `C:\Code\Creating-maps-in-R\data\invasive-species-NAH-research.kml' using driver `KML'
## Simple feature collection with 10 features and 2 fields
## geometry type:  GEOMETRY
## dimension:      XYZ
## bbox:           xmin: 167.9963 ymin: -45.06019 xmax: 168.1392 ymax: -44.70935
## epsg (SRID):    4326
## proj4string:    +proj=longlat +datum=WGS84 +no_defs
## Observations: 10
## Variables: 3
## $ Name        <fct> Gunns Camp, Choqenout and Ruscoe 2000, Hollyford V...
## $ Description <fct> "", "Eglinton Valley", "", "", "", "", "", "", "",...
## $ geometry    <GEOMETRY [°]> POINT Z (168.1392 -44.76039 0), POINT Z (...
```

```r
kable(tidy.kat, format = "markdown")
```



|folder          |name                      |description     |styleUrl                 | longitude|  latitude| altitude|
|:---------------|:-------------------------|:---------------|:------------------------|---------:|---------:|--------:|
|Hollyford       |Gunns Camp                |NA              |#icon-1899-0288D1-nodesc |  168.1392| -44.76039|        0|
|Hollyford       |Choqenout and Ruscoe 2000 |Eglinton Valley |#icon-1899-0288D1        |  167.9963| -45.06019|        0|
|Hollyford       |Hollyford Valley Lookout  |NA              |#icon-1899-0288D1-nodesc |  168.1050| -44.80905|        0|
|Hollyford       |Hollyford Airstrip        |NA              |#icon-1899-0288D1-nodesc |  168.1337| -44.73744|        0|
|Hollyford       |Point 9                   |NA              |#icon-1899-0288D1-nodesc |  168.1262| -44.79766|        0|
|Hollyford       |Point 10                  |x = 10, y = 250 |#icon-1899-0288D1        |  168.0794| -44.90247|        0|
|Eglinton Valley |MR1                       |NA              |#icon-1899-F9A825-nodesc |  168.0776| -44.89081|        0|
|Eglinton Valley |M1                        |NA              |#icon-1899-FBC02D-nodesc |  168.1005| -44.85371|        0|
|Eglinton Valley |M1                        |NA              |#icon-1899-FBC02D-nodesc |  168.0748| -44.89257|        0|
|Eglinton Valley |R1                        |NA              |#icon-1899-000000-nodesc |  168.0968| -44.85569|        0|
|Eglinton Valley |MR1                       |NA              |#icon-1899-FBC02D-nodesc |  168.0995| -44.85768|        0|
|Eglinton Valley |R1                        |NA              |#icon-1899-000000-nodesc |  168.0789| -44.89277|        0|

## Building maps for manuscripts

These starting resources have come from `chapter-8` of the geocomp book. To make this quick I have used the `rmarkdown` function `render` to create a `r` file that can then be sourced here for building my data specific maps.


```r
# rmarkdown::render("./03-Work-In-Progress.Rmd")
# knitr::purl("./03-Work-In-Progress.Rmd", "./R/03-Work-In-Progress.R", documentation = 2)
```


```r
source("./R/03-Work-In-Progress.R", echo = FALSE)
```

<img src="03-Work-in-Progress_files/figure-html/unnamed-chunk-8-1.png" width="672" /><img src="03-Work-in-Progress_files/figure-html/unnamed-chunk-8-2.png" width="672" />

```
## Legend labels were too wide. The labels have been resized to 0.29, 0.29, 0.29, 0.29, 0.29, 0.29. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
```

```
## Legend labels were too wide. The labels have been resized to 0.44, 0.29, 0.29. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
```

```
## Legend labels were too wide. The labels have been resized to 0.29, 0.29, 0.29, 0.29, 0.29, 0.29, 0.29, 0.29, 0.29, 0.29. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
```

```
## Legend labels were too wide. The labels have been resized to 0.29, 0.29, 0.29, 0.29, 0.29, 0.29. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
```

<img src="03-Work-in-Progress_files/figure-html/unnamed-chunk-8-3.png" width="672" />

```
## Legend labels were too wide. The labels have been resized to 0.47, 0.47, 0.47, 0.47, 0.47, 0.47. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
```

```
## Legend labels were too wide. The labels have been resized to 0.47, 0.47, 0.47, 0.47, 0.47. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
## Legend labels were too wide. The labels have been resized to 0.47, 0.47, 0.47, 0.47, 0.47. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
## Legend labels were too wide. The labels have been resized to 0.47, 0.47, 0.47, 0.47, 0.47. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
```

<img src="03-Work-in-Progress_files/figure-html/unnamed-chunk-8-4.png" width="672" /><img src="03-Work-in-Progress_files/figure-html/unnamed-chunk-8-5.png" width="672" /><img src="03-Work-in-Progress_files/figure-html/unnamed-chunk-8-6.png" width="672" />

```
## Legend labels were too wide. The labels have been resized to 0.44, 0.29, 0.29, 0.29, 0.29. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
```

```
## Legend labels were too wide. The labels have been resized to 0.44, 0.29, 0.29, 0.29, 0.29. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
## Legend labels were too wide. The labels have been resized to 0.44, 0.29, 0.29, 0.29, 0.29. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
```

<img src="03-Work-in-Progress_files/figure-html/unnamed-chunk-8-7.png" width="672" />

```
## Legend labels were too wide. The labels have been resized to 0.44, 0.29, 0.29, 0.29, 0.29. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
## Legend labels were too wide. The labels have been resized to 0.44, 0.29, 0.29, 0.29, 0.29. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
## Legend labels were too wide. The labels have been resized to 0.44, 0.29, 0.29, 0.29, 0.29. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
## Legend labels were too wide. The labels have been resized to 0.44, 0.29, 0.29, 0.29, 0.29. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
```

<img src="03-Work-in-Progress_files/figure-html/unnamed-chunk-8-8.png" width="672" />

```
## Legend labels were too wide. The labels have been resized to 0.44, 0.29, 0.29, 0.29, 0.29. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
## Legend labels were too wide. The labels have been resized to 0.44, 0.29, 0.29, 0.29, 0.29. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
## Legend labels were too wide. The labels have been resized to 0.44, 0.29, 0.29, 0.29, 0.29. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
## Legend labels were too wide. The labels have been resized to 0.44, 0.29, 0.29, 0.29, 0.29. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
```

<img src="03-Work-in-Progress_files/figure-html/unnamed-chunk-8-9.png" width="672" /><img src="03-Work-in-Progress_files/figure-html/unnamed-chunk-8-10.png" width="672" />

```r
glimpse(nz)
```

```
## Observations: 16
## Variables: 7
## $ Name          <chr> "Northland", "Auckland", "Waikato", "Bay of Plen...
## $ Island        <chr> "North", "North", "North", "North", "North", "No...
## $ Land_area     <dbl> 12500.5611, 4941.5726, 23900.0364, 12071.1447, 8...
## $ Population    <dbl> 175500, 1657200, 460100, 299900, 48500, 164000, ...
## $ Median_income <int> 23400, 29600, 27900, 26200, 24400, 26100, 29100,...
## $ Sex_ratio     <dbl> 0.9424532, 0.9442858, 0.9520500, 0.9280391, 0.93...
## $ geom          <MULTIPOLYGON [m]> MULTIPOLYGON (((1745493 600..., MUL...
```

### First `tmap` attempt


```r
ma1 = tm_shape(nz) + tm_fill(col = "red")
ma2 = tm_shape(nz) + tm_fill(col = "red", alpha = 0.3)
ma3 = tm_shape(nz) + tm_borders(col = "blue")
ma4 = tm_shape(nz) + tm_borders(lwd = 3)
ma5 = tm_shape(nz) + tm_borders(lty = 2)
ma6 = tm_shape(nz) + tm_fill(col = "red", alpha = 0.3) +
  tm_borders(col = "blue", lwd = 3, lty = 2)
tmap_arrange(ma1, ma2, ma3, ma4, ma5, ma6)
```

<img src="03-Work-in-Progress_files/figure-html/unnamed-chunk-9-1.png" width="672" />

#### Grey background


```r
tm_shape(nz) + 
        tm_fill(col = "black", alpha = 0.3)
```

<img src="03-Work-in-Progress_files/figure-html/unnamed-chunk-10-1.png" width="672" />

#### Boarders


```r
tm_shape(nz) + 
  tm_fill(col = "black", alpha = 0.3) +
   tm_borders(col = "blue")
```

<img src="03-Work-in-Progress_files/figure-html/unnamed-chunk-11-1.png" width="672" />

#### Title and legend


```r
legend_title <- expression("Area (km"^2*")")

tm_shape(nz) + 
  tm_fill(col = "black", alpha = 0.3) +
   tm_borders(col = "blue") + 
  tm_shape(nz) + 
    tm_fill(col = "Land_area", title = legend_title) + tm_borders()
```

<img src="03-Work-in-Progress_files/figure-html/unnamed-chunk-12-1.png" width="672" />

#### North arrow


```r
tm_shape(nz) + 
  tm_fill(col = "black", alpha = 0.3) +
   tm_borders(col = "blue") +
    tm_compass(type = "8star", position = c("left", "top"))
```

<img src="03-Work-in-Progress_files/figure-html/unnamed-chunk-13-1.png" width="672" />

#### Scale


```r
tm_shape(nz) + 
  tm_fill(col = "black", alpha = 0.3) +
   tm_borders(col = "blue") +
  tm_compass(type = "8star", position = c("left", "top")) +
  tm_scale_bar(breaks = c(0, 100, 200), text.size = 1)
```

<img src="03-Work-in-Progress_files/figure-html/unnamed-chunk-14-1.png" width="672" />

#### Black and white


```r
tm_shape(nz) + 
  tm_fill(col = "black", alpha = 0.3) + 
    tm_borders(lty = 2)
```

<img src="03-Work-in-Progress_files/figure-html/unnamed-chunk-15-1.png" width="672" />
