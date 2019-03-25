# data.tree

The data.tree package allows for the creation of bi-directional, ordered tree structures called data.tree from hierarchical data. Aside from creation, the package also provides the basic operations such as print, plot, clone, aggregate, traversal, search, sort, and more. It also supports conversions from and to data.frames, lists, and other tree structures. For the purpose of the project, we attempted to speed up the runtime of the selected functions from the package by simply rewriting the R functions in C++ code.

# Improved CloneTree

We implemented the Clone function in the data.tree package as a C++ function CloneTree. Copying another tree requires the function to use memory space. With R being inefficient in its memory usage, we thought that creating a function in C++ will allow this function to perform at a much faster rate.

# isUnique 

We have modified the FindNode function in the data.tree package as C++ function Exists. We considered this as a new feature function, because instead of returning the sub-tree of the Node, we are returning the Boolean value that indicates whether the given Node exists in the parent Node. In our new function, we were able to implement it more efficiently than if it were implemented in R. The function takes in the arguments tree and the name of the node, and returns if the node exists inside of the tree or not. It is considerably quicker than when implementing in R because the for loops in R are not as fast as the C++ ones. 
