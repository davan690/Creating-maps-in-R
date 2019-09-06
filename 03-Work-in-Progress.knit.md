# Work in progress {#wnp}


```r
library(tidyverse)
```

```
## -- Attaching packages --------------------------------------------------------------------------- tidyverse 1.2.1 --
```

```
## v ggplot2 3.2.1     v purrr   0.3.2
## v tibble  2.1.3     v dplyr   0.8.3
## v tidyr   0.8.3     v stringr 1.4.0
## v readr   1.3.1     v forcats 0.4.0
```

```
## -- Conflicts ------------------------------------------------------------------------------ tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
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
## Linking to GEOS 3.6.1, GDAL 2.2.3, PROJ 4.9.3
```

```
## Registered S3 method overwritten by 'geojsonio':
##   method         from 
##   print.location dplyr
```

```
## 
## Attaching package: 'geojsonio'
```

```
## The following object is masked from 'package:base':
## 
##     pretty
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
kable(tidy.kat, formatv = "markdown")
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> folder </th>
   <th style="text-align:left;"> name </th>
   <th style="text-align:left;"> description </th>
   <th style="text-align:left;"> styleUrl </th>
   <th style="text-align:right;"> longitude </th>
   <th style="text-align:right;"> latitude </th>
   <th style="text-align:right;"> altitude </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Hollyford </td>
   <td style="text-align:left;"> Gunns Camp </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> #icon-1899-0288D1-nodesc </td>
   <td style="text-align:right;"> 168.1392 </td>
   <td style="text-align:right;"> -44.76039 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hollyford </td>
   <td style="text-align:left;"> Choqenout and Ruscoe 2000 </td>
   <td style="text-align:left;"> Eglinton Valley </td>
   <td style="text-align:left;"> #icon-1899-0288D1 </td>
   <td style="text-align:right;"> 167.9963 </td>
   <td style="text-align:right;"> -45.06019 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hollyford </td>
   <td style="text-align:left;"> Hollyford Valley Lookout </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> #icon-1899-0288D1-nodesc </td>
   <td style="text-align:right;"> 168.1050 </td>
   <td style="text-align:right;"> -44.80905 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hollyford </td>
   <td style="text-align:left;"> Hollyford Airstrip </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> #icon-1899-0288D1-nodesc </td>
   <td style="text-align:right;"> 168.1337 </td>
   <td style="text-align:right;"> -44.73744 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hollyford </td>
   <td style="text-align:left;"> Point 9 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> #icon-1899-0288D1-nodesc </td>
   <td style="text-align:right;"> 168.1262 </td>
   <td style="text-align:right;"> -44.79766 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hollyford </td>
   <td style="text-align:left;"> Point 10 </td>
   <td style="text-align:left;"> x = 10, y = 250 </td>
   <td style="text-align:left;"> #icon-1899-0288D1 </td>
   <td style="text-align:right;"> 168.0794 </td>
   <td style="text-align:right;"> -44.90247 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Eglinton Valley </td>
   <td style="text-align:left;"> MR1 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> #icon-1899-F9A825-nodesc </td>
   <td style="text-align:right;"> 168.0776 </td>
   <td style="text-align:right;"> -44.89081 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Eglinton Valley </td>
   <td style="text-align:left;"> M1 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> #icon-1899-FBC02D-nodesc </td>
   <td style="text-align:right;"> 168.1005 </td>
   <td style="text-align:right;"> -44.85371 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Eglinton Valley </td>
   <td style="text-align:left;"> M1 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> #icon-1899-FBC02D-nodesc </td>
   <td style="text-align:right;"> 168.0748 </td>
   <td style="text-align:right;"> -44.89257 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Eglinton Valley </td>
   <td style="text-align:left;"> R1 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> #icon-1899-000000-nodesc </td>
   <td style="text-align:right;"> 168.0968 </td>
   <td style="text-align:right;"> -44.85569 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Eglinton Valley </td>
   <td style="text-align:left;"> MR1 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> #icon-1899-FBC02D-nodesc </td>
   <td style="text-align:right;"> 168.0995 </td>
   <td style="text-align:right;"> -44.85768 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Eglinton Valley </td>
   <td style="text-align:left;"> R1 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> #icon-1899-000000-nodesc </td>
   <td style="text-align:right;"> 168.0789 </td>
   <td style="text-align:right;"> -44.89277 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table>

## Building maps for manuscripts

These starting resources have come from `chapter-8` of the geocomp book. To make this quick I have used the `rmarkdown` function `render` to create a `r` file that can then be sourced here for building my data specific maps.


```r
# rmarkdown::render("./03-Work-In-Progress.Rmd")
# knitr::purl("./03-Work-In-Progress.Rmd", "./R/03-Work-In-Progress.R", documentation = 2)
```



















