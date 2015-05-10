complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  for(i in seq_along(id)) {
    
    if( id[i] < 10) {
      Num <- paste0("00",id[i])
    }
    else if( id[i] < 100) {
      Num <- paste0("0",id[i])
    } else {
      Num <- as.character(id[i])
    }
    CompleteCases <- sum(complete.cases(read.csv(paste0(directory,.Platform$file.sep,Num,".csv"))))
    
    if(i == 1) {   
      Data <- data.frame(id = id[i], nobs = CompleteCases)
    } else {
      Data <- rbind(Data,data.frame(id = id[i], nobs = CompleteCases))
    }  
  }
  Data
  
}