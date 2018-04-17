# *apply functions notes

# lapply is a function that easily loops over a list-like object, applying a function to each element.
lapply(1:6, FUN = function(x) {x + 1})

# Here is a list with some random values
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))

# To perform some function over each item in the list:
lapply(x, mean)

# Now, this is where things get interesting! The elements of the 'list' can be parameters
#   in the function of lapply. 
args(runif)
n <- 1:5
lapply(n, runif)

# Arguments can be passed in the '...' argument of lapply
lapply(n, runif, min = 0, max = 10)

# Extracting the first column of matrices:
a <- matrix(1:4, 2, 2)
b <- matrix(1:6, 3, 2)

lapply(list(a, b), function(m) {m[,1]})

# Sapply, on the other hand, merely tries to simplify the result. As in, if the return list of lapply
#   has all the same length and type, sapply will return a vector.
sapply(x, mean)

# apply is an analogous function that works over arrays. The main difference is the use of the 
#  MARGIN argument which specifies which vectors to apply the function over.
m <- matrix(rnorm(200), 20, 10)
dim(m)
apply(m, 2, mean)   # Calculating the mean of the columns
apply(m, 1, sum)    # Calculating the sum of the rows.
 
# Some optimized shortcuts exist:
rowSums(m)
colSums(m)
rowMeans(m)
colMeans(m)

# mapply is a an apply for multivariable objects. So, if there were multiple lists to use lapply on,
#  a for loop could be used, but mapply does well instead.

list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
# Instead of that, mapply can be used!
mapply(rep, 1:4, 4:1)

# Instant Vectorization is awesome!
# Example used in the lecture is noise
noise <- function(n, mean, sd) {
    rnorm(n, mean, sd)
}
noise(10, 0, 1)

# In a call such as noise(1:5, 1:5, 2), we don't get what we want.
noise(1:5, 1:5, 2)

mapply(noise, 1:5, 1:5, 2)  # first list is with one value and mean at 1.
# second list is two values with mean at 2 and so on...


# TODO: tapply understanding.
# function to be applied over certain factors or something. Ragged array?

# Generating factor levels
args(gl)
gl(3, 5)

# f will be the factor levels
f <- gl(3, 10)
f2 <- gl(3, 10, labels = c("random", "uniform", "random_1"))

x_tapply <- c(rnorm(10), runif(10), rnorm(10, 1))
tapply(x_tapply, f2, mean)

# Split is essentially tapply without applying any function
split(x_tapply, f2)

# split has drop for when empty levels exist
# interaction combines multiple factors


# Debugging 

# Invisible is a function that returns an object that is not printed as it's invisible.

# Setting a global option for error:
# options(error = recover)

# vapply is essentially sapply with a security measure built in ... it takes an argument of the 
#   expected return value and throws an error if mismatched.
