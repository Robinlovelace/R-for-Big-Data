# Which chapters do you want to build?
chap_ord = 1:6

# Book building function
rmd_bind <- function(book_header, dir = ".", render=TRUE, chap_ord = NULL){
  old <- setwd(dir);  on.exit(setwd(old))
  write(readLines(book_header), file = "book.Rmd")

  cfiles <- list.files(pattern = "*.Rmd")
  cfiles <- cfiles[-grep("book.Rmd", cfiles)]
  cfiles <- cfiles[-grep("00-header.Rmd", cfiles)]

  if(!is.null(chap_ord)) cfiles = cfiles[chap_ord]

  for(i in 1:length(cfiles)){
    ttext <- readLines(cfiles[i])
    hspan <- grep("---", ttext)
    if(length(hspan > 1)) ttext <- ttext[-(hspan[1]:hspan[2])]
    write(ttext, sep = "\n", file = "book.Rmd", append = TRUE)
  }
  if(render)
    rmarkdown::render("book.Rmd")
}

rmd_bind(book_header = "00-header.Rmd", chap_ord = chap_ord)
