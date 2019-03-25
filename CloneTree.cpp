#include <Rcpp.h>
#include <string>
using namespace Rcpp;



// [[Rcpp::export]]
RObject CloneTree(RObject parent) {
  //std::copy(parent.begin(),parent.end(),std::back_inserter(out));
  RObject out = parent;
  out.attr("class") = parent.attr("class");
  out.attr("row.names") = parent.attr("row.names") ;
  out.attr("names") = parent.attr("names");
  return out;
}
