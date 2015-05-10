 pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  j <- 1
  for(i in id) {
    
    if( i < 10) {
      Num <- paste0("00",i)
    }
    else if( i < 100) {
      Num <- paste0("0",i)
    } else {
      Num <- as.character(i)
    }
    if(j == 1) {
      Data <- read.csv(paste0(directory,.Platform$file.sep,Num,".csv"))[[pollutant]]
    } else {
      Data <- append(Data, read.csv(paste0(directory,.Platform$file.sep,Num,".csv"))[[pollutant]])
    }  
    j <- j + 1
  }
  return(mean(Data, na.rm = TRUE))
 }
