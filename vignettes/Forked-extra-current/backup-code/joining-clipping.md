Joining and clipping
========================================================

This tutorial builds on the previous section on plotting and highlights 
some of R's more advanced spatial functions. We look at joining new 
datasets to our data - an attribute join - spatial joins, whereby 
data is added to the target layer depending on the location of the 
origins and clipping. 

## Joining based on attributes
To reaffirm our starting point, let's re-plot the only 
spatial dataset in our workspace, and count the number
of polygons:

{% highlight r %}
library(rgdal)
{% endhighlight %}



{% highlight text %}
## Error in library(rgdal): there is no package called 'rgdal'
{% endhighlight %}



{% highlight r %}
lnd <- readOGR(dsn = ".", "london_sport")
{% endhighlight %}



{% highlight text %}
## Error in readOGR(dsn = ".", "london_sport"): could not find function "readOGR"
{% endhighlight %}



{% highlight r %}
plot(lnd)
{% endhighlight %}



{% highlight text %}
## Error in plot(lnd): object 'lnd' not found
{% endhighlight %}



{% highlight r %}
nrow(lnd)
{% endhighlight %}



{% highlight text %}
## Error in nrow(lnd): object 'lnd' not found
{% endhighlight %}

### Downloading additional data
Because we are using borough-level data, and boroughs are official administrative
zones, there is much data available at this level. We will use the example 
of crime data to illustrate this data availability, and join this with the current 
spatial dataset. As before, we can download and import the data from within R:

{% highlight r %}
# download.file("http://data.london.gov.uk/datafiles/crime-community-safety/mps-recordedcrime-borough.csv", destfile = "mps-recordedcrime-borough.csv")
# uncomment the above line of code to download the data

crimeDat <- read.csv("mps-recordedcrime-borough.csv") # flags an error
{% endhighlight %}
Initially, the `read.csv` command flags an error: open the raw .csv file in a 
text editor such as Notepad, Notepad++ or GVIM, find the problem and correct it.
Alternatively, you can work out what the file encoding is and use the correct 
argument (this is not recommended - simpler just to edit the text file
in most cases).


{% highlight r %}
crimeDat <- read.csv("mps-recordedcrime-borough.csv", fileEncoding = "UCS-2LE")
{% endhighlight %}



{% highlight text %}
## Warning in file(file, "rt", encoding = fileEncoding): cannot open file
## 'mps-recordedcrime-borough.csv': No such file or directory
{% endhighlight %}



{% highlight text %}
## Error in file(file, "rt", encoding = fileEncoding): cannot open the connection
{% endhighlight %}



{% highlight r %}
head(crimeDat)
{% endhighlight %}



{% highlight text %}
## Error in head(crimeDat): object 'crimeDat' not found
{% endhighlight %}



{% highlight r %}
summary(crimeDat$MajorText)
{% endhighlight %}



{% highlight text %}
## Error in summary(crimeDat$MajorText): object 'crimeDat' not found
{% endhighlight %}



{% highlight r %}
crimeTheft <- crimeDat[which(crimeDat$MajorText == "Theft & Handling"), ]
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'crimeDat' not found
{% endhighlight %}



{% highlight r %}
head(crimeTheft)
{% endhighlight %}



{% highlight text %}
## Error in head(crimeTheft): object 'crimeTheft' not found
{% endhighlight %}



{% highlight r %}
crimeAg <- aggregate(CrimeCount ~ Spatial_DistrictName, FUN = "sum", 
                     data = crimeTheft)
{% endhighlight %}



{% highlight text %}
## Error in eval(m$data, parent.frame()): object 'crimeTheft' not found
{% endhighlight %}



{% highlight r %}
head(crimeAg) # show the aggregated crime data
{% endhighlight %}



{% highlight text %}
## Error in head(crimeAg): object 'crimeAg' not found
{% endhighlight %}
Now that we have crime data at the borough level, the challenge is to join it
by name. This is not always straightforward. Let us see which names in the 
crime data match the spatial data:

{% highlight r %}
lnd$name %in% crimeAg$Spatial_DistrictName 
{% endhighlight %}



{% highlight text %}
## Error in lnd$name %in% crimeAg$Spatial_DistrictName: object 'lnd' not found
{% endhighlight %}



{% highlight r %}
lnd$name[which(!lnd$name %in% crimeAg$Spatial_DistrictName)]
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'lnd' not found
{% endhighlight %}
The first line of code above shows that all but one of the borough names matches;
the second tells us that it is City of London that is named differently in the 
crime data:

{% highlight r %}
levels(crimeAg$Spatial_DistrictName)
{% endhighlight %}



{% highlight text %}
## Error in levels(crimeAg$Spatial_DistrictName): object 'crimeAg' not found
{% endhighlight %}



{% highlight r %}
levels(crimeAg$Spatial_DistrictName)[25] <- 
  as.character(lnd$name[which(!lnd$name %in% crimeAg$Spatial_DistrictName)])
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'lnd' not found
{% endhighlight %}



{% highlight r %}
lnd$name %in% crimeAg$Spatial_DistrictName # now all columns match
{% endhighlight %}



{% highlight text %}
## Error in lnd$name %in% crimeAg$Spatial_DistrictName: object 'lnd' not found
{% endhighlight %}
The above code block first identified the row with the faulty name and 
then renamed the level to match the `lnd` dataset. Note that we could not
rename the variable directly, as it is stored as a factor.

We are now ready to join the datasets. It is recommended to use 
the `join` function in the `plyr` package but the `merge` function 
could equally be used.

{% highlight r %}
?join
{% endhighlight %}



{% highlight text %}
## No documentation for 'join' in specified packages and libraries:
## you could try '??join'
{% endhighlight %}



{% highlight r %}
library(plyr)
?join
{% endhighlight %}



{% highlight text %}
## starting httpd help server ... done
{% endhighlight %}
The documentation for join will be displayed if the plyr package is loaded (if not,
load or install and load it!). It requires all joining variables to have the 
same name, so we will rename the variable to make the join work:

{% highlight r %}
head(lnd$name)
{% endhighlight %}



{% highlight text %}
## Error in head(lnd$name): object 'lnd' not found
{% endhighlight %}



{% highlight r %}
head(crimeAg$Spatial_DistrictName) # the variables to join
{% endhighlight %}



{% highlight text %}
## Error in head(crimeAg$Spatial_DistrictName): object 'crimeAg' not found
{% endhighlight %}



{% highlight r %}
crimeAg <- rename(crimeAg, replace = c("Spatial_DistrictName" = "name"))
{% endhighlight %}



{% highlight text %}
## Error in revalue(names(x), replace, warn_missing = warn_missing): object 'crimeAg' not found
{% endhighlight %}



{% highlight r %}
head(join(lnd@data, crimeAg)) # test it works
{% endhighlight %}



{% highlight text %}
## Error in as.vector(y): object 'crimeAg' not found
{% endhighlight %}



{% highlight r %}
lnd@data <- join(lnd@data, crimeAg)
{% endhighlight %}



{% highlight text %}
## Error in as.vector(y): object 'crimeAg' not found
{% endhighlight %}

## Adding point data for clipping and spatial join
In addition to joing by zone name, it is also possible to do
[spatial joins](http://help.arcgis.com/en/arcgisdesktop/10.0/help/index.html#//00080000000q000000) in R. There are three main varieties: many-to-one - where
the values of many intersecting objects contribute to a new variable in 
the main table - one-to-many, or one-to-one. Because boroughs in London 
are quite large, we will conduct a many-to-one spatial join.
We will be using Tube Stations as the spatial data to join, 
with the aim of finding out which and how many stations
are found in each London borough.

{% highlight r %}
download.file("http://www.personal.leeds.ac.uk/~georl/egs/lnd-stns.zip", 
              "lnd-stns.zip")
{% endhighlight %}



{% highlight text %}
## Warning in download.file("http://www.personal.leeds.ac.uk/~georl/egs/
## lnd-stns.zip", : cannot open URL 'http://www.personal.leeds.ac.uk/
## ~georl/egs/lnd-stns.zip': HTTP status was '404 Not Found'
{% endhighlight %}



{% highlight text %}
## Error in download.file("http://www.personal.leeds.ac.uk/~georl/egs/lnd-stns.zip", : cannot open URL 'http://www.personal.leeds.ac.uk/~georl/egs/lnd-stns.zip'
{% endhighlight %}



{% highlight r %}
unzip("lnd-stns.zip")
{% endhighlight %}



{% highlight text %}
## Warning in unzip("lnd-stns.zip"): error 1 in extracting from zip file
{% endhighlight %}



{% highlight r %}
library(rgdal)
{% endhighlight %}



{% highlight text %}
## Error in library(rgdal): there is no package called 'rgdal'
{% endhighlight %}



{% highlight r %}
stations <- readOGR(dsn = ".", layer = "lnd-stns", p4s="+init=epsg:27700")
{% endhighlight %}



{% highlight text %}
## Error in readOGR(dsn = ".", layer = "lnd-stns", p4s = "+init=epsg:27700"): could not find function "readOGR"
{% endhighlight %}



{% highlight r %}
proj4string(stations) # this is the full geographical detail.
{% endhighlight %}



{% highlight text %}
## Error in proj4string(stations): could not find function "proj4string"
{% endhighlight %}



{% highlight r %}
proj4string(lnd)
{% endhighlight %}



{% highlight text %}
## Error in proj4string(lnd): could not find function "proj4string"
{% endhighlight %}



{% highlight r %}
bbox(stations)
{% endhighlight %}



{% highlight text %}
## Error in bbox(stations): could not find function "bbox"
{% endhighlight %}



{% highlight r %}
bbox(lnd)
{% endhighlight %}



{% highlight text %}
## Error in bbox(lnd): could not find function "bbox"
{% endhighlight %}
The above code loads the data correctly, but also shows that 
there are problems with it: the Coordinate Reference System (CRS)
differs from that of our shapefile. 
Although OSGB 1936 (or EPSG 27700) is the 'correct' CRS for the UK, 
we will convert the stations dataset into lat-long coordinates, 
as this is a more common CRS and enables easy basemap creation:
 

{% highlight r %}
stationsWGS <- spTransform(stations, CRSobj = CRS(proj4string(lnd)))
{% endhighlight %}



{% highlight text %}
## Error in spTransform(stations, CRSobj = CRS(proj4string(lnd))): could not find function "spTransform"
{% endhighlight %}



{% highlight r %}
stations <- stationsWGS; rm(stationsWGS)
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'stationsWGS' not found
{% endhighlight %}



{% highlight text %}
## Warning in rm(stationsWGS): object 'stationsWGS' not found
{% endhighlight %}



{% highlight r %}
plot(lnd)
{% endhighlight %}



{% highlight text %}
## Error in plot(lnd): object 'lnd' not found
{% endhighlight %}



{% highlight r %}
points(stations[sample(1:nrow(stations), size = 500),])
{% endhighlight %}



{% highlight text %}
## Error in points(stations[sample(1:nrow(stations), size = 500), ]): object 'stations' not found
{% endhighlight %}

Now we can clearly see that the stations overlay the boroughs.
The problem is that the stations dataset is far more exentsive than
London borough dataset; we need 


## Clipping
There are a number of functions that we can use to clip the points
so that only those falling within London boroughs are retained:

{% highlight r %}
?overlay
{% endhighlight %}



{% highlight text %}
## No documentation for 'overlay' in specified packages and libraries:
## you could try '??overlay'
{% endhighlight %}



{% highlight r %}
?sp::over
library(rgeos)
{% endhighlight %}



{% highlight text %}
## Error in library(rgeos): there is no package called 'rgeos'
{% endhighlight %}



{% highlight r %}
?rgeos::gIntersects
{% endhighlight %}



{% highlight text %}
## Error in find.package(if (is.null(package)) loadedNamespaces() else package, : there is no package called 'rgeos'
{% endhighlight %}
We can write off the first one straight away as it is depreciated by the second. 
It seems that `gIntersects` can produce the same output as `over`, based 
on [discussion](http://gis.stackexchange.com/questions/63793/how-to-overlay-a-polygon-over-spatialpointsdataframe-and-preserving-the-spdf-dat) 
in the community,  so either 
can be used. (See this 
[discussion](http://stackoverflow.com/questions/15881455/how-to-clip-worldmap-with-polygon-in-r)
for further alternatives.) 
In this tutorial we will use `gIntersects`,
for clipping although we could equally use 
`gContains`, `gWithin` and other `g...` functions -
see rgeos help pages by typing `?gOverlaps` or other functions for more.
`gIntersects` will output information for each point, telling us which 
polygon it interacts with (i.e. the polygon it is in):


{% highlight r %}
int <- gIntersects(stations, lnd, byid = T) # find which stations intersect 
{% endhighlight %}



{% highlight text %}
## Error in gIntersects(stations, lnd, byid = T): could not find function "gIntersects"
{% endhighlight %}



{% highlight r %}
class(int) # it's outputed a matrix
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'int' not found
{% endhighlight %}



{% highlight r %}
dim(int) # with 33 rows (one for each zone) and 2532 cols (the points)
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'int' not found
{% endhighlight %}



{% highlight r %}
summary(int[,c(200,500)]) # not the output of this
{% endhighlight %}



{% highlight text %}
## Error in summary(int[, c(200, 500)]): object 'int' not found
{% endhighlight %}



{% highlight r %}
plot(lnd)
{% endhighlight %}



{% highlight text %}
## Error in plot(lnd): object 'lnd' not found
{% endhighlight %}



{% highlight r %}
points(stations[200,], col = "red") # note point id 200 is outside the zones
{% endhighlight %}



{% highlight text %}
## Error in points(stations[200, ], col = "red"): object 'stations' not found
{% endhighlight %}



{% highlight r %}
points(stations[500,], col = "green") # note point 500 is inside
{% endhighlight %}



{% highlight text %}
## Error in points(stations[500, ], col = "green"): object 'stations' not found
{% endhighlight %}



{% highlight r %}
which(int[,500] == T) # this tells us that point 500 intersects with zone 32
{% endhighlight %}



{% highlight text %}
## Error in which(int[, 500] == T): object 'int' not found
{% endhighlight %}



{% highlight r %}
points(coordinates(lnd[32,]), col = "black") # test the previous statement
{% endhighlight %}



{% highlight text %}
## Error in coordinates(lnd[32, ]): could not find function "coordinates"
{% endhighlight %}

In the above code, only the first line actually 'does' anything
in our workspace, by creating the object `int`. The proceeding 
lines are dedicated to exploring this object and what it means. 
Note that it is a matrix with columns corresponding to the points and 
rows corresponding to boroughs. The borough in which a particular 
point can be extracted from `int` as we shall see below.
For the purposes of clipping, we are only interested in whether
the point intersects with _any_ of the boroughs. This is where the 
function `apply`, which is unique to R, comes into play:


{% highlight r %}
clipped <- apply(int == F, MARGIN = 2, all)
{% endhighlight %}



{% highlight text %}
## Error in apply(int == F, MARGIN = 2, all): object 'int' not found
{% endhighlight %}



{% highlight r %}
plot(stations[which(clipped),]) # shows all stations we DO NOT want
{% endhighlight %}



{% highlight text %}
## Error in plot(stations[which(clipped), ]): object 'stations' not found
{% endhighlight %}



{% highlight r %}
stations.cl <- stations[which(!clipped),] # use ! to select the invers
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'stations' not found
{% endhighlight %}



{% highlight r %}
points(stations.cl, col = "green") # check that it's worked
{% endhighlight %}



{% highlight text %}
## Error in points(stations.cl, col = "green"): object 'stations.cl' not found
{% endhighlight %}



{% highlight r %}
stations <- stations.cl; rm(stations.cl) # tidy up: we're only interested in clipped ones
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'stations.cl' not found
{% endhighlight %}



{% highlight text %}
## Warning in rm(stations.cl): object 'stations.cl' not found
{% endhighlight %}

The first line instructs R to look at each column (`MARGIN = 2`, we would use
`MARGIN = 1` for row-by-row analysis) and report back whether `all` of the values are
false. This creates the inverse selection that we want, hence the use of `!` to invert it.
We test that the function works on a new object (often a good idea, to avoid overwriting 
useful data) with plots and, once content that the clip has worked, save the sample of 
points to our main `stations` object and remove the now duplicated `stations.cl` object.

## Aggregating the data to complete the spatial join

Now that we know how `gIntersects` works in general terms and for clipping, 
let's use it to 
allocate a borrough to each of our station points, which we will then 
aggregate up. Data from these points (e.g. counts, averages in each area etc.)
can then be transferred to the main polygons table: the essence of a spatial 
join. Again, `apply` is our friend in this instance, meaning we can avoid `for` loops:


{% highlight r %}
int <- gIntersects(stations, lnd, byid = T) # re-run the intersection query 
{% endhighlight %}



{% highlight text %}
## Error in gIntersects(stations, lnd, byid = T): could not find function "gIntersects"
{% endhighlight %}



{% highlight r %}
head(apply(int, MARGIN = 2, FUN = which))
{% endhighlight %}



{% highlight text %}
## Error in apply(int, MARGIN = 2, FUN = which): object 'int' not found
{% endhighlight %}



{% highlight r %}
b.indexes <- which(int, arr.ind = T)
{% endhighlight %}



{% highlight text %}
## Error in which(int, arr.ind = T): object 'int' not found
{% endhighlight %}



{% highlight r %}
summary(b.indexes)
{% endhighlight %}



{% highlight text %}
## Error in summary(b.indexes): object 'b.indexes' not found
{% endhighlight %}



{% highlight r %}
b.names <- lnd$name[b.indexes[, 1]]
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'lnd' not found
{% endhighlight %}



{% highlight r %}
b.count <- aggregate(b.indexes ~ b.names, FUN = length) 
{% endhighlight %}



{% highlight text %}
## Error in eval(predvars, data, env): object 'b.indexes' not found
{% endhighlight %}



{% highlight r %}
head(b.count)
{% endhighlight %}



{% highlight text %}
## Error in head(b.count): object 'b.count' not found
{% endhighlight %}

The above code first extracts the index of the row (borough) for 
which the corresponding column is true and then converts this into 
names. The final object created, `b.count` contains the number of station 
points in each zone. According to this, Barking and Dagenham should contain
30 station points. It is important to check the output makes sense at 
every stage with R, so let's check to see this is indeed the case with a quick plot:


{% highlight r %}
plot(lnd[which(grepl("Barking", lnd$name)),])
{% endhighlight %}



{% highlight text %}
## Error in plot(lnd[which(grepl("Barking", lnd$name)), ]): object 'lnd' not found
{% endhighlight %}



{% highlight r %}
points(stations)
{% endhighlight %}



{% highlight text %}
## Error in points(stations): object 'stations' not found
{% endhighlight %}

Now the fun part: count the points in the polygon and report back how many there are!

The final stage is to transfer the data on station counts back into the 
polygon data frame. We have used `merge` to join two datasets before.
In R there is often more than one way to acheive the same result.
It's good to experiment with different functions, so we will use
`join` from the `plyr` package. `join` requires identical joining 
names in both data frames, so first we will rename them (type 
`?rename` for more details).


{% highlight r %}
b.count <- rename(b.count, replace = c("b.names" = "name"))
{% endhighlight %}



{% highlight text %}
## Error in revalue(names(x), replace, warn_missing = warn_missing): object 'b.count' not found
{% endhighlight %}



{% highlight r %}
b.count.tmp <- join(lnd@data, b.count)
{% endhighlight %}



{% highlight text %}
## Error in as.vector(y): object 'b.count' not found
{% endhighlight %}



{% highlight r %}
head(b.count.tmp)
{% endhighlight %}



{% highlight text %}
## Error in head(b.count.tmp): object 'b.count.tmp' not found
{% endhighlight %}



{% highlight r %}
lnd$station.count <- b.count.tmp[, 7] 
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'b.count.tmp' not found
{% endhighlight %}

We have now seen how to join and clip data. Next, for a stronger grounding 
in how ggplot works, we will look at plotting non-spatial data.



