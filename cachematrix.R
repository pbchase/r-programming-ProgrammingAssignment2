# These functions in cachematrix.R provide a caching service for R's
# solve() function.  This allows programs to access the
# inverse of a large matrix without the penalty of recomputing the inverse.
#
# makeCacheMatrix creates an object that stores the matrix value and
# some related value.
#
# cacheSolve computes the inverse of a matrix, stores the inverse as
# part of the object, and reaccesses the stored value on subsequent calls.

makeCacheMatrix <- function(x = matrix()) {
    # makeCacheMatrix - a function to cache a matrix and the result of an
    # operation on the matrix.  Any operation can be cached.
    #
    # Usage:
    #   Create an object and store a matrix in it
    #     x <- rnorm(25)
    #     a <- makeCacheMatrix(x)
    #
    #   Access the stored matrix
    #     copy_of_matrix x$get()
    #
    #   Store the operation on the matrix
    #     result <- some_function(x$get())
    #     x$setoutput(result)
    #
    #   Access the stored result
    #     x$getoutput()
    #
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
    # cacheSolve returns a matrix that is the inverse of 'x' and caches
    # that value for later retrieva using the an object of class makeCacheMatrix
    # Based loosely on cacheMean: https://github.com/rdpeng/ProgrammingAssignment2, Roger D. Peng
    output <- x$getoutput()
    if (is.null(output)) {
        output <- solve(x$get(), ...)
        x$setoutput(output)
    } else {
        message("getting cached data")
    }
    return(output)
}
