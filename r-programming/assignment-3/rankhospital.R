rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        outcomeOfCare <- read.csv("outcome-of-care-measures.csv", 
                                  na.strings = "Not Available")
        
        ## Check that state and outcome are valid        
        states <- levels(outcomeOfCare$State)
        if(!state %in% states) stop("invalid state")
        
        outcomes <- c("heart attack", "heart failure", "pneumonia")
        if(!outcome %in% outcomes) stop("invalid outcome")
        
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        outcomeOfCareSubSet <- subset(outcomeOfCare, State == state)
        if(outcome == "heart attack") rateCol <- 11
        else if (outcome == "heart failure") rateCol <- 17
        else if (outcome == "pneumonia") rateCol <- 23
        
        Ranking <- order(outcomeOfCareSubSet[rateCol], outcomeOfCareSubSet[2], na.last = NA)
        if(num == "best") num <- 1
        if(num == "worst") num <- length(Ranking) 
        return(as.character(outcomeOfCareSubSet[Ranking[num],2]))
}
