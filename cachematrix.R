##
##  Birchard Hayes
##  R Programming Coursera
##  Assignment 2
##
##  Calculates the inverse of a square, invertable matrix and caches the result

##  This function creates a special "matrix" object that can cache its inverse
##  Assumes that the matrix supplied is always invertible.
##
## Usage:
## > m <- matrix(...)
## > cm <- makeCacheMatrix(m)
## > inv <- cacheSolve(cm)

makeCacheMatrix <- function(x = matrix()) 
{
    m <- NULL  ## default inverted matrix is null
    set <- function(y)
    {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setInverse <- function(solve) m <<- solve
    getInverse <- function() m
    
    list (set = set, get = get, 
          setInverse = setInverse, getInverse = getInverse)
}

##  This function computes the inverse of the special "matrix" 
##  returned by makeCacheMatrix above. 
##  If the inverse has already been calculated (and the matrix has not changed), 
##  then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getInverse()
    if (!is.null(m))
    {
        message("getting cached inverted matrix")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setInverse(m)
    m
}
