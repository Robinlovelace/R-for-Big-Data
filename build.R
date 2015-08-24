# Aim: build the tutorial from its constituent parts
(cfiles <- list.files(pattern = "*.Rmd$"))

book_header <- readLines(textConnection(
'---
title: "R for Big Data"
author: "Colin Gillespie and Robin Lovelace"
output: rmarkdown::tufte_handout
---'
))


source("functions/rmd_bind.R")
rmd_bind(book_header = book_header)

rmarkdown::render("book.Rmd")
