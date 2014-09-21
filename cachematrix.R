## Put comments here that give an overall description of what your
## functions do

# These functions in cachematrix.R provide a caching service layered
# on top of R's solve() function.  This allows programs to access the
# inverse of a large matrix with the penalty of recomputing the inverse.
# makeCacheMatrix creates an object that stores the matrix value and
# the some related value.
# cacheSolve computes the inverse of a matrix, stores the inverse as
# part of the object, and reaccess the stored value on subsequent calls.

makeCacheMatrix <- function(x = matrix()) {
    # makeCacheMatrix - a function to cache a matrix and the result of an
    # operation on the matrix.  Any operation can be cached.
    # Based on makeVector: https://github.com/rdpeng/ProgrammingAssignment2, Roger D. Peng
    o <- NULL
    set <- function(y) {
            x <<- y
            o <<- NULL
    }
    get <- function() x
    setoutput <- function(output) o <<- output
    getoutput <- function() o
    list(set = set, get = get,
         setoutput = setoutput,
         getoutput = getoutput)
}


cacheSolve <- function(x, ...) {
    # cacheSolve returns a matrix that is the inverse of 'x' and cache's
    # that value for later retrieval.
    output <- x$getoutput()
    if (is.null(output)) {
        output <- solve(x$get(), ...)
        x$setoutput(output)
    } else {
        message("getting cached data")
    }
    return(output)
}
