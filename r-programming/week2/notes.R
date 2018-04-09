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
