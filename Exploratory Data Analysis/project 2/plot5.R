# read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# add the classification codes to the dataset
NEI2 <- merge(x = NEI, y = SCC, by.x = "SCC", by.y = "SCC")

# subset only the motor vehicle sources in Baltimore City
NEI3 <- subset(NEI2[grep("Veh", NEI2$Short.Name),], fips == 24510)

# sum the total emissions for all years
sumdata <- aggregate(NEI3$Emissions, by=list(NEI3$year), FUN=sum)

# put the data into a plot
png("plot5.png")
barplot(sumdata[,2], names.arg=sumdata[,1], main="Total PM2.5 emission from motor vehicles in Baltimor City")
dev.off()
