rankall <- function(outcome, num = "best") {
        ## Read outcome data
        outcomeOfCare <- read.csv("outcome-of-care-measures.csv", 
                                  na.strings = "Not Available")
        
        ## Check that state and outcome are valid
        outcomes <- c("heart attack", "heart failure", "pneumonia")
        if(!outcome %in% outcomes) stop("invalid outcome")
        
        if(outcome == "heart attack") rateCol <- 11
        else if (outcome == "heart failure") rateCol <- 17
        else if (outcome == "pneumonia") rateCol <- 23
        
        ## For each state, find the hospital of the given rank
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        States <- levels(outcomeOfCare[[7]])
        RankList <- data.frame(row.names = States)
        for(i in seq_along(States)) {
                outcomeOfCareSubSet <- subset(outcomeOfCare, State == States[i])
                Ranking <- order(outcomeOfCareSubSet[rateCol], outcomeOfCareSubSet[2], na.last = NA)
                if(num == "best") num2 <- 1
                else if(num == "worst") num2 <- length(Ranking) 
                else num2 <- num
                RankList$hospital[i] <- as.character(outcomeOfCareSubSet[Ranking[num2],2])
                RankList$state[i] <- as.character(States[i])
        }
        return(RankList)
}
