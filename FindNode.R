library(data.tree)
setwd("/Users/johnsung/Desktop/Final Project")
library(Rcpp)
sourceCpp("CloneTree.cpp")
tree <- CreateRegularTree(5,3)

CloneT <- function(tree){
  print("hi")
  return (as.Node(FindNode(tree,"1.1")))
}

traversal <- CloneT(tree)
print(test2)
