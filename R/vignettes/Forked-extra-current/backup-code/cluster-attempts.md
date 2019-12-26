Failed cluster attempts
========================================================

Trying to get smooth polygons:


{% highlight r %}
lns <- slot(SLDF[6,], "lines")
{% endhighlight %}



{% highlight text %}
## Error in slot(SLDF[6, ], "lines"): object 'SLDF' not found
{% endhighlight %}



{% highlight r %}
plot(SLDF[6,])
{% endhighlight %}



{% highlight text %}
## Error in plot(SLDF[6, ]): object 'SLDF' not found
{% endhighlight %}



{% highlight r %}
SLDm <- lapply( SLDF@lines , slot , "Lines" )
{% endhighlight %}



{% highlight text %}
## Error in lapply(SLDF@lines, slot, "Lines"): object 'SLDF' not found
{% endhighlight %}



{% highlight r %}
plot(SLDm) ## fail
{% endhighlight %}



{% highlight text %}
## Error in plot(SLDm): object 'SLDm' not found
{% endhighlight %}

Try to convert lines to polys, Bivand style:


{% highlight r %}
SLDH <- SLDF[6,]
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'SLDF' not found
{% endhighlight %}



{% highlight r %}
lns <- slot(SLDH, "lines")
{% endhighlight %}



{% highlight text %}
## Error in slot(SLDH, "lines"): object 'SLDH' not found
{% endhighlight %}



{% highlight r %}
table(sapply(lns, function(x) length(slot(x, "Lines"))))
{% endhighlight %}



{% highlight text %}
## Error in lapply(X = X, FUN = FUN, ...): object 'lns' not found
{% endhighlight %}



{% highlight r %}
islands <- sapply(lns, function(x) { # fail
crds <- slot(slot(x, "Lines")[[1]], "coords")
identical(crds[1, ], crds[nrow(crds), ])
})
{% endhighlight %}



{% highlight text %}
## Error in lapply(X = X, FUN = FUN, ...): object 'lns' not found
{% endhighlight %}



{% highlight r %}
list_of_Lines <- slot(islands, "lines")
{% endhighlight %}



{% highlight text %}
## Error in slot(islands, "lines"): cannot get a slot ("lines") from an object of type "double"
{% endhighlight %}



{% highlight r %}
islands_sp <- SpatialPolygons(lapply(list_of_Lines, function(x) {
Polygons(list(Polygon(slot(slot(x, "Lines")[[1]],
"coords"))), ID = slot(x, "ID"))
}), proj4string = proj4string(lnd))
{% endhighlight %}



{% highlight text %}
## Error in SpatialPolygons(lapply(list_of_Lines, function(x) {: could not find function "SpatialPolygons"
{% endhighlight %}



{% highlight r %}
summary(islands_sp)
{% endhighlight %}



{% highlight text %}
## Error in summary(islands_sp): object 'islands_sp' not found
{% endhighlight %}



{% highlight r %}
islands <- sapply(lns, function(x) {
crds <- slot(slot(x, "Lines")[[1]], "coords")
identical(crds[1, ], crds[nrow(crds), ])
})
{% endhighlight %}



{% highlight text %}
## Error in lapply(X = X, FUN = FUN, ...): object 'lns' not found
{% endhighlight %}



{% highlight r %}
table(islands)
{% endhighlight %}



{% highlight text %}
## islands
##    12    13    14    15    16    19    21    23    25    26    29 
##     1     3     2     2     3     1     1     1     1     1     2 
##    30    32    33    36    40    42    43    44    49    58    73 
##     2     1     1     1     1     1     2     1     1     1     1 
##    82    84    89   183   184   227   280   306   840  2968  3745 
##     2     1     1     1     1     1     1     1     1     1     1 
##  5500  6795  9390 11506 16988 
##     1     1     1     1     1
{% endhighlight %}

table(sapply(lns, function(x) length(slot(x, "Lines"))))

lclusts <- sapply(lns, function(x) {
crds <- slot(slot(x, "Lines")[[1]], "coords")
identical(crds[1, ], crds[nrow(crds), ])
})
table(lclusts)
lls <- SLDF[6,lclusts]
plot(lls)
plot(lclusts, col="red")

plot(SLDF[6,], add=T)
lbc <- gIntersection(lb, SLDF[6,])
plot(lbc)
```

Let's try it with `clusterset`:

{% highlight r %}
example(clusterset)
{% endhighlight %}



{% highlight text %}
## Warning in example(clusterset): no help found for 'clusterset'
{% endhighlight %}



{% highlight r %}
plot(clusterset(sSp, result="domain", ))
{% endhighlight %}



{% highlight text %}
## Error in clusterset(sSp, result = "domain", ): could not find function "clusterset"
{% endhighlight %}

Extracting it directly from the density:

{% highlight r %}
summary(Dens$v)[,1:3]
{% endhighlight %}



{% highlight text %}
## Error in summary(Dens$v): object 'Dens' not found
{% endhighlight %}



{% highlight r %}
Dsub <- Dens[which(Dens$v > 1.675e-07)]
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'Dens' not found
{% endhighlight %}



{% highlight r %}
summary(Dsub)
{% endhighlight %}



{% highlight text %}
## Error in summary(Dsub): object 'Dsub' not found
{% endhighlight %}



{% highlight r %}
plot(Dsub)
{% endhighlight %}



{% highlight text %}
## Error in plot(Dsub): object 'Dsub' not found
{% endhighlight %}

Using the lines to clip a polygon of London.


{% highlight r %}
# lb <- unionSpatialPolygons(lnd, IDs=1:nrow(lnd) ) # don't seem to work
library(rgeos)
{% endhighlight %}



{% highlight text %}
## Error in library(rgeos): there is no package called 'rgeos'
{% endhighlight %}



{% highlight r %}
lb <- gUnaryUnion(lnd)
{% endhighlight %}



{% highlight text %}
## Error in gUnaryUnion(lnd): could not find function "gUnaryUnion"
{% endhighlight %}



{% highlight r %}
library(raster)
{% endhighlight %}



{% highlight text %}
## Error in library(raster): there is no package called 'raster'
{% endhighlight %}



{% highlight r %}
Dr <- raster(Dsg)
{% endhighlight %}



{% highlight text %}
## Error in raster(Dsg): could not find function "raster"
{% endhighlight %}



{% highlight r %}
proj4string(Dr) <- proj4string(stations)
{% endhighlight %}



{% highlight text %}
## Error in proj4string(stations): could not find function "proj4string"
{% endhighlight %}



{% highlight r %}
Drc <- cut(Dr, breaks=8) 
{% endhighlight %}



{% highlight text %}
## Error in cut(Dr, breaks = 8): object 'Dr' not found
{% endhighlight %}



{% highlight r %}
Drp <- rasterToPolygons(Drc, dissolve=T) # create density polygons
{% endhighlight %}



{% highlight text %}
## Error in rasterToPolygons(Drc, dissolve = T): could not find function "rasterToPolygons"
{% endhighlight %}



{% highlight r %}
spplot(Drp) # check that the clustering worked OK
{% endhighlight %}



{% highlight text %}
## Error in spplot(Drp): could not find function "spplot"
{% endhighlight %}



{% highlight r %}
lclust <- Drp[3,]
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'Drp' not found
{% endhighlight %}



{% highlight r %}
plot(lb)
{% endhighlight %}



{% highlight text %}
## Error in plot(lb): object 'lb' not found
{% endhighlight %}



{% highlight r %}
plot(lclust, add = T)
{% endhighlight %}



{% highlight text %}
## Error in plot(lclust, add = T): object 'lclust' not found
{% endhighlight %}



{% highlight r %}
plot(stations[lclust,], add=T, col = "red")
{% endhighlight %}



{% highlight text %}
## Error in plot(stations[lclust, ], add = T, col = "red"): object 'stations' not found
{% endhighlight %}
