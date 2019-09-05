---
flexdashboard::flex_dashboard:
runtime: shiny
---


```r
library(leaflet)
library(leaflet.extras)
```

<!--html_preserve--><div id="htmlwidget-17e1a088875097fb72bb" style="width:100%;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-17e1a088875097fb72bb">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap.BlackAndWhite",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"setMaxBounds","args":[1.422041,22.625227,13.528717,36.978083]},{"method":"addEasyButton","args":[{"icon":"ion-arrow-shrink","title":"Reset View","onClick":"function(btn, map){ map.setView(map._initialCenter, map._initialZoom); }","position":"topleft"}]}],"setView":[[7.1751893,30.2189853],7,[]]},"evals":["calls.2.args.0.onClick"],"jsHooks":{"render":[{"code":"function(el, x, data) {\n  return (\nfunction(el, x){ \n  var map = this; \n  map.whenReady(function(){\n    map._initialCenter = map.getCenter(); \n    map._initialZoom = map.getZoom();\n  });\n}).call(this.getMap(), el, x, data);\n}","data":null}]}}</script><!--/html_preserve-->


<!--html_preserve--><div class="tabbable">
<ul class="nav nav-tabs shiny-tab-input" id="tbSet1" data-tabsetid="4519">
<li class="active">
<a href="#tab-4519-1" data-toggle="tab" data-value="Tab Name 1">Tab Name 1</a>
</li>
<li>
<a href="#tab-4519-2" data-toggle="tab" data-value="Tab Name 2">Tab Name 2</a>
</li>
</ul>
<div class="tab-content" data-tabsetid="4519">
<div class="tab-pane active" data-value="Tab Name 1" id="tab-4519-1">
<div id="htmlwidget-8df544142606a6801fcd" style="width:100%;height:400px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-8df544142606a6801fcd">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap.BlackAndWhite",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"setMaxBounds","args":[1.422041,22.625227,13.528717,36.978083]},{"method":"addEasyButton","args":[{"icon":"ion-arrow-shrink","title":"Reset View","onClick":"function(btn, map){ map.setView(map._initialCenter, map._initialZoom); }","position":"topleft"}]}],"setView":[[7.1751893,30.2189853],7,[]]},"evals":["calls.2.args.0.onClick"],"jsHooks":{"render":[{"code":"function(el, x, data) {\n  return (\nfunction(el, x){ \n  var map = this; \n  map.whenReady(function(){\n    map._initialCenter = map.getCenter(); \n    map._initialZoom = map.getZoom();\n  });\n}).call(this.getMap(), el, x, data);\n}","data":null}]}}</script>
</div>
<div class="tab-pane" data-value="Tab Name 2" id="tab-4519-2">
<div id="htmlwidget-15755689a07a4faa60bf" style="width:100%;height:400px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-15755689a07a4faa60bf">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap.BlackAndWhite",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"setMaxBounds","args":[1.422041,22.625227,13.528717,36.978083]},{"method":"addEasyButton","args":[{"icon":"ion-arrow-shrink","title":"Reset View","onClick":"function(btn, map){ map.setView(map._initialCenter, map._initialZoom); }","position":"topleft"}]}],"setView":[[7.1751893,30.2189853],7,[]]},"evals":["calls.2.args.0.onClick"],"jsHooks":{"render":[{"code":"function(el, x, data) {\n  return (\nfunction(el, x){ \n  var map = this; \n  map.whenReady(function(){\n    map._initialCenter = map.getCenter(); \n    map._initialZoom = map.getZoom();\n  });\n}).call(this.getMap(), el, x, data);\n}","data":null}]}}</script>
</div>
</div>
</div><!--/html_preserve-->

# Leaflet tabs {#tabs}

<!--html_preserve--><div id="htmlwidget-a70e9b20bcce17d1bf02" style="width:100%;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-a70e9b20bcce17d1bf02">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap.BlackAndWhite",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"setMaxBounds","args":[1.422041,22.625227,13.528717,36.978083]},{"method":"addEasyButton","args":[{"icon":"ion-arrow-shrink","title":"Reset View","onClick":"function(btn, map){ map.setView(map._initialCenter, map._initialZoom); }","position":"topleft"}]}],"setView":[[7.1751893,30.2189853],7,[]]},"evals":["calls.2.args.0.onClick"],"jsHooks":{"render":[{"code":"function(el, x, data) {\n  return (\nfunction(el, x){ \n  var map = this; \n  map.whenReady(function(){\n    map._initialCenter = map.getCenter(); \n    map._initialZoom = map.getZoom();\n  });\n}).call(this.getMap(), el, x, data);\n}","data":null}]}}</script><!--/html_preserve-->
## Tests {.tabset}

*Still working on this...*

Would  be nice if something like this would work. And the headings and tabs function is not working. (For coding reasons not yet known by me but should be basic)

<!--html_preserve--><div id="htmlwidget-c259a1d0efdad5539211" style="width:100%;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-c259a1d0efdad5539211">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap.BlackAndWhite",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"setMaxBounds","args":[1.422041,22.625227,13.528717,36.978083]},{"method":"addEasyButton","args":[{"icon":"ion-arrow-shrink","title":"Reset View","onClick":"function(btn, map){ map.setView(map._initialCenter, map._initialZoom); }","position":"topleft"}]}],"setView":[[7.1751893,30.2189853],7,[]]},"evals":["calls.2.args.0.onClick"],"jsHooks":{"render":[{"code":"function(el, x, data) {\n  return (\nfunction(el, x){ \n  var map = this; \n  map.whenReady(function(){\n    map._initialCenter = map.getCenter(); \n    map._initialZoom = map.getZoom();\n  });\n}).call(this.getMap(), el, x, data);\n}","data":null}]}}</script><!--/html_preserve-->

<!--html_preserve--><div id="htmlwidget-f69ada3656aea3c46f62" style="width:100%;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-f69ada3656aea3c46f62">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap.BlackAndWhite",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"setMaxBounds","args":[1.422041,22.625227,13.528717,36.978083]},{"method":"addEasyButton","args":[{"icon":"ion-arrow-shrink","title":"Reset View","onClick":"function(btn, map){ map.setView(map._initialCenter, map._initialZoom); }","position":"topleft"}]}],"setView":[[7.1751893,30.2189853],7,[]]},"evals":["calls.2.args.0.onClick"],"jsHooks":{"render":[{"code":"function(el, x, data) {\n  return (\nfunction(el, x){ \n  var map = this; \n  map.whenReady(function(){\n    map._initialCenter = map.getCenter(); \n    map._initialZoom = map.getZoom();\n  });\n}).call(this.getMap(), el, x, data);\n}","data":null}]}}</script><!--/html_preserve-->
