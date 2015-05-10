best <- function(state, outcome) {
        ## Read outcome data
        outcomeOfCare <- read.csv("outcome-of-care-measures.csv", 
                                  na.strings = "Not Available")
        
        ## check that state and outcome are valid
        states <- levels(outcomeOfCare$State)
        if(!state %in% states) stop("invalid state")
        
        outcomes <- c("heart attack", "heart failure", "pneumonia")
        if(!outcome %in% outcomes) stop("invalid outcome")
        
        ## Return hostpital name in that state with lowest 30-day death
        outcomeOfCareSubSet <- subset(outcomeOfCare, State == state)
        if(outcome == "heart attack") rateCol <- 11
        else if (outcome == "heart failure") rateCol <- 17
        else if (outcome == "pneumonia") rateCol <- 23        
        
        minDeathRate <- min(outcomeOfCareSubSet[[rateCol]], na.rm = TRUE)
        minRow <- match(minDeathRate, outcomeOfCareSubSet[[rateCol]], nomatch = 0)
        as.character(outcomeOfCareSubSet[[minRow, 2]])
        ##print(bestHospital, max.levels = 0)
}