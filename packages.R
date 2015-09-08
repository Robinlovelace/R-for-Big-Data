## CRAN packages needed
pkgs = c(
  "drat", "dplyr", "readxl",
  "readr", "gdata", "openxlsx",
  "downloader", "tidyr", "Rcpp",
  "pryr", "grid", "png",
  "ff", "ffbase", "biglm", "xtable"
)
## Github packages
github_pkgs = c("r4bd")


## create the data frames
pkgs = data.frame(pkg = pkgs,
                  repo = "http://cran.rstudio.com/",
                  installed = pkgs %in% installed.packages(),
                  stringsAsFactors = FALSE)

if(!require(drat)){
  install.packages("drat")
}
repo = drat::addRepo("rcourses")["rcourses"]

github_pkgs = data.frame(pkg = github_pkgs,
                         repo = repo,
                         installed = github_pkgs %in% installed.packages(),
                         stringsAsFactors = FALSE, row.names=NULL)

## Combine all data frames of package info
pkgs = rbind(pkgs, github_pkgs)

## Update packages
update.packages(checkBuilt = TRUE, ask = FALSE,
                repos = unique(pkgs$repo),
                oldPkgs = pkgs$pkg)

## Install missing packages
to_install = pkgs[!pkgs$installed,]
if(nrow(to_install))
  install.packages(to_install$pkg, repos = to_install$repo)
