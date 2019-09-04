# Introduction {#intro}



*Creating maps using spatial data in R*

GIS is an area of R coding I have kept away from hoping that I would work it out at a later date. Sadly, it has got to the point where I want to be able to build more complex maps in shiny applications towards the end of my PhD and need to create a base of code to go from. Luckily, the text book "Spatial Analysis in R" has just come out in its second edition and is available in as a bookdown repository including the full text [here](https://bookdown.org/robinlovelace/geocompr/).
This page is a outline of the current resources I am working on and using for my publication and website maps. I have begun by using my normal reproducible workflow and file structure.

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

<!--html_preserve--><div id="htmlwidget-20bab5b365bdc2d767b1" style="width:672px;height:240px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-20bab5b365bdc2d767b1">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"http://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addWMSTiles","args":["http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r.cgi",null,null,{"styles":"","format":"image/png","transparent":true,"version":"1.1.1","attribution":"Weather data © 2012 IEM Nexrad","layers":"nexrad-n0r-900913"}]}],"setView":[[42.0285,-93.65],4,[]]},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
