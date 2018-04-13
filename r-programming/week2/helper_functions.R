# Helper functions for the 1st programming assignment

# The id vector needs to be converted into a string that is padded with 0s.
# For example, the first file in the directory is '001.csv' not '1.csv'
# There probably is a nicer way to do this but here's a function
prepend_zeroes <- function(num) {
  if(num >= 10 & num < 100) { paste("0", num, sep = "") }
  else if(num < 10)         { paste("00", num, sep = "") }
  else { as.character(num) }
}

# Quick function to build the filename and then return a dataframe

read_data_file <- function(directory, id, extension = ".csv") {
  file_name <- paste(directory, prepend_zeroes(id), sep = "/")
  file_name <- paste(file_name, extension, sep = "")
  new_dat <- read.csv(file_name)
  new_dat
}

# Here is a function that will loop through a dataframe and 'complete' it in the sense
# that it will eliminate any rows containing NAs
complete_df <- function(df) { 
  # First, store the names of the column so that they can be sequentially indexed.
  df_names <- names(df) 
  for(name in df_names) {
    df <- df[!is.na(df[name]),] 
  }
  df
}