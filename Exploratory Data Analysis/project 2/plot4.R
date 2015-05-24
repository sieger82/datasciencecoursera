# read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# add the classification codes to the dataset
NEI2 <- merge(x = NEI, y = SCC, by.x = "SCC", by.y = "SCC")

# subset only the Coal combustion related sources
NEI3 <- NEI2[grep("Comb.*Coal", NEI2$Short.Name),]

# sum the total emissions for all years
sumdata <- aggregate(NEI3$Emissions, by=list(NEI3$year), FUN=sum)

# put the data into a plot
png("plot4.png")
barplot(sumdata[,2], names.arg=sumdata[,1], main="Total PM2.5 emission from coal combustion related sources")
dev.off()
