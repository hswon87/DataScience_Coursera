Developing Data Products
========================================================
author: Sangwon Han
date: Jan 8, 2019
autosize: true

Introduction
========================================================

This presentation is for "Course Project: Shiny Application and Reproducible Pitch" in Developing Data Projects

I made an interactive histogram to find a mean value of dataset using Shiny App. R code files are available on the GitHub:

- <a href="https://github.com/hswon87/course9-4/blob/master/ui.R" target="_blank">ui.R</a>
- <a href="https://github.com/hswon87/course9-4/blob/master/server.R" target="_blank">server.R</a>

Galton
========================================================
Galton's height data for parents and children is

- Tabulated data set used by Galton in 1885
- To study the relationship between a parent's height and their childrens
- A data frame with 928 observations and 2 variables (Child and midparent's height)


Dataset
========================================================
The summary of child's height:

```r
suppressMessages(library(UsingR))
summary(galton$child)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  61.70   66.20   68.20   68.09   70.20   73.70 
```

The summary of parents' height:

```r
summary(galton$parent)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  64.00   67.50   68.50   68.31   69.50   73.00 
```

Plot
========================================================
The relationship between parents and child' heights

```r
plot(galton$parent, galton$child, xlab ="Parents' height", ylab ="Child height")
lm <- lm(galton$child ~ galton$parent)
abline(lm)
```

![plot of chunk unnamed-chunk-3](presentation-figure/unnamed-chunk-3-1.png)
```
