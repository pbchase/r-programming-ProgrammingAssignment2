# test methods of makevector

x <- seq(1,10,1)
my_vector <- makeVector(x)

expect_identical(x,my_vector$get())
expect_identical(mean(x), cachemean(my_vector))

# test that a revision to the input changes the output
x <- seq(1,100,1)
my_vector <- makeVector(x)

expect_identical(x,my_vector$get())
expect_identical(mean(x), cachemean(my_vector))


