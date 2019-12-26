---
title: "Using compareGroups function"
author: "Anthony Davidson"
date: "2019-06-11"
output: rmarkdown::html_notebook
---

The compareGroups package (Subirana, Sanz, and Vila 2014) allows users to create tables displaying results of univariate analyses, stratified or not by categorical variable groupings.

Tables can easily be exported to CSV, LaTeX, HTML, PDF, Word or Excel, or inserted in R-markdown files to generate reports automatically.

<center>
![image](./_assets/img/compareGroups-gui-shot.jpg){
width=50% }
</center>

This package can be used from the R prompt or from a user-friendly graphical user interface for non-R familiarized users.

The compareGroups package is available on CRAN repository. To load the package using the R prompt, enter:


{% highlight r %}
library(compareGroups)
{% endhighlight %}

## My notes

I have developed this slightly in my notes as function used for quick descriptive statistics using R and a GUI. For now these notes are on this page. At some stage I plan to move these to there own repository.

### GUI

To access the GUI there are several additional packages that are needed so that a interactive window can be opened by RStudio. However, these packages will already be running if you have other similar functions within your library already.


{% highlight r %}
# compareGroups::cGroupsGUI(mtcars)
{% endhighlight %}

## Tutorials

There is a very good vignette for this package [here]("https://cran.r-project.org/web/packages/compareGroups/vignettes/compareGroups_vignette.html#launch-the-wui-application"). This document provides an overview of the usage of the compareGroups package with a real examples, both using the R syntax and the graphical user interface. It is structure as follows:
Overall, there is a introduction of the package (section 2) and the data used as example (section 3),
Instructions to perform descriptive tables and exploration plots using R syntax are explained (section 4), and
Usage of graphical user interface based on tcl-tk (section 5) and based on Shiny (section 6) are shown.


