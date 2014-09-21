# test functions of makevector.R
message("")
message("test functions of makevector.R")

# prepare for tests
x <- seq(1,10,1)
my_object <- makeVector(x)

# test methods of data storage class
expect_identical(x,my_object$get())

dummy <- 4
my_object$setmean(dummy)
expect_identical(dummy,my_object$getmean())

# ----------------
# test cache function

# prepare for tests
x <- seq(1,10,1)
my_object <- makeVector(x)

# generate function output
expect_identical(mean(x), cachemean(my_object))
# recall cached value
expect_identical(mean(x), cachemean(my_object))

# check for the message that says the cache was read
expect_that(cachemean(my_object), shows_message("getting cached data"))

# test that a revision to the input changes the output
x <- seq(1,100,1)
my_object <- makeVector(x)

expect_identical(x,my_object$get())
expect_identical(mean(x), cachemean(my_object))
