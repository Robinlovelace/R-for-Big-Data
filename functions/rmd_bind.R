# Book building function
rmd_bind <- function(dir = ".",
                     book_header = readLines(textConnection("---\ntitle: 'Title'\n---")),
                     render=TRUE){
  old <- setwd(dir)
  on.exit(setwd(old))
  if(length(grep("book.Rmd$", list.files())) > 0){
    warning("book.Rmd already exists")
  }
  cfiles <- list.files(pattern = "*.Rmd")
  cfiles <- cfiles[-grep("book", cfiles)]
  cfiles <- cfiles[-grep("00-header.Rmd", cfiles)]
  if(exists("chap_ord")){
    cfiles <- cfiles[chap_ord] # chapter order
  }
  write(readLines(book_header), file = "book.Rmd")
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