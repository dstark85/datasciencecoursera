# coor.R

# Calculate the correlation betwwen sulfate and nitrate on the monitors that
# meet a threshold level of complete observations.
# The function should return a vector of correlations for those monitors exceeding
#  the threshold.

source("complete.R")
source("helper_functions.R")

corr <- function(directory, threshold = 0) {
     # Correlation results vector
     corr_results <- vector()
     
     # Create the complete observations table so that complete observations is accessible.
     complete_data <- complete("specdata")
     
     # Select only the observations that exceed the threshold.
     exceeds_threshold <- complete_data[complete_data$nobs > threshold,]
     
     # Now, use the id in each compute the correlation betwwen sulfate and nitrate
     for(file_id in exceeds_threshold$id) {
         # Make the filename, again.
         dat_file <- read_data_file(directory, file_id)
         
         # Re-complete the dataframe
         complete_thresholds <- complete_df(dat_file)
         
         # Create the correlation between sulfate and nitrate
         sulfate_levels <- complete_thresholds$sulfate
         nitrate_levels <- complete_thresholds$nitrate
         
         corr_results <- append(corr_results, cor(sulfate_levels, nitrate_levels))
     }
     corr_results
}