# See README file for instructions to run the code

# makeCacheMatrix is a function that returns a list of functions it is used 
# to store a martix and a cached value of the inverse of the matrix. 
# makCacheMatrix Contains the following functions:

# 1 setMatrix   -   set the value of a matrix
# 2 getMatrix    -  get the value of a matrix
# 3 cacheInverse  - get the cahced value (inverse of the matrix)
# 4 getInverse    - get the cahced value (inverse of the matrix)

# Notes:
# not sure how the "x = numeric()" part works in the argument list of the 
# the x is present in makeCacheMatrix and not available in the Global Environment
makeCacheMatrix <- function(x = numeric()) {
  
# holds the cached value or NULL if nothing is cached
# Set cache equal to NULL initially 
  cache <- NULL
  
# store a matrix
  setMatrix <- function(newValue) {
    x <<- newValue
# since the matrix is assigned a new value, flush the cache
    cache <<- NULL
  }
  
# returns the stored matrix
  getMatrix <- function() {
    x
  }
  
# cache the given argument 
  cacheInverse <- function(solve) {
    cache <<- solve
  }
  
# get the cached value
  getInverse <- function() {
    cache
  }
  
# return a list. Each named element of the list is a function
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}

# The following function calculates the inverse of a "special" matrix created with 
# makeCacheMatrix
cacheSolve <- function(y, ...) {
  # get the cached value
  inverse <- y$getInverse()
  # if a cached value exists return it
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
# otherwise get the matrix, caclulate the inverse and store it in
# the cache 
  data <- y$getMatrix()
  inverse <- solve(data)
  y$cacheInverse(inverse)
  
# return the inverse
  inverse
}
