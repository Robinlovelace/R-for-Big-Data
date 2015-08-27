# Book building function
rmd_bind <- function(book_header, dir = ".", render=TRUE){
  old <- setwd(dir);  on.exit(setwd(old))
  write(readLines(book_header), file = "book.Rmd")

  cfiles <- list.files(pattern = "*.Rmd")
  cfiles <- cfiles[-grep("book.Rmd", cfiles)]
  cfiles <- cfiles[-grep("00-header.Rmd", cfiles)]


  if(exists("chap_ord")){
    cfiles <- cfiles[chap_ord] # chapter order
  }

  ttext <- NULL
  for(i in 1:length(cfiles)){
    text <- readLines(cfiles[i])
    hspan <- grep("---", text)
    if(length(hspan > 1)) text <- text[-c(hspan[1]:hspan[2])]
    write(text, sep = "\n", file = "book.Rmd", append = TRUE)
  }
  if(render)
    rmarkdown::render("book.Rmd")
  #     render("book.Rmd", output_format = "pdf_document")
}