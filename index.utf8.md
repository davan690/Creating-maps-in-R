---
title: "Using GIS for invasive species research"
author: "Anthony Davidson"
date: "2019-09-05"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib]
biblio-style: apalike
link-citations: yes
github-repo: davan690/Creating-maps-in-R
url: 'https://www.ssnhub.com/Creating-maps-in-R'
description: "Everything you need to start using GIS in RMarkdown/bookdown projects."
---

# Overview {#overview}

This respository contains a collection of dynamic programming tools and introductory tutorials for GIS in R.

## Project objectives

The overall objective is to create a landing page and collection of GIS work in R. All the examples will focus on invasive species dynamics for now but will extend to other areas of ecology and research. The current set of goals for this project also meet the requirements needed to produce the figures for my personal reproducible phd research.

### Objective One

*Produce static maps for the first publication of my PhD.*  Draft here - [Davidson2019a](https://www.ssnhub.com/beech-publication-wr/)

| Datasets |                                        |
|-----------|----------------------------|
|Beech forest dataset | <iframe src="https://www.google.com.au/maps/d/u/0/embed?mid=1DAgemW-rkdMHTO8fxnbvbSVF4H0XNLd_" width="150" height="100"></iframe> |

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
