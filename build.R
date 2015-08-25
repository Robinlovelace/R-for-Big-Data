# Aim: build the tutorial from its constituent parts
(cfiles <- list.files(pattern = "*.Rmd$"))
book_header <- readLines(textConnection(
'---
title: "R for Big Data"
author: "Colin Gillespie and Robin Lovelace"
date: "February 8, 2015"
classoption: oneside
output:
  rticles::tufte_ebook:
    toc: true
    latex_engine: pdflatex
    toc_depth: 3
    number_sections: true
    keep_tex: true
---'
))


source("functions/rmd_bind.R")
rmd_bind(book_header = book_header)

rmarkdown::render("book.Rmd")
