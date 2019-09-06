#' # Work in progress {#wnp}
#' 
## ------------------------------------------------------------------------
library(tidyverse)
library(kableExtra)

#' 
## ------------------------------------------------------------------------
source("./R/kml_to_tidy.R")
kable(tidy.kat, formatv = "markdown")

#' 
#' A satisfying and important aspect of geographic research is communicating the results.
#' Map making --- the art of cartography --- is an ancient skill that involves communication, intuition, and an element of creativity.
#' Static mapping is straightforward with `plot()`, as we saw in Section \@ref(basic-map).
#' It is possible to create advanced maps using base R methods [@murrell_r_2016], but this chapter focuses on dedicated map-making packages.
#' When learning a new skill, it makes sense to gain depth-of-knowledge in one area before branching out.
#' Map making is no exception, hence this chapter's coverage of one package (**tmap**) in depth rather than many superficially.
#' In addition to being fun and creative, cartography also has important practical applications.
#' A carefully crafted map is vital for effectively communicating the results of your work [@brewer_designing_2015]:
#' 
#' > Amateur-looking maps can undermine your audience’s ability to understand important information and weaken the presentation of a professional data investigation.
#' 
#' Maps have been used for several thousand years for a wide variety of purposes.
#' Historic examples include maps of buildings and land ownership in the Old Babylonian dynasty more than 3000 years ago and Ptolemy's world map in his masterpiece *Geography* nearly 2000 years ago [@talbert_ancient_2014].
#' 
#' Map making has historically been an activity undertaken only by, or on behalf of, the elite.
#' This has changed with the emergence of open source mapping software such as the R package **tmap** and the 'print composer' in QGIS\index{QGIS} which enable anyone to make high-quality maps, enabling 'citizen science'.
#' Maps are also often the best way to present the findings of geocomputational research in a way that is accessible.
#' Map making is therefore a critical part of geocomputation\index{geocomputation} and its emphasis not only on describing, but also *changing* the world.
#' 
#' This chapter shows how to make a wide range of maps.
#' The next section covers a range of static maps, including aesthetic considerations, facets and inset maps.
#' Sections \@ref(animated-maps) to \@ref(mapping-applications) cover animated and interactive maps (including web maps and mapping applications).
#' Finally, Section \@ref(other-mapping-packages) covers a range of alternative map-making packages including **ggplot2** and **cartogram**.
#' 
#' ## Static maps
#' 
#' \index{map making!static maps}
#' Static maps are the most common type of visual output from geocomputation.
#' Standard formats include `.png` and `.pdf` for raster and vector outputs respectively.
#' Initially, static maps were the only type of maps that R could produce.
#' Things advanced with the release of **sp** [see @pebesma_classes_2005] and many techniques for map making have been developed since then.
#' However, despite the innovation of interactive mapping, static plotting was still the emphasis of geographic data visualisation in R a decade later [@cheshire_spatial_2015].
#' 
#' The generic `plot()` function is often the fastest way to create static maps from vector and raster spatial objects (see sections \@ref(basic-map) and \@ref(basic-map-raster)).
#' Sometimes, simplicity and speed are priorities, especially during the development phase of a project, and this is where `plot()` excels.
#' The base R approach is also extensible, with `plot()` offering dozens of arguments.
#' Another approach is the **grid** package which allows low level control of static maps, as illustrated in Chapter [14](https://www.stat.auckland.ac.nz/~paul/RG2e/chapter14.html) of @murrell_r_2016.
#' This section focuses on **tmap** and emphasizes the important aesthetic and layout options.
#' 
#' \index{tmap (package)}
#' **tmap** is a powerful and flexible map-making package with sensible defaults.
#' It has a concise syntax that allows for the creation of attractive maps with minimal code which will be familiar to **ggplot2** users.
#' It also has the unique capability to generate static and interactive maps using the same code via `tmap_mode()`.
#' Finally, it accepts a wider range of spatial classes (including `raster` objects) than alternatives such as **ggplot2** (see the vignettes [`tmap-getstarted`](https://cran.r-project.org/web/packages/tmap/vignettes/tmap-getstarted.html) and [`tmap-changes-v2`](https://cran.r-project.org/web/packages/tmap/vignettes/tmap-changes-v2.html), as well as @tennekes_tmap_2018, for further documentation).
#' 
#' ### tmap basics
#' 
#' \index{tmap (package)!basics}
#' Like **ggplot2**, **tmap** is based on the idea of a 'grammar of graphics' [@wilkinson_grammar_2005].
#' This involves a separation between the input data and the aesthetics (how data are visualised): each input dataset can be 'mapped' in a range of different ways including location on the map (defined by data's `geometry`), color, and other visual variables.
#' The basic building block is `tm_shape()` (which defines input data, raster and vector objects), followed by one or more layer elements such as `tm_fill()` and `tm_dots()`.
#' This layering is demonstrated in the chunk below, which generates the maps presented in Figure \@ref(fig:tmshape):
#' 
## ----08-mapping-3, eval=FALSE--------------------------------------------
## # Add fill layer to nz shape
## tm_shape(nz) +
##   tm_fill()
## # Add border layer to nz shape
## tm_shape(nz) +
##   tm_borders()
## # Add fill and border layers to nz shape
## tm_shape(nz) +
##   tm_fill() +
##   tm_borders()

#' 
## ----tmshape, echo=FALSE, message=FALSE, fig.cap="New Zealand's shape plotted with fill (left), border (middle) and fill and border (right) layers added using tmap functions.", fig.scap="New Zealand's shape plotted using tmap functions."----
source("https://github.com/Robinlovelace/geocompr/raw/master/code/08-tmshape.R", print.eval = TRUE)

#' 
#' The object passed to `tm_shape()` in this case is `nz`, an `sf` object representing the regions of New Zealand (see Section \@ref(intro-sf) for more on `sf` objects).
#' Layers are added to represent `nz` visually, with `tm_fill()` and `tm_borders()` creating shaded areas (left panel) and border outlines (middle panel) in Figure \@ref(fig:tmshape), respectively.
#' 
#' This is an intuitive approach to map making:
#' the common task of *adding* new layers is undertaken by the addition operator `+`, followed by `tm_*()`.
#' The asterisk (\*) refers to a wide range of layer types which have self-explanatory names including `fill`, `borders` (demonstrated above), `bubbles`, `text` and `raster` (see `help("tmap-element")` for a full list).
#' This layering is illustrated in the right panel of Figure \@ref(fig:tmshape), the result of adding a border *on top of* the fill layer.
#' 
## `qtm()` is a handy function to create **q**uick **t**hematic **m**aps (hence the snappy name).

## It is concise and provides a good default visualization in many cases:

## `qtm(nz)`, for example, is equivalent to `tm_shape(nz) + tm_fill() + tm_borders()`.

## Further, layers can be added concisely using multiple `qtm()` calls, such as `qtm(nz) + qtm(nz_height)`.

## The disadvantage is that it makes aesthetics of individual layers harder to control, explaining why we avoid teaching it in this chapter.

#' 
#' ### Map objects {#map-obj}
#' 
#' A useful feature of **tmap** is its ability to store *objects* representing maps.
#' The code chunk below demonstrates this by saving the last plot in Figure \@ref(fig:tmshape) as an object of class `tmap` (note the use of `tm_polygons()` which condenses `tm_fill()  + tm_borders()` into a single function):
#' 
## ----08-mapping-4--------------------------------------------------------
map_nz = tm_shape(nz) + tm_polygons()
class(map_nz)

#' 
#' `map_nz` can be plotted later, for example by adding additional layers (as shown below) or simply running `map_nz` in the console, which is equivalent to `print(map_nz)`.
#' 
#' New *shapes* can be added with `+ tm_shape(new_obj)`.
#' In this case `new_obj` represents a new spatial object to be plotted on top of preceding layers.
#' When a new shape is added in this way, all subsequent aesthetic functions refer to it, until another new shape is added.
#' This syntax allows the creation of maps with multiple shapes and layers, as illustrated in the next code chunk which uses the function `tm_raster()` to plot a raster layer (with `alpha` set to make the layer semi-transparent):
#' 
## ----08-mapping-5, results='hide'----------------------------------------
# map_nz1 = map_nz +
#   tm_shape(nz_elev) + tm_raster(alpha = 0.7)

#' 
#' Building on the previously created `map_nz` object, the preceding code creates a new map object `map_nz1` that contains another shape (`nz_elev`) representing average elevation across New Zealand (see Figure \@ref(fig:tmlayers), left).
#' More shapes and layers can be added, as illustrated in the code chunk below which creates `nz_water`, representing New Zealand's [territorial waters](https://en.wikipedia.org/wiki/Territorial_waters), and adds the resulting lines to an existing map object.
#' 
## ----08-mapping-6--------------------------------------------------------
nz_water = st_union(nz) %>% st_buffer(22200) %>%
  st_cast(to = "LINESTRING")
# map_nz2 = map_nz1 +
#   tm_shape(nz_water) + tm_lines()

#' 
#' There is no limit to the number of layers or shapes that can be added to `tmap` objects.
#' The same shape can even be used multiple times.
#' The final map illustrated in Figure \@ref(fig:tmlayers) is created by adding a layer representing high points (stored in the object `nz_height`) onto the previously created `map_nz2` object with `tm_dots()` (see `?tm_dots` and `?tm_bubbles` for details on **tmap**'s point plotting functions).
#' The resulting map, which has four layers, is illustrated in the right-hand panel of Figure \@ref(fig:tmlayers):
#' 
## ----08-mapping-7--------------------------------------------------------
# map_nz3 = map_nz2 +
#   tm_shape(nz_height) + tm_dots()

#' 
#' A useful and little known feature of **tmap** is that multiple map objects can be arranged in a single 'metaplot' with `tmap_arrange()`.
#' This is demonstrated in the code chunk below which plots `map_nz1` to `map_nz3`, resulting in Figure \@ref(fig:tmlayers).
#' 
## ----tmlayers, message=FALSE, fig.cap="Maps with additional layers added to the final map of Figure 8.1.", fig.scap="Additional layers added to the output of Figure 8.1."----
# tmap_arrange(map_nz1, map_nz2, map_nz3)

#' 
#' More elements can also be added with the `+` operator.
#' Aesthetic settings, however, are controlled by arguments to layer functions.
#' 
#' ### Aesthetics
#' 
#' \index{tmap (package)!aesthetics}
#' The plots in the previous section demonstrate **tmap**'s default aesthetic settings.
#' Gray shades are used for `tm_fill()` and  `tm_bubbles()` layers and a continuous black line is used to represent lines created with `tm_lines()`.
#' Of course, these default values and other aesthetics can be overridden.
#' The purpose of this section is to show how.
#' 
#' There are two main types of map aesthetics: those that change with the data and those that are constant.
#' Unlike **ggplot2**, which uses the helper function `aes()` to represent variable aesthetics, **tmap** accepts aesthetic arguments that are either variable fields (based on column names) or constant values.^[
#' If there is a clash between a fixed value and a column name, the column name takes precedence. This can be verified by running the next code chunk after running `nz$red = 1:nrow(nz)`.
#' ]
#' The most commonly used aesthetics for fill and border layers include color, transparency, line width and line type, set with `col`, `alpha`, `lwd`, and `lty` arguments, respectively.
#' The impact of setting these with fixed values is illustrated in Figure \@ref(fig:tmstatic).
#' 
## ----tmstatic, message=FALSE, fig.cap="The impact of changing commonly used fill and border aesthetics to fixed values.", fig.scap="The impact of changing commonly used aesthetics."----
ma1 = tm_shape(nz) + tm_fill(col = "red")
ma2 = tm_shape(nz) + tm_fill(col = "red", alpha = 0.3)
ma3 = tm_shape(nz) + tm_borders(col = "blue")
ma4 = tm_shape(nz) + tm_borders(lwd = 3)
ma5 = tm_shape(nz) + tm_borders(lty = 2)
ma6 = tm_shape(nz) + tm_fill(col = "red", alpha = 0.3) +
  tm_borders(col = "blue", lwd = 3, lty = 2)
tmap_arrange(ma1, ma2, ma3, ma4, ma5, ma6)

#' 
## ----08-mapping-8, echo=FALSE, eval=FALSE--------------------------------
## # aim: show what happpens when names clash
## library(tmap)
## library(spData)
## nz$red = 1:nrow(nz)
## qtm(nz, "red")

#' 
#' Like base R plots, arguments defining aesthetics can also receive values that vary.
#' Unlike the base R code below (which generates the left panel in Figure \@ref(fig:tmcol)), **tmap** aesthetic arguments will not accept a numeric vector:
#' 
## ----08-mapping-9, eval=FALSE--------------------------------------------
## plot(st_geometry(nz), col = nz$Land_area)  # works
## tm_shape(nz) + tm_fill(col = nz$Land_area) # fails
## #> Error: Fill argument neither colors nor valid variable name(s)

#' 
#' Instead `col` (and other aesthetics that can vary such as `lwd` for line layers and `size` for point layers) requires a character string naming an attribute associated with the geometry to be plotted.
#' Thus, one would achieve the desired result as follows (plotted in the right-hand panel of Figure \@ref(fig:tmcol)):
#' 
## ----08-mapping-10, fig.show='hide', message=FALSE-----------------------
tm_shape(nz) + tm_fill(col = "Land_area")

#' 
## ----tmcol, message=FALSE, fig.cap="Comparison of base (left) and tmap (right) handling of a numeric color field.", fig.scap="Comparison of base graphics and tmap", echo=FALSE, out.width="45%", fig.show='hold', warning=FALSE, message=FALSE----
plot(nz["Land_area"])
tm_shape(nz) + tm_fill(col = "Land_area")

#' 
#' An important argument in functions defining aesthetic layers such as `tm_fill()` is `title`, which sets the title of the associated legend.
#' The following code chunk demonstrates this functionality by providing a more attractive name than the variable name `Land_area` (note the use of `expression()` to create superscript text):
#' 
## ----08-mapping-11-------------------------------------------------------
legend_title = expression("Area (km"^2*")")
map_nza = tm_shape(nz) +
  tm_fill(col = "Land_area", title = legend_title) + tm_borders()

#' 
#' ### Color settings
#' 
#' \index{tmap (package)!color breaks}
#' Color settings are an important part of map design.
#' They can have a major impact on how spatial variability is portrayed as illustrated in Figure \@ref(fig:tmpal).
#' This shows four ways of coloring regions in New Zealand depending on median income, from left to right (and demonstrated in the code chunk below):
#' 
#' - The default setting uses 'pretty' breaks, described in the next paragraph.
#' - `breaks` allows you to manually set the breaks.
#' - `n` sets the number of bins into which numeric variables are categorized.
#' - `palette` defines the color scheme, for example `BuGn`.
#' 
## ----08-mapping-12, eval=FALSE-------------------------------------------
## tm_shape(nz) + tm_polygons(col = "Median_income")
## breaks = c(0, 3, 4, 5) * 10000
## tm_shape(nz) + tm_polygons(col = "Median_income", breaks = breaks)
## tm_shape(nz) + tm_polygons(col = "Median_income", n = 10)
## tm_shape(nz) + tm_polygons(col = "Median_income", palette = "BuGn")

#' 
## ----tmpal, message=FALSE, fig.cap="Illustration of settings that affect color settings. The results show (from left to right): default settings, manual breaks, n breaks, and the impact of changing the palette.", fig.scap="Illustration of settings that affect color settings.", echo=FALSE, fig.asp=0.56----
source("https://github.com/Robinlovelace/geocompr/raw/master/code/08-tmpal.R", print.eval = TRUE)

#' 
#' Another way to change color settings is by altering color break (or bin) settings.
#' In addition to manually setting `breaks` **tmap** allows users to specify algorithms to automatically create breaks with the `style` argument.
#' \index{tmap (package)!break styles}
#' Here are six of the most useful break styles:
#' 
#' - `style = pretty`, the default setting, rounds breaks into whole numbers where possible and spaces them evenly;
#' - `style = equal` divides input values into bins of equal range and is appropriate for variables with a uniform distribution (not recommended for variables with a skewed distribution as the resulting map may end-up having little color diversity);
#' - `style = quantile` ensures the same number of observations fall into each category (with the potential downside that bin ranges can vary widely);
#' - `style = jenks` identifies groups of similar values in the data and maximizes the differences between categories;
#' - `style = cont` (and `order`) present a large number of colors over continuous color fields and are particularly suited for continuous rasters (`order` can help visualize skewed distributions);
#' - `style = cat` was designed to represent categorical values and assures that each category receives a unique color.
#' 
## ----break-styles, message=FALSE, fig.cap="Illustration of different binning methods set using the style argument in tmap.", , fig.scap="Illustration of different binning methods using tmap.", echo=FALSE----
source("https://github.com/Robinlovelace/geocompr/raw/master/code/08-break-styles.R", print.eval = TRUE)

#' 
## Although `style` is an argument of **tmap** functions, in fact it originates as an argument in `classInt::classIntervals()` --- see the help page of this function for details.

#' 
#' Palettes define the color ranges associated with the bins and  determined by the `breaks`, `n`, and `style` arguments described above.
#' The default color palette is specified in `tm_layout()` (see Section \@ref(layouts) to learn more); however, it could be quickly changed using the `palette` argument.
#' It expects a vector of colors or a new color palette name, which can be selected interactively with `tmaptools::palette_explorer()`.
#' You can add a `-` as prefix to reverse the palette order.
#' 
#' There are three main groups of color palettes\index{map making!color palettes}: categorical, sequential and diverging (Figure \@ref(fig:colpal)), and each of them serves a different purpose.
#' Categorical palettes consist of easily distinguishable colors and are most appropriate for categorical data without any particular order such as state names or land cover classes.
#' Colors should be intuitive: rivers should be blue, for example, and pastures green.
#' Avoid too many categories: maps with large legends and many colors can be uninterpretable.^[
#' `col = "MAP_COLORS"` can be used in maps with a large number of individual polygons (for example, a map of individual countries) to create unique colors for adjacent polygons.
#' ] 
#' 
#' The second group is sequential palettes.
#' These follow a gradient, for example from light to dark colors (light colors tend to represent lower values), and are appropriate for continuous (numeric) variables.
#' Sequential palettes can be single (`Blues` go from light to dark blue, for example) or multi-color/hue (`YlOrBr` is gradient from light yellow to brown via orange, for example), as demonstrated in the code chunk below --- output not shown, run the code yourself to see the results!
#' 
## ----08-mapping-13, eval=FALSE-------------------------------------------
## tm_shape(nz) + tm_polygons("Population", palette = "Blues")
## tm_shape(nz) + tm_polygons("Population", palette = "YlOrBr")

#' 
#' The last group, diverging palettes, typically range between three distinct colors (purple-white-green in Figure \@ref(fig:colpal)) and are usually created by joining two single-color sequential palettes with the darker colors at each end.
#' Their main purpose is to visualize the difference from an important reference point, e.g., a certain temperature, the median household income or the mean probability for a drought event.
#' The reference point's value can be adjusted in **tmap** using the `midpoint` argument.
#' 
## ----colpal, echo=FALSE, message=FALSE, fig.cap="Examples of categorical, sequential and diverging palettes.", out.width="50%"----
library(RColorBrewer)
many_palette_plotter = function(color_names, n, titles){
  n_colors = length(color_names)
  ylim = c(0, n_colors)
  par(mar = c(0, 5, 0, 0))
  plot(1, 1, xlim = c(0, max(n)), ylim = ylim,
       type = "n", axes = FALSE, bty = "n", xlab = "", ylab = "")
  
  for(i in seq_len(n_colors)){
    one_color = brewer.pal(n = n, name = color_names[i])
    rect(xleft = 0:(n - 1), ybottom = i - 1, xright = 1:n, ytop = i - 0.2,
         col = one_color, border = "light gray")
    }
  text(rep(-0.1, n_colors), (1: n_colors) - 0.6, labels = titles, xpd = TRUE, adj = 1)
}

many_palette_plotter(c("PRGn", "YlGn", "Set2"), 7, 
                     titles = c("Diverging", "Sequential", "Categorical"))

#' 
#' There are two important principles for consideration when working with colors: perceptibility and accessibility.
#' Firstly, colors on maps should match our perception. 
#' This means that certain colors are viewed through our experience and also cultural lenses.
#' For example, green colors usually represent vegetation or lowlands and blue is connected with water or cool.
#' Color palettes should also be easy to understand to effectively convey information.
#' It should be clear which values are lower and which are higher, and colors should change gradually.
#' This property is not preserved in the rainbow color palette; therefore, we suggest avoiding it in geographic data visualization [@borland_rainbow_2007].
#' Instead, [the viridis color palettes](https://cran.r-project.org/web/packages/viridis/), also available in **tmap**, can be used.
#' Secondly, changes in colors should be accessible to the largest number of people.
#' Therefore, it is important to use colorblind friendly palettes as often as possible.^[See the "Color blindness simulator" options in `tmaptools::palette_explorer()`.]
#' 
#' ### Layouts
#' 
#' \index{tmap (package)!layouts}
#' The map layout refers to the combination of all map elements into a cohesive map.
#' Map elements include among others the objects to be mapped, the title, the scale bar, margins and aspect ratios, while the color settings covered in the previous section relate to the palette and break-points used to affect how the map looks.
#' Both may result in subtle changes that can have an equally large impact on the impression left by your maps.
#' 
#' Additional elements such as north arrows\index{tmap (package)!north arrows} and scale bars\index{tmap (package)!scale bars} have their own functions: `tm_compass()` and `tm_scale_bar()` (Figure \@ref(fig:na-sb)).
#' 
## ----na-sb, message=FALSE, fig.cap="Map with additional elements - a north arrow and scale bar.", out.width="50%", fig.asp=1, fig.scap="Map with a north arrow and scale bar."----
map_nz + 
  tm_compass(type = "8star", position = c("left", "top")) +
  tm_scale_bar(breaks = c(0, 100, 200), text.size = 1)

#' 
#' **tmap** also allows a wide variety of layout settings to be changed, some of which, produced using the following code (see `args(tm_layout)` or `?tm_layout` for a full list), are illustrated in Figure \@ref(fig:layout1):
#' 
## ----08-mapping-14, eval=FALSE-------------------------------------------
## map_nz + tm_layout(title = "New Zealand")
## map_nz + tm_layout(scale = 5)
## map_nz + tm_layout(bg.color = "lightblue")
## map_nz + tm_layout(frame = FALSE)

#' 
## ----layout1, message=FALSE, fig.cap="Layout options specified by (from left to right) title, scale, bg.color and frame arguments.", fig.scap="Layout options specified by the tmap arguments.", echo=FALSE, fig.asp=0.56----
source("https://github.com/Robinlovelace/geocompr/raw/master/code/08-layout1.R", print.eval = TRUE)

#' 
#' The other arguments in `tm_layout()` provide control over many more aspects of the map in relation to the canvas on which it is placed.
#' Here are some useful layout settings (some of which are illustrated in Figure \@ref(fig:layout2)):
#' 
#' - Frame width (`frame.lwd`) and an option to allow double lines (`frame.double.line`).
#' - Margin settings including `outer.margin` and `inner.margin`.
#' - Font settings controlled by `fontface` and `fontfamily`.
#' - Legend settings including binary options such as `legend.show` (whether or not to show the legend) `legend.only` (omit the map) and `legend.outside` (should the legend go outside the map?), as well as multiple choice settings such as `legend.position`.
#' - Default colors of aesthetic layers (`aes.color`), map attributes such as the frame (`attr.color`).
#' - Color settings controlling `sepia.intensity` (how yellowy the map looks) and `saturation` (a color-grayscale).
#' 
## ----layout2, message=FALSE, fig.cap="Illustration of selected layout options.", echo=FALSE, fig.asp=0.56----
# todo: add more useful settings to this plot
source("https://github.com/Robinlovelace/geocompr/raw/master/code/08-layout2.R", print.eval = TRUE)

#' 
#' The impact of changing the color settings listed above is illustrated in Figure \@ref(fig:layout3) (see `?tm_layout` for a full list).
#' 
## ----layout3, message=FALSE, fig.cap="Illustration of selected color-related layout options.", echo=FALSE, fig.asp=0.56----
source("https://github.com/Robinlovelace/geocompr/raw/master/code/08-layout3.R", print.eval = TRUE)

#' 
#' \index{tmap (package)!styles}
#' Beyond the low-level control over layouts and colors, **tmap** also offers high-level styles, using the `tm_style()` function (representing the second meaning of 'style' in the package).
#' Some styles such as `tm_style("cobalt")` result in stylized maps, while others such as `tm_style("gray")` make more subtle changes, as illustrated in Figure \@ref(fig:tmstyles), created using the code below (see `08-tmstyles.R`):
#' 
## ----08-mapping-15, eval=FALSE-------------------------------------------
## map_nza + tm_style("bw")
## map_nza + tm_style("classic")
## map_nza + tm_style("cobalt")
## map_nza + tm_style("col_blind")

#' 
## ----tmstyles, message=FALSE, fig.cap="Selected tmap styles.", fig.scap="Selected tmap styles.", echo=FALSE, fig.asp=0.56----
source("https://github.com/Robinlovelace/geocompr/raw/master/code/08-tmstyles.R", print.eval = TRUE)

#' 
## A preview of predefined styles can be generated by executing `tmap_style_catalogue()`.

## This creates a folder called `tmap_style_previews` containing nine images.

## Each image, from `tm_style_albatross.png` to `tm_style_white.png`, shows a faceted map of the world in the corresponding style.

## Note: `tmap_style_catalogue()` takes some time to run.

#' 
#' ### Faceted maps
#' 
#' \index{map making!faceted maps}
#' \index{tmap (package)!faceted maps}
#' Faceted maps, also referred to as 'small multiples', are composed of many maps arranged side-by-side, and sometimes stacked vertically [@meulemans_small_2017].
#' Facets enable the visualization of how spatial relationships change with respect to another variable, such as time.
#' The changing populations of settlements, for example, can be represented in a faceted map with each panel representing the population at a particular moment in time.
#' The time dimension could be represented via another *aesthetic* such as color.
#' However, this risks cluttering the map because it will involve multiple overlapping points (cities do not tend to move over time!).
#' 
#' Typically all individual facets in a faceted map contain the same geometry data repeated multiple times, once for each column in the attribute data (this is the default plotting method for `sf` objects, see Chapter \@ref(spatial-class)).
#' However, facets can also represent shifting geometries such as the evolution of a point pattern over time.
#' This use case of faceted plot is illustrated in Figure \@ref(fig:urban-facet).
#' 
#' <!-- todo: describe data type (long) and nrow vs ncol -->
#' 
## ----urban-facet, message=FALSE, fig.cap="Faceted map showing the top 30 largest urban agglomerations from 1970 to 2030 based on population projections by the United Nations.", fig.scap="Faceted map showing urban agglomerations.", fig.asp=0.5----
urb_1970_2030 = urban_agglomerations %>% 
  filter(year %in% c(1970, 1990, 2010, 2030))

tm_shape(world) +
  tm_polygons() +
  tm_shape(urb_1970_2030) +
  tm_symbols(col = "black", border.col = "white", size = "population_millions") +
  tm_facets(by = "year", nrow = 2, free.coords = FALSE)

#' 
#' The preceding code chunk demonstrates key features of faceted maps created with **tmap**:
#' 
#' - Shapes that do not have a facet variable are repeated (the countries in `world` in this case).
#' - The `by` argument which varies depending on a variable (`year` in this case).
#' - The `nrow`/`ncol` setting specifying the number of rows and columns that facets should be arranged into.
#' - The `free.coords` parameter specifying if each map has its own bounding box.
#' 
#' In addition to their utility for showing changing spatial relationships, faceted maps are also useful as the foundation for animated maps (see Section \@ref(animated-maps)).
#' 
#' ### Inset maps
#' 
#' \index{map making!inset maps}
#' \index{tmap (package)!inset maps}
#' An inset map is a smaller map rendered within or next to the main map. 
#' It could serve many different purposes, including providing a context (Figure \@ref(fig:insetmap1)) or bringing some non-contiguous regions closer to ease their comparison (Figure \@ref(fig:insetmap2)).
#' They could be also used to focus on a smaller area in more detail or to cover the same area as the map, but representing a different topic.
#' 
#' In the example below, we create a map of the central part of New Zealand's Southern Alps.
#' Our inset map will show where the main map is in relation to the whole New Zealand.
#' The first step is to define the area of interest, which can be done by creating a new spatial object, `nz_region`.
#' 
## ----08-mapping-16-------------------------------------------------------
nz_region = st_bbox(c(xmin = 1340000, xmax = 1450000,
                      ymin = 5130000, ymax = 5210000),
                    crs = st_crs(nz_height)) %>% 
  st_as_sfc()

#' 
#' In the second step, we create a base map showing the New Zealand's Southern Alps area. 
#' This is a place where the most important message is stated. 
#' 
## ----08-mapping-17-------------------------------------------------------
nz_height_map = tm_shape(nz_elev, bbox = nz_region) +
  tm_raster(style = "cont", palette = "YlGn", legend.show = TRUE) +
  tm_shape(nz_height) + tm_symbols(shape = 2, col = "red", size = 1) +
  tm_scale_bar(position = c("left", "bottom"))

#' 
#' The third step consists of the inset map creation. 
#' It gives a context and helps to locate the area of interest. 
#' Importantly, this map needs to clearly indicate the location of the main map, for example by stating its borders.
#' 
## ----08-mapping-18-------------------------------------------------------
nz_map = tm_shape(nz) + tm_polygons() +
  tm_shape(nz_height) + tm_symbols(shape = 2, col = "red", size = 0.1) + 
  tm_shape(nz_region) + tm_borders(lwd = 3) 

#' 
#' Finally, we combine the two maps using the function `viewport()` from the **grid** package, the first arguments of which specify the center location (`x` and `y`) and a size (`width` and `height`) of the inset map.
#' 
## ----insetmap1, message=FALSE, fig.cap="Inset map providing a context - location of the central part of the Southern Alps in New Zealand.", fig.scap="Inset map providing a context."----
library(grid)
nz_height_map
print(nz_map, vp = viewport(0.8, 0.27, width = 0.5, height = 0.5))

#' 
#' Inset map can be saved to file either by using a graphic device (see Section \@ref(visual-outputs)) or the `tmap_save()` function and its arguments - `insets_tm` and `insets_vp`.
#' 
#' Inset maps are also used to create one map of non-contiguous areas.
#' Probably, the most often used example is a map of the United States, which consists of the contiguous United States, Hawaii and Alaska.
#' It is very important to find the best projection for each individual inset in these types of cases (see Chapter \@ref(reproj-geo-data) to learn more).
#' We can use US National Atlas Equal Area for the map of the contiguous United States by putting its EPSG code in the `projection` argument of `tm_shape()`.
#' 
## ----08-mapping-19-------------------------------------------------------
us_states_map = tm_shape(us_states, projection = 2163) + tm_polygons() + 
  tm_layout(frame = FALSE)

#' 
#' The rest of our objects, `hawaii` and `alaska`, already have proper projections; therefore, we just need to create two separate maps:
#' 
## ----08-mapping-20-------------------------------------------------------
hawaii_map = tm_shape(hawaii) + tm_polygons() + 
  tm_layout(title = "Hawaii", frame = FALSE, bg.color = NA, 
            title.position = c("LEFT", "BOTTOM"))
alaska_map = tm_shape(alaska) + tm_polygons() + 
  tm_layout(title = "Alaska", frame = FALSE, bg.color = NA)

#' 
#' The final map is created by combining and arranging these three maps:
#' 
## ----insetmap2, message=FALSE, fig.cap="Map of the United States."-------
us_states_map
print(hawaii_map, vp = grid::viewport(0.35, 0.1, width = 0.2, height = 0.1))
print(alaska_map, vp = grid::viewport(0.15, 0.15, width = 0.3, height = 0.3))

#' 
#' The code presented above is compact and can be used as the basis for other inset maps but the results, in Figure \@ref(fig:insetmap2), provide a poor representation of the locations of Hawaii and Alaska.
#' For a more in-depth approach, see the [`us-map`](https://geocompr.github.io/geocompkg/articles/us-map.html) vignette from the **geocompkg**.
#' 
#' ## Animated maps
#' 
#' \index{map making!animated maps}
#' \index{tmap (package)!animated maps}
#' Faceted maps, described in Section \@ref(faceted-maps), can show how spatial distributions of variables change (e.g., over time), but the approach has disadvantages.
#' Facets become tiny when there are many of them.
#' Furthermore, the fact that each facet is physically separated on the screen or page means that subtle differences between facets can be hard to detect.
#' 
#' Animated maps solve these issues.
#' Although they depend on digital publication, this is becoming less of an issue as more and more content moves online.
#' Animated maps can still enhance paper reports: you can always link readers to a web-page containing an animated (or interactive) version of a printed map to help make it come alive.
#' There are several ways to generate animations in R, including with animation packages such as **gganimate**, which builds on **ggplot2** (see Section \@ref(other-mapping-packages)).
#' This section focusses on creating animated maps with **tmap** because its syntax will be familiar from previous sections and the flexibility of the approach.
#' 
#' Figure \@ref(fig:urban-animated) is a simple example of an animated map.
#' Unlike the faceted plot, it does not squeeze multiple maps into a single screen and allows the reader to see how the spatial distribution of the world's most populous agglomerations evolve over time (see the book's website for the animated version).
#' 
## ----urban-animated, message=FALSE, fig.cap="Animated map showing the top 30 largest urban agglomerations from 1950 to 2030 based on population projects by the United Nations. Animated version available online at: geocompr.robinlovelace.net.", fig.scap="Animated map showing the top 30 largest 'urban agglomerations'.", echo=FALSE----
if (knitr::is_latex_output()){
    knitr::include_graphics("figures/urban-animated.png")
} else if (knitr::is_html_output()){
    knitr::include_graphics("figures/urban-animated.gif")
}

#' 
## ----08-mapping-21, echo=FALSE, eval=FALSE-------------------------------
## source("https://github.com/Robinlovelace/geocompr/raw/master/code/08-urban-animation.R")

#' 
#' The animated map illustrated in Figure \@ref(fig:urban-animated) can be created using the same **tmap** techniques that generate faceted maps, demonstrated in Section \@ref(faceted-maps).
#' There are two differences, however, related to arguments in `tm_facets()`:
#' 
#' - `along = "year"` is used instead of `by = "year"`.
#' - `free.coords = FALSE`, which maintains the map extent for each map iteration.
#' 
#' These additional arguments are demonstrated in the subsequent code chunk:
#' 
## ----08-mapping-22-------------------------------------------------------
urb_anim = tm_shape(world) + tm_polygons() + 
  tm_shape(urban_agglomerations) + tm_dots(size = "population_millions") +
  tm_facets(along = "year", free.coords = FALSE)

#' 
#' The resulting `urb_anim` represents a set of separate maps for each year.
#' The final stage is to combine them and save the result as a `.gif` file with `tmap_animation()`.
#' The following command creates the animation illustrated in Figure \@ref(fig:urban-animated), with a few elements missing, that we will add in during the exercises:
#' 
## ----08-mapping-23, eval=FALSE-------------------------------------------
## tmap_animation(urb_anim, filename = "urb_anim.gif", delay = 25)

#' 
#' Another illustration of the power of animated maps is provided in Figure \@ref(fig:animus).
#' This shows the development of states in the United States, which first formed in the east and then incrementally to the west and finally into the interior.
#' Code to reproduce this map can be found in the script `08-usboundaries.R`.
#' 
## ----08-mapping-24, echo=FALSE, eval=FALSE-------------------------------
## source("https://github.com/Robinlovelace/geocompr/raw/master/code/08-usboundaries.R")
## source("https://github.com/Robinlovelace/geocompr/raw/master/code/08-uscolonize.R")

#' 
## ----animus, echo=FALSE, message=FALSE, fig.cap="Animated map showing population growth, state formation and boundary changes in the United States, 1790-2010. Animated version available online at geocompr.robinlovelace.net.", fig.scap="Animated map showing boundary changes in the United States."----
u_animus_html = "https://user-images.githubusercontent.com/1825120/38543030-5794b6f0-3c9b-11e8-9da9-10ec1f3ea726.gif"
u_animus_pdf = "figures/animus.png"
if (knitr::is_latex_output()){
    knitr::include_graphics(u_animus_pdf)  
} else if (knitr::is_html_output()){
    knitr::include_graphics(u_animus_html)  
}

#' 
#' ## Interactive maps
#' 
#' \index{map making!interactive maps}
#' \index{tmap (package)!interactive maps}
#' While static and animated maps can enliven geographic datasets, interactive maps can take them to a new level.
#' Interactivity can take many forms, the most common and useful of which is the ability to pan around and zoom into any part of a geographic dataset overlaid on a 'web map' to show context.
#' Less advanced interactivity levels include popups which appear when you click on different features, a kind of interactive label.
#' More advanced levels of interactivity include the ability to tilt and rotate maps, as demonstrated in the **mapdeck** example below, and the provision of "dynamically linked" sub-plots which automatically update when the user pans and zooms [@pezanowski_senseplace3_2018].
#' 
#' The most important type of interactivity, however, is the display of geographic data on interactive or 'slippy' web maps.
#' The release of the **leaflet** package in 2015 revolutionized interactive web map creation from within R and a number of packages have built on these foundations adding new features (e.g., **leaflet.extras**) and making the creation of web maps as simple as creating static maps (e.g., **mapview** and **tmap**).
#' This section illustrates each approach in the opposite order.
#' We will explore how to make slippy maps with **tmap** (the syntax of which we have already learned), **mapview**\index{mapview (package)} and finally **leaflet**\index{leaflet (package)} (which provides low-level control over interactive maps).
#' 
#' A unique feature of **tmap** mentioned in Section \@ref(static-maps) is its ability to create static and interactive maps using the same code.
#' Maps can be viewed interactively at any point by switching to view mode, using the command `tmap_mode("view")`.
#' This is demonstrated in the code below, which creates an interactive map of New Zealand based on the `tmap` object `map_nz`, created in Section \@ref(map-obj), and illustrated in Figure \@ref(fig:tmview):
#' 
## ----08-mapping-25, eval=FALSE-------------------------------------------
## tmap_mode("view")
## map_nz

#' 
## ----tmview, message=FALSE, fig.cap="Interactive map of New Zealand created with tmap in view mode. Interactive version available online at: geocompr.robinlovelace.net.", fig.scap="Interactive map of New Zealand.", echo=FALSE----
if (knitr::is_latex_output()){
    knitr::include_graphics("figures/tmview-1.png")
} else if (knitr::is_html_output()){
    tmap_mode("view")
    m_tmview = map_nz
    tmap_leaflet(m_tmview)  
}


#' 
#' Now that the interactive mode has been 'turned on', all maps produced with **tmap** will launch (another way to create interactive maps is with the `tmap_leaflet` function).
#' Notable features of this interactive mode include the ability to specify the basemap  with `tm_basemap()` (or `tmap_options()`) as demonstrated below (result not shown):
#' 
## ----08-mapping-26, eval=FALSE-------------------------------------------
## map_nz + tm_basemap(server = "OpenTopoMap")

#' 
#' An impressive and little-known feature of **tmap**'s view mode is that it also works with faceted plots.
#' The argument `sync` in `tm_facets()` can be used in this case to produce multiple maps with synchronized zoom and pan settings, as illustrated in Figure \@ref(fig:sync), which was produced by the following code:
#' 
## ----08-mapping-27, eval=FALSE-------------------------------------------
## world_coffee = left_join(world, coffee_data, by = "name_long")
## facets = c("coffee_production_2016", "coffee_production_2017")
## tm_shape(world_coffee) + tm_polygons(facets) +
##   tm_facets(nrow = 1, sync = TRUE)

#' 
## ----sync, message=FALSE, fig.cap="Faceted interactive maps of global coffee production in 2016 and 2017 in sync, demonstrating tmap's view mode in action.", fig.scap="Faceted interactive maps of global coffee production.", echo=FALSE----
knitr::include_graphics("figures/interactive-facets.png")

#' 
#' Switch **tmap** back to plotting mode with the same function:
#' 
## ----08-mapping-28-------------------------------------------------------
tmap_mode("plot")

#' 
#' If you are not proficient with **tmap**, the quickest way to create interactive maps may be with **mapview**\index{mapview (package)}.
#' The following 'one liner' is a reliable way to interactively explore a wide range of geographic data formats:
#' 
## ----08-mapping-29, eval=FALSE-------------------------------------------
## mapview::mapview(nz)

#' 
## ----mapview, message=FALSE, fig.cap="Illustration of mapview in action.", echo=FALSE----
knitr::include_graphics("figures/mapview.png")
# knitr::include_graphics("https://user-images.githubusercontent.com/1825120/39979522-e8277398-573e-11e8-8c55-d72c6bcc58a4.png")
# mv = mapview::mapview(nz)
# mv@map

#' 
#' **mapview** has a concise syntax yet is powerful. By default, it provides some standard GIS functionality such as mouse position information, attribute queries (via pop-ups), scale bar, and zoom-to-layer buttons.
#' It offers advanced controls including the ability to 'burst' datasets into multiple layers and the addition of multiple layers with `+` followed by the name of a geographic object. 
#' Additionally, it provides automatic coloring of attributes (via argument `zcol`).
#' In essence, it can be considered a data-driven **leaflet** API\index{API} (see below for more information about **leaflet**). 
#' Given that **mapview** always expects a spatial object (`sf`, `Spatial*`, `Raster*`) as its first argument, it works well at the end of piped expressions. 
#' Consider the following example where **sf** is used to intersect lines and polygons and then is visualised with **mapview** (Figure \@ref(fig:mapview2)).
#' 
## ----08-mapping-30, eval=FALSE-------------------------------------------
## trails %>%
##   st_transform(st_crs(franconia)) %>%
##   st_intersection(franconia[franconia$district == "Oberfranken", ]) %>%
##   st_collection_extract("LINE") %>%
##   mapview(color = "red", lwd = 3, layer.name = "trails") +
##   mapview(franconia, zcol = "district", burst = TRUE) +
##   breweries

#' 
## ----mapview2, message=FALSE, fig.cap="Using mapview at the end of a sf-based pipe expression.", echo=FALSE, warning=FALSE----
knitr::include_graphics("figures/mapview-example.png")
## ----mapdeck, echo=FALSE, fig.cap="Map generated by mapdeck, representing road traffic casualties across the UK. Height of 1 km cells represents number of crashes.", fig.scap="Map generated by mapdeck."----
knitr::include_graphics("figures/mapdeck-mini.png")

## ----leaflet, message=FALSE, fig.cap="The leaflet package in action, showing cycle hire points in London.", fig.scap="The leaflet package in action.", echo=FALSE----
if (knitr::is_latex_output()){
  knitr::include_graphics("figures/leaflet-1.png")
} else if (knitr::is_html_output()){
  pal = colorNumeric("RdYlBu", domain = cycle_hire$nbikes)
  leaflet(data = cycle_hire) %>% 
    addProviderTiles(providers$OpenStreetMap.BlackAndWhite) %>% 
    addCircles(col = ~pal(nbikes), opacity = 0.9) %>% 
    addPolygons(data = lnd, fill = FALSE) %>% 
    addLegend(pal = pal, values = ~nbikes) %>% 
    setView(lng = -0.1, 51.5, zoom = 12) %>% 
    addMiniMap()
}

knitr::include_graphics("figures/shiny-app.png")

## ----nz-plot, message=FALSE, fig.cap="Map of New Zealand created with plot(). The legend to the right refers to elevation (1000 m above sea level).", fig.scap="Map of New Zealand created with plot()."----
g = st_graticule(nz, lon = c(170, 175), lat = c(-45, -40, -35))
plot(nz_water, graticule = g, axes = TRUE, col = "blue")
raster::plot(nz_elev / 1000, add = TRUE)
plot(st_geometry(nz), add = TRUE)

## ----map-spkg, echo=FALSE, message=FALSE---------------------------------
# source("./vignettes/gcomp-gi")
spkg_df = readr::read_csv("./data/specific_map_pkgs.csv")
map_spkg_df = dplyr::select(spkg_df, Package = package, Title = title)
knitr::kable(map_spkg_df, 
             caption = paste("Selected specific-purpose mapping packages,", 
                             "with associated metrics."),
             caption.short = "Selected specific-purpose mapping packages.",
             booktabs = TRUE)

## ----08-mapping-39, fig.show='hide', message=FALSE-----------------------
library(cartogram)
nz_carto = cartogram_cont(nz, "Median_income", itermax = 5)
tm_shape(nz_carto) + tm_polygons("Median_income")

#' 
## ----cartomap1, echo=FALSE, message=FALSE, fig.cap="Comparison of standard map (left) and continuous area cartogram (right).", fig.scap="Comparison of standard map and continuous area cartogram."----
carto_map1 = tm_shape(nz) + 
  tm_polygons("Median_income", title = "Median income (NZD)", palette = "Greens")
carto_map2 = tm_shape(nz_carto) + 
  tm_polygons("Median_income", title = "Median income (NZD)", palette = "Greens")
tmap_arrange(carto_map1, carto_map2)
