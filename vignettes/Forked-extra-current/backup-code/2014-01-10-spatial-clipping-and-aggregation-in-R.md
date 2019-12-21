---
layout: post
title: Spatial clipping and aggregation in R
categories:
- R
tags:
- spatial data
- visualisation
- open source
---

A common task in GIS is comparing the spatial extent of one layer with another. 
Say you have a load of points, some of which overlay a polygon layer. You are only interested 
in the points that *intersect* with the points. What do you do? Also, how can you aggregated-up
the values contained in the points to correspond with the polygons. 
These are complex computational problems. In this post 
we will see how recent updates to R's `sp` package make
the solution surprisingly intuitive and incredibly terse.
![Input data for spatial clipping/aggregation](figure/Sampling_and_plotting_stations.png)

# Loading the data

All of the data (and more) for this can be downloaded from the 
tutorial page on [GitHub](https://github.com/Robinlovelace/Creating-maps-in-R).
To make this tutorial reproducible on any computer, we will download each input dataset 
from within R using `download.file`.




{% highlight r %}
library(sp)
download.file("http://robinlovelace.net/data/lnd.RData", destfile = "lnd.RData")
{% endhighlight %}



{% highlight text %}
## Warning in download.file("http://robinlovelace.net/data/lnd.RData",
## destfile = "lnd.RData"): cannot open URL 'http://robinlovelace.net/
## data/lnd.RData': HTTP status was '404 Not Found'
{% endhighlight %}



{% highlight text %}
## Error in download.file("http://robinlovelace.net/data/lnd.RData", destfile = "lnd.RData"): cannot open URL 'http://robinlovelace.net/data/lnd.RData'
{% endhighlight %}



{% highlight r %}
download.file("http://robinlovelace.net/data/stations.RData", destfile = "stations.RData")
{% endhighlight %}



{% highlight text %}
## Warning in download.file("http://robinlovelace.net/data/
## stations.RData", : cannot open URL 'http://robinlovelace.net/data/
## stations.RData': HTTP status was '404 Not Found'
{% endhighlight %}



{% highlight text %}
## Error in download.file("http://robinlovelace.net/data/stations.RData", : cannot open URL 'http://robinlovelace.net/data/stations.RData'
{% endhighlight %}



{% highlight r %}
load("lnd.RData")
{% endhighlight %}



{% highlight text %}
## Warning in readChar(con, 5L, useBytes = TRUE): cannot open compressed
## file 'lnd.RData', probable reason 'No such file or directory'
{% endhighlight %}



{% highlight text %}
## Error in readChar(con, 5L, useBytes = TRUE): cannot open the connection
{% endhighlight %}



{% highlight r %}
load("stations.RData")
{% endhighlight %}



{% highlight text %}
## Warning in readChar(con, 5L, useBytes = TRUE): cannot open compressed
## file 'stations.RData', probable reason 'No such file or directory'
{% endhighlight %}



{% highlight text %}
## Error in readChar(con, 5L, useBytes = TRUE): cannot open the connection
{% endhighlight %}



{% highlight r %}
plot(stations[sample(1:nrow(stations), 500), ])
{% endhighlight %}



{% highlight text %}
## Error in plot(stations[sample(1:nrow(stations), 500), ]): object 'stations' not found
{% endhighlight %}



{% highlight r %}
plot(lnd, add = T, col = "red")
{% endhighlight %}



{% highlight text %}
## Error in plot(lnd, add = T, col = "red"): object 'lnd' not found
{% endhighlight %}

# Spatial subsetting (clipping)

As the plot demonstrates, the stations are far more exentsive than polygons of 
central London. We must therefore clip them. Doing this manually would take 
much time - we'd have to interrogate the coordinates of each point to see 
whether or not it falls within one of the polygon boundaries. 

Fortunately with have the `over` function from the `sp` package to make this 
operation more terse:


{% highlight r %}
sel <- over(stations, lnd)
{% endhighlight %}



{% highlight text %}
## Error in over(stations, lnd): object 'stations' not found
{% endhighlight %}



{% highlight r %}
stations <- stations[!is.na(sel[,1]),]
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'stations' not found
{% endhighlight %}

As if that weren't enough, the developers of `sp` have integrated 
spatial subsetting into R's main index system with the square brackets.
Because this is a common procedure it is actually possible 
to perform it with a single line of code: 


{% highlight r %}
stations <- stations[lnd, ]
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'stations' not found
{% endhighlight %}



{% highlight r %}
plot(stations)
{% endhighlight %}



{% highlight text %}
## Error in plot(stations): object 'stations' not found
{% endhighlight %}

As the figure shows, only stations within the London borroughs are now shown.
All that was needed was to place another spatial object in the row 
index of the points (`[lnd, ]`) and R automatically understood that a
subset based on location should be produced. This line of code is an example 
of R's 'terseness' - only a single line of code is needed to perform what 
is in fact quite a complex operation.

The *third* way to acheive the 
same result uses the `rgeos` package. 
This is more complex and not included in this tutorial
(interested readers can see a vignette of this, to accomany the tutorial 
on [RPubs.com/Robinlovelace](http://rpubs.com/RobinLovelace/11796)). 
The next section demonstrates
spatial aggregation, a more advanced version of spatial subsetting.

# Spatial aggregation

As with R's very terse code for spatial subsetting, the base function 
`aggregate` (which provides summaries of variables based on some grouping variable)
also behaves differently when the inputs are spatial objects. 


{% highlight r %}
stations.c <- aggregate(stations, lnd, length)
{% endhighlight %}



{% highlight text %}
## Error in aggregate(stations, lnd, length): object 'stations' not found
{% endhighlight %}



{% highlight r %}
stations.c@data[, 1]
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'stations.c' not found
{% endhighlight %}

The above code performs a number of steps in just one line:

- `aggregate` identifies which `lnd` polygon (borrough) each `station` is located in and groups them accordingly
- it counts the number of stations in each borrough
- a new spatial object is created and assigned the name `stations.c`, the count of stations

As shown below, the spatial implementation of `aggregate` can provide summary statistics of variables.
In this case we take the variable `NUMBER` and find its mean value for the stations in each ward.


{% highlight r %}
stations.m <- aggregate(stations[c("NUMBER")] , by = lnd, FUN = mean)
{% endhighlight %}



{% highlight text %}
## Error in aggregate(stations[c("NUMBER")], by = lnd, FUN = mean): object 'stations' not found
{% endhighlight %}

For an optional advanced task, let us analyse and plot the result.


{% highlight r %}
q <- cut(stations.m$NUMBER,  breaks= c(quantile(stations.m$NUMBER)), include.lowest=T)
{% endhighlight %}



{% highlight text %}
## Error in cut(stations.m$NUMBER, breaks = c(quantile(stations.m$NUMBER)), : object 'stations.m' not found
{% endhighlight %}



{% highlight r %}
summary(q)
{% endhighlight %}



{% highlight text %}
## Error in object[[i]]: object of type 'closure' is not subsettable
{% endhighlight %}



{% highlight r %}
clr <- as.character(factor(q, labels = paste0("grey", seq(20, 80, 20))))
{% endhighlight %}



{% highlight text %}
## Error in unique.default(x, nmax = nmax): unique() applies only to vectors
{% endhighlight %}



{% highlight r %}
plot(stations.m, col = clr)
{% endhighlight %}



{% highlight text %}
## Error in plot(stations.m, col = clr): object 'stations.m' not found
{% endhighlight %}



{% highlight r %}
legend(legend = paste0("q", 1:4), fill = paste0("grey", seq(20, 80, 20)),  "topright")
{% endhighlight %}



{% highlight text %}
## Error in strwidth(legend, units = "user", cex = cex, font = text.font): plot.new has not been called yet
{% endhighlight %}



{% highlight r %}
areas <- sapply(stations.m@polygons, function(x) x@area)
{% endhighlight %}



{% highlight text %}
## Error in lapply(X = X, FUN = FUN, ...): object 'stations.m' not found
{% endhighlight %}

This results in a simple choropleth map and a new vector containing the area of each
borrough. As an additional step, try comparing the mean area of each borrough with the 
mean value of stations within it: `plot(stations.m$NUMBER, areas)`.

If you'd like to learn more about R's rapidly improving spatial functionality, 
you can download the complete tutorial, in .pdf or .Rmd form, from 
[github.com/Robinlovelace/Creating-maps-in-R/](https://github.com/Robinlovelace/Creating-maps-in-R/).



