# complete.R

# Read the directory full of datafiles in the same way as pollutantmean
# Report the number of completely observed cases and build a dataframe using that
#    and the file's name (id) 

# Get the helper function: prepend_zeroes
source("helper_functions.R")

complete <- function(directory, id = 1:332) {
    # Create the template for the final data frame. Perhaps, save for the end?
    final_df <- data.frame(id = integer(), nobs = integer())
    
    # Now, need to loop through the monitor id's to create the correct file_description
    # And then complete the dataframe that was read in.
    # Finally, combine it to the final dataframe.
      for(file_id in id) {
          new_dat <- read_data_file(directory, file_id)
        
          # Now, that the data has been read in, work to complete it
          completed_data <- complete_df(new_dat)
          
          # Count the number of complete observations from that monitor's data
          nobs <- nrow(completed_data)
          
          # Add the file number and the number of observations to the final dataframe.
          final_df <- rbind(final_df, c(file_id, nobs))
    }
    names(final_df) <- c("id", "nobs")
    final_df
}