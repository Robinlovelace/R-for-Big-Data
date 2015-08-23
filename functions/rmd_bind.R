# Book building function
rmd_bind <- function(dir = ".",
  book_header = readLines(textConnection("---\ntitle: 'Title'\n---"))){
  old <- setwd(dir)
  on.exit(setwd(old))
  if(length(grep("book.Rmd$", list.files())) > 0){
    warning("book.Rmd already exists")
  }
  cfiles <- list.files(pattern = "*.Rmd")
  cfiles <- cfiles[-grep("book", cfiles)]
  if(exists("chap_ord")){
    cfiles <- cfiles[chap_ord] # chapter order
  }
  write(book_header, file = "book.Rmd")
  ttext <- NULL
  for(i in 1:length(cfiles)){
    text <- readLines(cfiles[i])
    hspan <- grep("---", text)
    text <- text[-c(hspan[1]:hspan[2])]
    write(text, sep = "\n", file = "book.Rmd", append = T)
  }
  #     render("book.Rmd", output_format = "pdf_document")

}