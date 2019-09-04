# Diving In {#divingin}

There are plenty of github repositories explaining the different types of GIS and using R.

Below is the public `google-my-maps` map that can be modified an worked on from within the window provided below.

<iframe src="https://www.google.com.au/maps/d/u/0/embed?mid=1DAgemW-rkdMHTO8fxnbvbSVF4H0XNLd_" width="640" height="480"></iframe>
{: .box-note}
**Note:** This can currently me modified and changed by anyone with the link. As it comes more important for the dataset to not be modified by others we will tighten this process up using the leaflet and shiny app process we are using for the mapping and analysis at the bottom of this post.

So far we have saved a `leaflet` `rmd` file as an html file and pasted it from the includes folder of the website. We will tighten this up too. :)

{% include interactive-maps.html %}

## Extra resources

To begin with check this is working in your local RStudio enviroment

1. Install the required packages. You need a recent version of the GDAL, GEOS, Proj.4, and UDUNITS libraries installed for this to work on Mac and Linux. More information on that at https://github.com/r-spatial/sf#installling.


```r
# devtools::install_github("robinlovelace/geocompr")
```


2. Load the ones we need:


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

3. Check it's all working, e.g. with this command:


```r
world %>%  plot()
```

```
## Warning: plotting the first 9 out of 10 attributes; use max.plot = 10 to
## plot all
```

![](02-Diving-In_files/figure-latex/unnamed-chunk-3-1.pdf)<!-- --> 

And some blogging on the matter [here](http://zevross.com/blog/2014/09/30/use-the-amazing-d3-library-to-animate-a-path-on-a-leaflet-map/).

#### *Content below from leaflet github account*

## Using Basemaps

Leaflet supports basemaps using [map tiles](https://www.mapbox.com/guides/how-web-maps-work/), popularized by Google Maps and now used by nearly all interactive web maps.

### Default (OpenStreetMap) Tiles

The easiest way to add tiles is by calling `addTiles()` with no arguments; by default, [OpenStreetMap](https://www.openstreetmap.org/) tiles are used.


```r
m <- leaflet() %>% setView(lng = -71.0589, lat = 42.3601, zoom = 12)
m %>% addTiles()
```

![](02-Diving-In_files/figure-latex/unnamed-chunk-4-1.pdf)<!-- --> 

### Third-Party Tiles

Alternatively, many popular free third-party basemaps can be added using the `addProviderTiles()` function, which is implemented using the [leaflet-providers plugin](https://github.com/leaflet-extras/leaflet-providers). See [here](http://leaflet-extras.github.io/leaflet-providers/preview/index.html) for the complete set.

As a convenience, leaflet also provides a named list of all the third-party tile providers that are supported by the plugin. This enables you to use auto-completion feature of your favorite R IDE (like RStudio) and not have to remember or look up supported tile providers; just type `providers$` and choose from one of the options. You can also use `names(providers)` to view all of the options.


```r
m %>% addProviderTiles(providers$Stamen.Toner)
```

![](02-Diving-In_files/figure-latex/unnamed-chunk-5-1.pdf)<!-- --> 

```r
m %>% addProviderTiles(providers$CartoDB.Positron)
```

![](02-Diving-In_files/figure-latex/unnamed-chunk-5-2.pdf)<!-- --> 

```r
m %>% addProviderTiles(providers$Esri.NatGeoWorldMap)
```

![](02-Diving-In_files/figure-latex/unnamed-chunk-5-3.pdf)<!-- --> 

Note that some tile set providers require you to register; see the [project page](https://github.com/leaflet-extras/leaflet-providers) for more information. You can pass access tokens/keys, and other options, to the tile provider by populating the `options` argument with the `providerTileOptions()` function.

### Custom Tile URL Template

If you happen to have a custom map tile URL template to use, you can provide it as an argument to `addTiles()`.

### WMS Tiles

You can use `addWMSTiles()` to add WMS (Web Map Service) tiles. The map below shows the Base Reflectivity (a measure of the intensity of precipitation occurring) using the WMS from the [Iowa Environmental Mesonet ](http://mesonet.agron.iastate.edu):


```r
leaflet() %>% addTiles() %>% setView(-93.65, 42.0285, zoom = 4) %>%
  addWMSTiles(
    "http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r.cgi",
    layers = "nexrad-n0r-900913",
    options = WMSTileOptions(format = "image/png", transparent = TRUE),
    attribution = "Weather data © 2012 IEM Nexrad"
  )
```

![](02-Diving-In_files/figure-latex/unnamed-chunk-6-1.pdf)<!-- --> 

### Combining Tile Layers

You aren't restricted to using a single basemap on a map; you can stack them by adding multiple tile layers. This generally only makes sense if the front tiles consist of semi transparent tiles, or have an adjusted opacity via the `options` argument.


```r
m %>% addProviderTiles(providers$MtbMap) %>%
  addProviderTiles(providers$Stamen.TonerLines,
    options = providerTileOptions(opacity = 0.35)) %>%
  addProviderTiles(providers$Stamen.TonerLabels)
```

![](02-Diving-In_files/figure-latex/unnamed-chunk-7-1.pdf)<!-- --> 

## Choropleths

Making choropleths with leaflet is easy. In this example, we'll duplicate the [step-by-step choropleth tutorial](http://leafletjs.com/examples/choropleth/) from the Leaflet.js website.

The final result will look like this (scroll to the end to see the completed code):


```
## [1] "SpatialPolygonsDataFrame"
## attr(,"package")
## [1] "sp"
```

![](02-Diving-In_files/figure-latex/unnamed-chunk-8-1.pdf)<!-- --> 

### Data source

We'll start by loading the data from JSON. While the Leaflet.js example loads the JSON directly into JavaScript, with the Leaflet R package we instead want to load the data into R.

In this case, we'll use the `geojsonio` package to load the data into `sp` objects, which will let us easily manipulate the geographic features, and their properties, in R.


```r
# states <- geojsonio::geojson_read("json/us-states.geojson", what = "sp")
class(states)
```

```
## [1] "SpatialPolygonsDataFrame"
## attr(,"package")
## [1] "sp"
```

```r
names(states)
```

```
## [1] "id"      "name"    "density"
```

As you can see, we now have a `SpatialPolygonsDataFrame` with `name` (state name) and `density` (population density in people/mi<sup>2</sup>) columns from the GeoJSON.

### Basic states map

Next, let's make a basic map with just the outline of the states. For our basemap, we'll use the same `"mapbox.light"` MapBox style that the example does; if you don't have a MapBox account, you can just use `addTiles()` in place of the `addProviderTiles` call, or choose a free provider.


```r
m <- leaflet(states) %>%
  setView(-96, 37.8, 4) %>%
  addProviderTiles("MapBox", options = providerTileOptions(
    id = "mapbox.light",
    accessToken = Sys.getenv('MAPBOX_ACCESS_TOKEN')))
```

We've saved the basic basemap as a separate variable `m` so we can easily iterate on the `addPolygons` call as we work through the rest of the tutorial.

To add uniform polygons with default styling, just call `addPolygons` with no additional arguments.


```r
m %>% addPolygons()
```

![](02-Diving-In_files/figure-latex/unnamed-chunk-11-1.pdf)<!-- --> 

### Adding some color

Now, let's color the states according to their population density. You have [various options](../colors.html) for mapping data to colors; for this example we'll match the Leaflet.js tutorial by mapping a specific set of bins into RColorBrewer colors.

First, we'll define the bins. This is a numeric vector that defines the boundaries between intervals (`(0,10]`, `(10,20]`, and so on).

Then, we'll call `colorBin` to generate a palette function that maps the RColorBrewer `"YlOrRd"` colors to our bins.

Finally, we'll modify `addPolygons` to use the palette function and the density values to generate a vector of colors for `fillColor`, and also add some other static style properties.


```r
bins <- c(0, 10, 20, 50, 100, 200, 500, 1000, Inf)
pal <- colorBin("YlOrRd", domain = states$density, bins = bins)
m %>% addPolygons(
  fillColor = ~pal(density),
  weight = 2,
  opacity = 1,
  color = "white",
  dashArray = "3",
  fillOpacity = 0.7)
```

![](02-Diving-In_files/figure-latex/unnamed-chunk-12-1.pdf)<!-- --> 

### Adding interaction

The next thing we'll want is to make the polygons highlight as the mouse passes over them. The `addPolygon` function has a `highlight` argument that makes this simple.


```r
m %>% addPolygons(
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
    bringToFront = TRUE))
```

![](02-Diving-In_files/figure-latex/unnamed-chunk-13-1.pdf)<!-- --> 

(The Leaflet.js tutorial also adds an event handler that zooms into a state when it's clicked. This isn't currently possible with the Leaflet R package, except with either custom JavaScript or using Shiny, both of which are outside the scope of this example.)

### Custom info

Now let's expose the state names and values to the user.

The Leaflet.js tutorial shows the hovered-over state's information in a custom control. Again, that's possible by adding custom JavaScript or using Shiny, but for this example we'll use the built-in labels feature instead.

We'll generate the labels by handcrafting some HTML, and passing it to `lapply(htmltools::HTML)` so that Leaflet knows to treat each label as HTML instead of as plain text. We'll also set some label options to improve the style of the label element itself.


```r
labels <- sprintf(
  "<strong>%s</strong><br/>%g people / mi<sup>2</sup>",
  states$name, states$density
) %>% lapply(htmltools::HTML)
m <- m %>% addPolygons(
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
    direction = "auto"))
m
```

![](02-Diving-In_files/figure-latex/unnamed-chunk-14-1.pdf)<!-- --> 

This is the final version of our polygon layer, so let's save the result back to the `m` variable.

### Legend

As our final step, let's add a legend. Because we chose to color our map using `colorBin`, the `addLegend` function makes it particularly easy to add a legend with the correct colors and intervals.


```r
m %>% addLegend(pal = pal, values = ~density, opacity = 0.7, title = NULL,
  position = "bottomright")
```

![](02-Diving-In_files/figure-latex/unnamed-chunk-15-1.pdf)<!-- --> 
