#xml in from web

# install and load the necessary package
myPaths <- .libPaths("C:/Program Files/R/R-3.6.2/library")
myPaths <- c(myPaths)
.libPaths(myPaths)  # add new path
.libPaths()


## NEW BETTER TIDY WAY
library(rvest) # github version
library(xml2)  # github version


xml.url <- "http://www.w3schools.com/xml/plant_catalog.xml"
# 
# url <- "http://www.england.nhs.uk/statistics/statistical-work-areas/bed-availability-and-occupancy/"
doc <- read_html(xml.url)

# doc %>% 
#   html_nodes("a[href^='http://www.england.nhs.uk/statistics/bed-availability-and-occupancy/']") %>% 
#   html_attr("href")

## [1] "http://www.england.nhs.uk/statistics/bed-availability-and-occupancy/bed-data-overnight/"
## [2]

# the xml file is now saved as an object you can easily work with in R:
class(doc)
# Use the xmlRoot-function to access the top node
xmltop = xml_node(doc, css = )
# have a look at the XML-code of the first subnodes:
print(xmltop)[1:2]
# Use the xmlTreePares-function to parse xml file directly from the web
# https://www.domain.com/sitemap.xml

xmlfile <- xmlTreeParse(xml.url)
# the xml file is now saved as an object you can easily work with in R:
class(xmlfile)
# Use the xmlRoot-function to access the top node
xmltop = xmlRoot(xmlfile)
# have a look at the XML-code of the first subnodes:
print(xmltop)[1:2]







##OLD XML DOESNT WORK
# install.packages(“XML”)
library(XML)
# Save the URL of the xml file in a variable

# xml.url <- c("https://dblp.org/xml")
# xml.url <- "https://www.ssnhub.com/index.xml"

xml.url <- "http://www.w3schools.com/xml/plant_catalog.xml"
# Use the xmlTreePares-function to parse xml file directly from the web

xmlfile <- xmlTreeParse(xml.url)
# the xml file is now saved as an object you can easily work with in R:
class(xmlfile)
# Use the xmlRoot-function to access the top node
xmltop = xmlRoot(xmlfile)
# have a look at the XML-code of the first subnodes:
print(xmltop)[1:2]
# Use the xmlTreePares-function to parse xml file directly from the web
# https://www.domain.com/sitemap.xml

xmlfile <- xmlTreeParse(xml.url)
# the xml file is now saved as an object you can easily work with in R:
class(xmlfile)
# Use the xmlRoot-function to access the top node
xmltop = xmlRoot(xmlfile)
# have a look at the XML-code of the first subnodes:
print(xmltop)[1:2]