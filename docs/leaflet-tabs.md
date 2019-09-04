---
flexdashboard::flex_dashboard:
runtime: shiny
---


```r
library(leaflet)
library(leaflet.extras)
```

<!--html_preserve--><div id="htmlwidget-f453f66c8e177ada4c05" style="width:100%;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-f453f66c8e177ada4c05">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap.BlackAndWhite",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"setMaxBounds","args":[1.422041,22.625227,13.528717,36.978083]},{"method":"addEasyButton","args":[{"icon":"ion-arrow-shrink","title":"Reset View","onClick":"function(btn, map){ map.setView(map._initialCenter, map._initialZoom); }","position":"topleft"}]}],"setView":[[7.1751893,30.2189853],7,[]]},"evals":["calls.2.args.0.onClick"],"jsHooks":{"render":[{"code":"function(el, x, data) {\n  return (\nfunction(el, x){ \n  var map = this; \n  map.whenReady(function(){\n    map._initialCenter = map.getCenter(); \n    map._initialZoom = map.getZoom();\n  });\n}).call(this.getMap(), el, x, data);\n}","data":null}]}}</script><!--/html_preserve-->


<!--html_preserve--><div class="tabbable">
<ul class="nav nav-tabs shiny-tab-input" id="tbSet1" data-tabsetid="3991">
<li class="active">
<a href="#tab-3991-1" data-toggle="tab" data-value="Tab Name 1">Tab Name 1</a>
</li>
<li>
<a href="#tab-3991-2" data-toggle="tab" data-value="Tab Name 2">Tab Name 2</a>
</li>
</ul>
<div class="tab-content" data-tabsetid="3991">
<div class="tab-pane active" data-value="Tab Name 1" id="tab-3991-1">
<div id="htmlwidget-090dc361f840d52f6756" style="width:100%;height:400px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-090dc361f840d52f6756">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap.BlackAndWhite",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"setMaxBounds","args":[1.422041,22.625227,13.528717,36.978083]},{"method":"addEasyButton","args":[{"icon":"ion-arrow-shrink","title":"Reset View","onClick":"function(btn, map){ map.setView(map._initialCenter, map._initialZoom); }","position":"topleft"}]}],"setView":[[7.1751893,30.2189853],7,[]]},"evals":["calls.2.args.0.onClick"],"jsHooks":{"render":[{"code":"function(el, x, data) {\n  return (\nfunction(el, x){ \n  var map = this; \n  map.whenReady(function(){\n    map._initialCenter = map.getCenter(); \n    map._initialZoom = map.getZoom();\n  });\n}).call(this.getMap(), el, x, data);\n}","data":null}]}}</script>
</div>
<div class="tab-pane" data-value="Tab Name 2" id="tab-3991-2">
<div id="htmlwidget-bc35d6f14c68fe3f9e11" style="width:100%;height:400px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-bc35d6f14c68fe3f9e11">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap.BlackAndWhite",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"setMaxBounds","args":[1.422041,22.625227,13.528717,36.978083]},{"method":"addEasyButton","args":[{"icon":"ion-arrow-shrink","title":"Reset View","onClick":"function(btn, map){ map.setView(map._initialCenter, map._initialZoom); }","position":"topleft"}]}],"setView":[[7.1751893,30.2189853],7,[]]},"evals":["calls.2.args.0.onClick"],"jsHooks":{"render":[{"code":"function(el, x, data) {\n  return (\nfunction(el, x){ \n  var map = this; \n  map.whenReady(function(){\n    map._initialCenter = map.getCenter(); \n    map._initialZoom = map.getZoom();\n  });\n}).call(this.getMap(), el, x, data);\n}","data":null}]}}</script>
</div>
</div>
</div><!--/html_preserve-->

# Leaflet tabs {#tabs}

<!--html_preserve--><div id="htmlwidget-1215b695ac2483bb970c" style="width:100%;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-1215b695ac2483bb970c">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap.BlackAndWhite",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"setMaxBounds","args":[1.422041,22.625227,13.528717,36.978083]},{"method":"addEasyButton","args":[{"icon":"ion-arrow-shrink","title":"Reset View","onClick":"function(btn, map){ map.setView(map._initialCenter, map._initialZoom); }","position":"topleft"}]}],"setView":[[7.1751893,30.2189853],7,[]]},"evals":["calls.2.args.0.onClick"],"jsHooks":{"render":[{"code":"function(el, x, data) {\n  return (\nfunction(el, x){ \n  var map = this; \n  map.whenReady(function(){\n    map._initialCenter = map.getCenter(); \n    map._initialZoom = map.getZoom();\n  });\n}).call(this.getMap(), el, x, data);\n}","data":null}]}}</script><!--/html_preserve-->
## Tests {.tabset}

*Still working on this...*

Would  be nice if something like this would work. And the headings and tabs function is not working. (For coding reasons not yet known by me but should be basic)

<!--html_preserve--><div id="htmlwidget-923f38bfdeceecbd7fcf" style="width:100%;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-923f38bfdeceecbd7fcf">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap.BlackAndWhite",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"setMaxBounds","args":[1.422041,22.625227,13.528717,36.978083]},{"method":"addEasyButton","args":[{"icon":"ion-arrow-shrink","title":"Reset View","onClick":"function(btn, map){ map.setView(map._initialCenter, map._initialZoom); }","position":"topleft"}]}],"setView":[[7.1751893,30.2189853],7,[]]},"evals":["calls.2.args.0.onClick"],"jsHooks":{"render":[{"code":"function(el, x, data) {\n  return (\nfunction(el, x){ \n  var map = this; \n  map.whenReady(function(){\n    map._initialCenter = map.getCenter(); \n    map._initialZoom = map.getZoom();\n  });\n}).call(this.getMap(), el, x, data);\n}","data":null}]}}</script><!--/html_preserve-->

<!--html_preserve--><div id="htmlwidget-101879d696f61aeb9a44" style="width:100%;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-101879d696f61aeb9a44">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap.BlackAndWhite",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"setMaxBounds","args":[1.422041,22.625227,13.528717,36.978083]},{"method":"addEasyButton","args":[{"icon":"ion-arrow-shrink","title":"Reset View","onClick":"function(btn, map){ map.setView(map._initialCenter, map._initialZoom); }","position":"topleft"}]}],"setView":[[7.1751893,30.2189853],7,[]]},"evals":["calls.2.args.0.onClick"],"jsHooks":{"render":[{"code":"function(el, x, data) {\n  return (\nfunction(el, x){ \n  var map = this; \n  map.whenReady(function(){\n    map._initialCenter = map.getCenter(); \n    map._initialZoom = map.getZoom();\n  });\n}).call(this.getMap(), el, x, data);\n}","data":null}]}}</script><!--/html_preserve-->
