# test functions of cachematrix.R
message("test functions of cachematrix.R")

# prepare for tests
x <- matrix(rnorm(16), 4, 4)
my_object <- makeCacheMatrix(x)

# test methods of data storage class
expect_identical(x,my_object$get())

dummy <- 4
my_object$setoutput(dummy)
expect_identical(dummy,my_object$getoutput())

# ----------------
# test cache function

# prepare for tests
x <- matrix(rnorm(16), 4, 4)
my_object <- makeCacheMatrix(x)

# generate function output
expect_identical(solve(x), cacheSolve(my_object))
# recall cached value
expect_identical(solve(x), cacheSolve(my_object))

# check for the message that says the cache was read
expect_that(cacheSolve(my_object), shows_message("getting cached data"))

# test that a revision to the input changes the output
x <- matrix(rnorm(25),5,5)
my_object <- makeCacheMatrix(x)

expect_identical(x,my_object$get())
expect_identical(solve(x), cacheSolve(my_object))



