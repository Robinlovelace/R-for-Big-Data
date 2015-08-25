source("functions/rmd_bind.R")
# Aim: build the tutorial from its constituent parts
(cfiles <- list.files(pattern = "*.Rmd$"))



rmd_bind(book_header = "00-header.Rmd")

rmarkdown::render("book.Rmd")
