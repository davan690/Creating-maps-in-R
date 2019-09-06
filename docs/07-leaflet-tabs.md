---
flexdashboard::flex_dashboard:
runtime: shiny
---


```r
library(leaflet)
library(leaflet.extras)
```

<!--html_preserve--><div id="htmlwidget-99285541b65a740867c2" style="width:100%;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-99285541b65a740867c2">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap.BlackAndWhite",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"setMaxBounds","args":[1.422041,22.625227,13.528717,36.978083]},{"method":"addEasyButton","args":[{"icon":"ion-arrow-shrink","title":"Reset View","onClick":"function(btn, map){ map.setView(map._initialCenter, map._initialZoom); }","position":"topleft"}]}],"setView":[[7.1751893,30.2189853],7,[]]},"evals":["calls.2.args.0.onClick"],"jsHooks":{"render":[{"code":"function(el, x, data) {\n  return (\nfunction(el, x){ \n  var map = this; \n  map.whenReady(function(){\n    map._initialCenter = map.getCenter(); \n    map._initialZoom = map.getZoom();\n  });\n}).call(this.getMap(), el, x, data);\n}","data":null}]}}</script><!--/html_preserve-->


<!--html_preserve--><div class="tabbable">
<ul class="nav nav-tabs shiny-tab-input" id="tbSet1" data-tabsetid="8344">
<li class="active">
<a href="#tab-8344-1" data-toggle="tab" data-value="Tab Name 1">Tab Name 1</a>
</li>
<li>
<a href="#tab-8344-2" data-toggle="tab" data-value="Tab Name 2">Tab Name 2</a>
</li>
</ul>
<div class="tab-content" data-tabsetid="8344">
<div class="tab-pane active" data-value="Tab Name 1" id="tab-8344-1">
<div id="htmlwidget-705b2b1ca57d1ef1913c" style="width:100%;height:400px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-705b2b1ca57d1ef1913c">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap.BlackAndWhite",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"setMaxBounds","args":[1.422041,22.625227,13.528717,36.978083]},{"method":"addEasyButton","args":[{"icon":"ion-arrow-shrink","title":"Reset View","onClick":"function(btn, map){ map.setView(map._initialCenter, map._initialZoom); }","position":"topleft"}]}],"setView":[[7.1751893,30.2189853],7,[]]},"evals":["calls.2.args.0.onClick"],"jsHooks":{"render":[{"code":"function(el, x, data) {\n  return (\nfunction(el, x){ \n  var map = this; \n  map.whenReady(function(){\n    map._initialCenter = map.getCenter(); \n    map._initialZoom = map.getZoom();\n  });\n}).call(this.getMap(), el, x, data);\n}","data":null}]}}</script>
</div>
<div class="tab-pane" data-value="Tab Name 2" id="tab-8344-2">
<div id="htmlwidget-4302d887137d7789d24f" style="width:100%;height:400px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-4302d887137d7789d24f">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap.BlackAndWhite",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"setMaxBounds","args":[1.422041,22.625227,13.528717,36.978083]},{"method":"addEasyButton","args":[{"icon":"ion-arrow-shrink","title":"Reset View","onClick":"function(btn, map){ map.setView(map._initialCenter, map._initialZoom); }","position":"topleft"}]}],"setView":[[7.1751893,30.2189853],7,[]]},"evals":["calls.2.args.0.onClick"],"jsHooks":{"render":[{"code":"function(el, x, data) {\n  return (\nfunction(el, x){ \n  var map = this; \n  map.whenReady(function(){\n    map._initialCenter = map.getCenter(); \n    map._initialZoom = map.getZoom();\n  });\n}).call(this.getMap(), el, x, data);\n}","data":null}]}}</script>
</div>
</div>
</div><!--/html_preserve-->

# Leaflet tabs {#tabs}

<!--html_preserve--><div id="htmlwidget-0272794e5705157111d0" style="width:100%;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-0272794e5705157111d0">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap.BlackAndWhite",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"setMaxBounds","args":[1.422041,22.625227,13.528717,36.978083]},{"method":"addEasyButton","args":[{"icon":"ion-arrow-shrink","title":"Reset View","onClick":"function(btn, map){ map.setView(map._initialCenter, map._initialZoom); }","position":"topleft"}]}],"setView":[[7.1751893,30.2189853],7,[]]},"evals":["calls.2.args.0.onClick"],"jsHooks":{"render":[{"code":"function(el, x, data) {\n  return (\nfunction(el, x){ \n  var map = this; \n  map.whenReady(function(){\n    map._initialCenter = map.getCenter(); \n    map._initialZoom = map.getZoom();\n  });\n}).call(this.getMap(), el, x, data);\n}","data":null}]}}</script><!--/html_preserve-->
## Tests {.tabset}

*Still working on this...*

Would  be nice if something like this would work. And the headings and tabs function is not working. (For coding reasons not yet known by me but should be basic)

<!--html_preserve--><div id="htmlwidget-df70c83e428864f3e29a" style="width:100%;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-df70c83e428864f3e29a">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap.BlackAndWhite",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"setMaxBounds","args":[1.422041,22.625227,13.528717,36.978083]},{"method":"addEasyButton","args":[{"icon":"ion-arrow-shrink","title":"Reset View","onClick":"function(btn, map){ map.setView(map._initialCenter, map._initialZoom); }","position":"topleft"}]}],"setView":[[7.1751893,30.2189853],7,[]]},"evals":["calls.2.args.0.onClick"],"jsHooks":{"render":[{"code":"function(el, x, data) {\n  return (\nfunction(el, x){ \n  var map = this; \n  map.whenReady(function(){\n    map._initialCenter = map.getCenter(); \n    map._initialZoom = map.getZoom();\n  });\n}).call(this.getMap(), el, x, data);\n}","data":null}]}}</script><!--/html_preserve-->

<!--html_preserve--><div id="htmlwidget-46d0ae73231c1e0d6611" style="width:100%;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-46d0ae73231c1e0d6611">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addProviderTiles","args":["OpenStreetMap.BlackAndWhite",null,null,{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"setMaxBounds","args":[1.422041,22.625227,13.528717,36.978083]},{"method":"addEasyButton","args":[{"icon":"ion-arrow-shrink","title":"Reset View","onClick":"function(btn, map){ map.setView(map._initialCenter, map._initialZoom); }","position":"topleft"}]}],"setView":[[7.1751893,30.2189853],7,[]]},"evals":["calls.2.args.0.onClick"],"jsHooks":{"render":[{"code":"function(el, x, data) {\n  return (\nfunction(el, x){ \n  var map = this; \n  map.whenReady(function(){\n    map._initialCenter = map.getCenter(); \n    map._initialZoom = map.getZoom();\n  });\n}).call(this.getMap(), el, x, data);\n}","data":null}]}}</script><!--/html_preserve-->
