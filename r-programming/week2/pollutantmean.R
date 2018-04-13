# Programming assignment 1. Functions:

# Some 332 csv files containing pollution levels of sulfate and nitrate.
# Each file is a different location in the United States.


# Part1: function pollutantmean should calculate the mean of a pollutant (sulfate or nitrate) across
# a specified list of monitors.
# 3 Arguments: directory, pollutant and id. 
#     directory is where the files are held.
#     pollutant is either of the two pollutants
#     id is the monitor id. 

source("helper_functions.R")
pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
     # Now, need to loop through the monitor id's to create the correct file_description
     # Might as well make this a function to build the dataframe
     # Incrementally add to an initially empty dataframe:
     build_dataframe <- function(directory, id, extension = ".csv"){
       monitor_df <- data.frame()
       for(file_id in id) {
         file_name <- paste(directory, prepend_zeroes(file_id), sep = "/")
         file_name <- paste(file_name, extension, sep = "")
         new_dat <- read.csv(file_name)
         monitor_df <- rbind(monitor_df, new_dat)
       }
       monitor_df
     }
     df <- build_dataframe(directory, id)
     
     # Strip the NAs from the dataframe for the pollutant
     df_complete <- df[!is.na(df[pollutant]),]
     
     # Return the mean of the cases for pollutant.
     mean(df_complete[, pollutant])
}

