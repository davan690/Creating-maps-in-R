---
title: "Using GIS for invasive species research"
author: "Anthony Davidson"
<<<<<<< HEAD
date: "2019-09-05"
knit: bookdown::render_book
=======
date: "2019-09-06"
>>>>>>> jekyll-testing
site: bookdown::bookdown_site
documentclass: krantz
monofont: "Source Code Pro"
monofontoptions: "Scale=0.7"
bibliography: [book.bib]
biblio-style: apalike
link-citations: yes
github-repo: davan690/Creating-maps-in-R
url: 'https\://ssnhub.com/Creating-maps-in-R/'
description: "Everything you need to start using GIS in RMarkdown/bookdown projects."
cover-image: "images/cover.png"
colorlinks: yes
graphics: yes
---

# Overview {#overview}

<<<<<<< HEAD
This respository contains a collection of dynamic programming tools and introductory tutorials for dealing with maps and geo-spatical analysis using `rmarkdown and shiny`.
=======
This respository contains a collection of dynamic programming tools and introductory tutorials for GIS in R.
>>>>>>> jekyll-testing

## Project objectives

The overall objective is to create a landing page and collection of GIS work in R. All the examples will focus on invasive species dynamics for now but will extend to other areas of ecology and research. The current set of goals for this project also meet the requirements needed to produce the figures for my personal reproducible phd research.

<<<<<<< HEAD
### Objective one

*Produce **static-maps** for the first publication of my PhD.*

| Draft here | [Davidson2019a](https://www.ssnhub.com/beech-publication-wr/summary.html) |
|------------|---------------------------------------------------------------------------|
|            |                                                                           |

#### Datasets

  - Grid locations are in a `kmz` file called "invasive-species-location-research.kmz" [here](data/google-data/invasive-species-location-research.kmz)
    - `kml` file still called "invasive-species-location-research.kmz" [currently](data/google-data/invasive-species-location-research.kmz)
  - Outline of NZ here "" [here]()
  - Forest vegetation here "" [here]()
  - Data from landCare 2019 publication here "" [here]()
=======
### Objective One

*Produce static maps for the first publication of my PhD.*  Draft here - [Davidson2019a](https://www.ssnhub.com/beech-publication-wr/)

| Datasets |                                        |
|-----------|----------------------------|
|Beech forest dataset | <iframe src="https://www.google.com.au/maps/d/u/0/embed?mid=1DAgemW-rkdMHTO8fxnbvbSVF4H0XNLd_" width="150" height="100"></iframe> |
>>>>>>> jekyll-testing

  - Grid locations are can be downloaded as a `kmz` or `kml` file. This is currently labedl "invasive-species-location-research.kml" [here](data/google-data/invasive-species-location-research.kml)
  - NZ basic map examples are here under resources chapter
  - NZ Forest vegetation data comes from ... and saved as "" [here]()

### Objective Two

*Produce static maps for the following data-set* [Davidson2019b] [*same as above*]

### Objective Three

*Produce static maps for the following data-set* [Davidson2019c] [*same as above*]

## Get started...

1. Fork this repo [here](www.github.com/davan690/Creating-maps-in-R/)

2. Pull project into Rstudio using version control.

   ![1567561101782](img/fork.PNG)

3. Ensure that your local RStudio packages are up to date.

For more details this following the same contributing options as the website instructions [here](https://www.ssnhub.com/contributing/).

**Note** This book is built from the absolute minimum you need to start a  [bookdown](https://bookdown.org/yihui/bookdown/) book. You can find the preview of the unmodified template of the book at http://seankross.com/bookdown-start/

- All of the content of this repository is licensed [CC0](https://creativecommons.org/publicdomain/zero/1.0/).

The content of the mapping/GIS was orginally forked from from the following `github` repositories:

- [Creating maps in R](https://geocompr.robinlovelace.net/): A textbook on geocomputational analysis in R

### Packages

To run this book in RStudio the following packages are needed.

- [tidyverse]()
- [MapView](https://r-spatial.github.io/mapview/): a 3D interactive R packages
- [Video](https://www.youtube.com/watch?v=GMi1ThlGFMo)


```r
library(spData)
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
library(sf)
```

```
## Linking to GEOS 3.6.1, GDAL 2.2.3, PROJ 4.9.3
```

```r
library(bookdown)
library(leaflet)
library(leaflet.extras)
library(geojsonio)
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
