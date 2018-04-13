### Week 2 Notes

# Objectives:
# Control structures
# Functions
# Scoping

# Control structures are similar to C
if(0 == 0) {
  x <- 0
} else {
  x <- 1
}

# They can be used in a slighly different way though
x <- if(1) {100} else {
  0
}

# For loops, on the other hand, are quite similar to Python.
for(i in 1:10) {
  print(i)
}

# Seq_along is about the eqivalent to range(len(OBJECT))
my_name <- c("D", "e", "r", "e", "k")
for(i in seq_along(my_name)) {
  print(my_name[i])
}

# Python once again:
for(letter in my_name) {
  print(letter)
}

# While is practically C.
count <- 0
while(count < 10) {
  count <- count + 1
  print(count)
}

# Subset Function
subset_fun <-  function(v) {
  v[v > 10]
}

# Mean of each column in a data frame
df_mean <- function(df) {
  for(column in seq_len(ncol(df))) {x[column] <- (mean(df[,column]))} 
}

# Formals gets access to the arguments of a function args is a little more human readable
formals(sd)
args(sd)

# ... argument can extend another function
args(paste)

# R searches enviorments for functions ...
search()

# Interesting! When a package is loaded via library call, that package gets places in the second
#  location of the environment list thus making it more likely to be used if a conflict.
library(nycflights13)  
search()    # This package should be listed second now.

# Function interposition. Clojure
make.pow <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}

# Getting the date and time:
Sys.time()

# Swirl Notes:

# Logical operations
# && and || operate only on the first member of a vector whereas, & and | operate across entire vector
FALSE | c(FALSE, TRUE, NA)
FALSE || c(FALSE, TRUE, NA) 

# Which returns the indices of a vector where it is TRUE
which(sample(10) > 5)

# All, returns TRUE if ALL of the elements evaluate to TRUE
all(sample(10) > 0)

# Any, returns TRUE if ANY of the elements evaluate to TRUE
any(sample(10) == 9)


# --- Functions ---
# Clojure example
increment <- function(x) {x + 1}
decrement <- function(x) {x - 1}
some_func <- function(func, x) {
    func(x)
}

# Anonymous functions (Lambda?)
some_func(function(a) {a *10}, 10)


# Creating a new binary operator:
"%r*%" <- function(left, right) {
    left * rbinom(1, 10, 0.5) + right + rbinom(1, 10, 0.5)
}
