---
layout: post
title: "KMZ files are just..."
subtitle: "...zipped KML files"
image: /img/tools.jpg
permlink: /kmz-files-kml.html
tags: ["website", "overview", "general", "kmz"]
bigimg: /img/filing.jpg
use-site-title: true
---

A KMZ file is just a zipped KML file, possibly with associated embedded images, icons, etc. So any program that supports KMZ files internally unzips them to access their KML files. That may be a reason why many open source programs do not bother supporting KMZ once KML support is implemented: you just need to use an additional unzipping library of your choice, to convert the KMZ to KML. The linked posts give some JavaScript-based solutions for unzipping.

## Extracting data from my-maps data

I like the idea of sticking with this process so that "google" will manage the security of the data instead of any open-source tools with security issues.

## Resources

We need to convert the my-maps data from a zipped `kml` file that is stored as the `kmz` file downloaded from mymaps data. 

### `kmz` conversion

Follow these steps:

1. Download data

![1563249969502](./img/kml-mymaps-download.png)

1. Add `.zip` to `.kml` file
2. Unzip renamed file (as per normal in windows)
3. Change the file extention to `kmz`
4. Import correct file sections using the following code:

```{r}
##librares needed
library(rgdal)
library(tidyverse)
library(ggplot2)
```

```{r kmz-kml}

nc <- st_read(system.file("shape/nc.shp", package="sf"), quiet = TRUE)
# limit to first 2 counties
nc <- nc[1:2,]
# convert to SpatialPolygonsDataFrame
nc_sp <- as(nc, "Spatial")


file <- "data/Canberra-Transit.kmz/doc.kml"

?readOGR
SST_start = readOGR(file)
# OGR data source with driver: LIBKML
# Source: "Burrows_et_al_Nature_traj_ocean_NH1.kmz", layer: "SST_start"
# with 42205 features
# It has 12 fields
SST_1 = readOGR(file,"SST_1")
OGR data source with driver: LIBKML
Source: "Burrows_et_al_Nature_traj_ocean_NH1.kmz", layer: "SST_1"
with 7719 features
It has 12 fields
```

## My notes

Found in [stack comments here](https://stackoverflow.com/questions/35867793/using-kmz-file-in-leaflet-map)