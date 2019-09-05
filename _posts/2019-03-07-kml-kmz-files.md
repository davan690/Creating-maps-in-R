---
layout: post
title: "KMZ files are just..."
subtitle: "...zipped KML files"
image: /img/tools.jpg
permlink: /first-post.html
tags: ["website", "overview", "general"]
bigimg: /img/filing.jpg
use-site-title: true
---

A KMZ file is just a zipped KML file, possibly with associated embedded images, icons, etc. So any program that supports KMZ files internally unzips them to access their KML files. That may be a reason why many open source programs do not bother supporting KMZ once KML support is implemented: you just need to use an additional unzipping library of your choice, to convert the KMZ to KML. The linked posts give some JavaScript-based solutions for unzipping.

## Resources

These resources are very basic but they may be helpful for me later.

- Found in [stack comments here](https://stackoverflow.com/questions/35867793/using-kmz-file-in-leaflet-map)

- {% for post in site.tags["kmz"] %}
    {{ post.title }} ({{ post.date | date_to_string }})
      {{ post.description }}
  {% endfor %}

## My notes

Example states for shiny-salesman app....

```
# From http://leafletjs.com/examples/choropleth/us-states.js
# Data Referenced from https://github.com/rstudio/leaflet/tree/master/docs/json/

states <- geojsonio::geojson_read("./json/us-states.geojson", what = "sp")
bins <- c(0, 10, 20, 50, 100, 200, 500, 1000, Inf)
pal <- colorBin("YlOrRd", domain = states$density, bins = bins)
labels <- sprintf(
  "<strong>%s</strong><br/>%g people / mi<sup>2</sup>",
  states$name, states$density
) %>% lapply(htmltools::HTML)
leaflet(states) %>%
  setView(-96, 37.8, 4) %>%
  addProviderTiles("MapBox", options = providerTileOptions(
    id = "mapbox.light",
    accessToken = Sys.getenv('MAPBOX_ACCESS_TOKEN'))) %>%
  addPolygons(
    fillColor = ~pal(density),
    weight = 2,
    opacity = 1,
    color = "white",
    dashArray = "3",
    fillOpacity = 0.7,
    highlight = highlightOptions(
      weight = 5,
      color = "#666",
      dashArray = "",
      fillOpacity = 0.7,
      bringToFront = TRUE),
    label = labels,
    labelOptions = labelOptions(
      style = list("font-weight" = "normal", padding = "3px 8px"),
      textsize = "15px",
      direction = "auto")) %>%
  addLegend(pal = pal, values = ~density, opacity = 0.7, title = NULL,
    position = "bottomright")
```

