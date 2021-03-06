# Diving In {#divingin}

There are plenty of github repositories explaining the different types of GIS and using R.

Below is the public `google-my-maps` map that can be modified an worked on from within the window provided below.

<iframe src="https://www.google.com.au/maps/d/u/0/embed?mid=1DAgemW-rkdMHTO8fxnbvbSVF4H0XNLd_" width="640" height="480"></iframe>
{: .box-note}

**Note:** This can currently me modified and changed by anyone with the link. As it comes more important for the dataset to not be modified by others we will tighten this process up using the leaflet and shiny app process we are using for the mapping and analysis at the bottom of this post.

So far we have saved a `leaflet` `rmd` file as an html file and pasted it from the includes folder of the website. We will tighten this up too. :)

## Downloading

To begin with check this is working in your local RStudio enviroment

1. Install the required packages. You need a recent version of the GDAL, GEOS, Proj.4, and UDUNITS libraries installed for this to work on Mac and Linux. More information on that at https://github.com/r-spatial/sf#installling.


```r
# devtools::install_github("robinlovelace/geocompr")
```

2. Load the ones we need:

- In addition, it uses the following visualization packages:


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

3. Check it's all working, e.g. with this command:


```r
world %>%  
  plot()
```

<img src="02-Diving-In_files/figure-html/unnamed-chunk-2-1.png" width="672" />

And some blogging on the matter [here](http://zevross.com/blog/2014/09/30/use-the-amazing-d3-library-to-animate-a-path-on-a-leaflet-map/).

There are plenty of github repositories explaining the different types of GIS and using R. Below is the public `google-my-maps` map that can be modified an worked on from within the window provided below.

## `kml` to `tidy` dataset

Import data from downloaded `kml` file from the my-maps data.

1. Download the `kml` file from online (NOT the `kmz` file)

{.:Note} A `KMZ` file is just a zipped `KML` [file](https://en.wikipedia.org/wiki/Keyhole_Markup_Language), possibly with associated embedded images, icons, etc. 

So any program that supports `KMZ` files internally unzips them to access their KML files. That may be a reason why many open source programs do not bother supporting KMZ once KML support is implemented: you just need to use an additional unzipping library of your choice, to convert the KMZ to KML. The linked posts give some JavaScript-based solutions for unzipping.


```r
source("./R/kml_to_tidy.R")
```

```
## -- Attaching packages ------------------------- tidyverse 1.2.1 --
```

```
## v tibble  2.1.3     v purrr   0.3.2
## v tidyr   1.0.0     v stringr 1.4.0
## v readr   1.3.1     v forcats 0.4.0
```

```
## -- Conflicts ---------------------------- tidyverse_conflicts() --
## x tidyr::extract() masks raster::extract()
## x dplyr::filter()  masks stats::filter()
## x dplyr::lag()     masks stats::lag()
## x raster::select() masks dplyr::select()
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
tidy.kat
```

```
## # A tibble: 12 x 7
##    folder    name       description styleUrl    longitude latitude altitude
##    <chr>     <chr>      <chr>       <chr>           <dbl>    <dbl>    <dbl>
##  1 Hollyford Gunns Camp <NA>        #icon-1899~      168.    -44.8        0
##  2 Hollyford Choqenout~ Eglinton V~ #icon-1899~      168.    -45.1        0
##  3 Hollyford Hollyford~ <NA>        #icon-1899~      168.    -44.8        0
##  4 Hollyford Hollyford~ <NA>        #icon-1899~      168.    -44.7        0
##  5 Hollyford Point 9    <NA>        #icon-1899~      168.    -44.8        0
##  6 Hollyford Point 10   x = 10, y ~ #icon-1899~      168.    -44.9        0
##  7 Eglinton~ MR1        <NA>        #icon-1899~      168.    -44.9        0
##  8 Eglinton~ M1         <NA>        #icon-1899~      168.    -44.9        0
##  9 Eglinton~ M1         <NA>        #icon-1899~      168.    -44.9        0
## 10 Eglinton~ R1         <NA>        #icon-1899~      168.    -44.9        0
## 11 Eglinton~ MR1        <NA>        #icon-1899~      168.    -44.9        0
## 12 Eglinton~ R1         <NA>        #icon-1899~      168.    -44.9        0
```

### Save

Save csv data for arcGIS work from here as:


```r
# write.csv(tidy.kat, "./data/kml_tidy_data.csv")
```

