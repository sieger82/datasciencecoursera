# read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# sum the total emissions for all years
sumdata <- aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)

# put the data into a plot
png("plot1.png")
barplot(sumdata[,2], names.arg=sumdata[,1], main="Total PM2.5 emission from all sources")
dev.off()
