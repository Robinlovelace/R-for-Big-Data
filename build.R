# Aim: build the tutorial from its constituent parts
(cfiles <- list.files(path = "notes", pattern = "*.Rmd$"))
chap_ord <- c(1,3,2)
(cfiles <- cfiles[chap_ord]) # chapter order

book_header <- readLines(textConnection(
'---
title: "R for Big Data"
author: "Colin Gillespie and Robin Lovelace"
output: rmarkdown::tufte_handout
---

```{r, echo=FALSE}
library(knitr)
knitr::opts_knit$set(root.dir = "../")
```'
  ))


source("functions/rmd_bind.R")
rmd_bind(dir = "notes", book_header = book_header, chap_ord = chap_ord)

rmarkdown::render("notes/book.Rmd")
