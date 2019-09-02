--- 
title: "Using GIS for invasive species research"
author: "Anthony Davidson"
date: "2019-09-02"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib]
biblio-style: apalike
link-citations: yes
github-repo: davan690/Creating-maps-in-R
url: 'https://www.ssnhub.com/beech-publication-wr'
description: "Everything you need to start using GIS in RMarkdown/bookdown projects."
bookdown::gitbook:
  css: style.css
  config:
    toc:
      before: |
        <li><a href="./">Small mammal dynamics in NZ beech forests.</a></li>
      after: |
        <li><a href="https://github.com/davan690/beech-publication-wr" target="blank">Published with bookdown</a></li>
    edit: https://github.com/davan690/beech-publication-wr/docs/%s
    download: ["pdf", "epub", "mobi", "docx"]
bookdown::pdf_book:
  includes:
    in_header: preamble.tex
  latex_engine: xelatex
  citation_package: natbib
bookdown::epub_book: default
bookdown::word_document2:
  reference_docx: ms4.docx
  fig_caption: yes
  toc: yes
editor_options:
  chunk_output_type: console
---

# Preface {-}

This is the very first part of the book. This respositiory is a collection of introductory tutorials for mapping/GIS from a collection on `github` repositories.

- 'creating maps in R': Geocomputational analysis in R and other supporting documents ranging from blogs to scientific publications.

## The objectives

Create a landing page and resource of GIS work in R. With a particular focus on invasive species dynamics. The current goals are as follows:

1. Produce static maps for the first publication of my PhD. [Draft here](https://www.ssnhub.com/2019-05-03-beech-forest-objectives).

- Datasets
  - Grid locations are in a csv file called ""
  - Outline of NZ here ""
  - Forest vegetation here ""
  - Data from landCare 2019 publication here ""

- Rcode
  - My attempt so far ""
  - GIS cheat ""
  - Powerpoint cheat ""

- Static maps
  - NZ beech forest dynamics
  - 8 grids full data
  - only 6 used
  - South Island of NZ

2. Produce static maps for the following data-set (Davidson2019b)

*same as above*

3. Produce static maps for the following data-set (Davidson2019c)

*same as above*

## Resources

- Vignettes
  - Creating maps in R ""
  - Book vignettes ""
  - My developing docs ""

- Examples
  - LandCare 2019 publication here ""
  
- Software
  - This is the absolute minimum you need to start a [bookdown](https://bookdown.org/yihui/bookdown/) book. You can find the
preview of this book at http://seankross.com/bookdown-start/

- All of the content of this repository is licensed [CC0](https://creativecommons.org/publicdomain/zero/1.0/).

## My notes

<!--chapter:end:index.Rmd-->

# Introduction

This is the first real chapter.


<!--chapter:end:01-Introduction.Rmd-->

# Diving In

Now let's talk details.

<!--chapter:end:02-Diving-In.Rmd-->
