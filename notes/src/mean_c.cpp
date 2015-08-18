#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
double mean_c(NumericVector x){
  int i;
  int n = x.size();
  double mean = 0;

  for(i=0; i<n; i++){
    mean = mean + x[i]/n;
  }
  return mean;
}