# read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset only Baltimore City data
NEIBC <- subset(NEI, fips == 24510)

# sum the total emissions for all years
sumdata <- aggregate(NEIBC$Emissions, by=list(NEIBC$year), FUN=sum)

# put the data into a plot
png("plot2.png")
barplot(sumdata[,2], names.arg=sumdata[,1], main="Total PM2.5 emission for Baltimore City")
dev.off()
