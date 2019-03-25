library(data.tree)
library(microbenchmark)
library(testthat)

setwd("/Users/rayliang/Programming/ECS145")
library(Rcpp)
sourceCpp("ProblemA.cpp")
tree <- CreateRegularTree(5,2)

CloneT <- function(tree){
	return (as.Node(CloneTree(tree)))
}
Clone1 <- function(node, pruneFun = NULL, attributes = FALSE){
	#
	#node <- as.data.frame(node)
	#ret <- CloneTree(node, "Tree")
	#names(node) <- "Tree"
	#return (ret)
	.Clone1(node, pruneFun, attributes)

}

.Clone1 <- function(node, pruneFun = NULL, attributes = FALSE, firstCall = TRUE) {

  myclone <- node$clone()
  if (attributes) attributes(myclone) <- attributes(node)
  if (!is.null(pruneFun) && length(node$children) > 0) {
    keep <- sapply(node$children, pruneFun)
    children <- node$children[keep]
    rm(list = names(node$children)[!keep], envir = myclone)
  } else children <- node$children
  myclone$children <- lapply(children, function(x) .Clone1(x, pruneFun, attributes, firstCall = FALSE))
  
  if (length(myclone$children) == 0) myclone$children <- NULL
  if (firstCall) myclone$parent <- NULL #myclone$RemoveAttribute("parent", stopIfNotAvailable = FALSE)
  return (myclone)
}

# test2 <- CloneT(tree)
# #test2$"[[2]]"

# #test2 <- as.Node(test2)
# test2


# print("EXPECTED: ")
# # test <- Node$new("1")
# # test$AddChild("1.1")
# test <- CreateRegularTree(10,2)
# test <- as.list(test)

# test <- as.Node(test)
# test


microbenchmark(
	Clone(tree),
	CloneT(tree)
	)

# test_that("Clone", {
#   data(acme)
#   n <- CloneT(acme)
  
#   expect_equal(class(n), class(acme))
#   expect_equal(n$name, acme$name)
#   expect_equal(n$count, acme$count)
#   expect_equal(n$totalCount, acme$totalCount)
#   expect_equal(n$Climb("IT", "Go agile")$p, Climb(acme, "IT", "Go agile")$p)
  
#   expect_equal(as.list(n), as.list(acme))
#   acme2 <- acme
#   expect_identical(acme, acme2)
  
#   #expect_false(n, is_identical_to(acme))
#   n$name <- 'Acme2'
#   expect_false(n$name == acme$name)
  
# })