# read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# add the classification codes to the dataset
NEI2 <- merge(x = NEI, y = SCC, by.x = "SCC", by.y = "SCC")

# subset only the motor vehicle sources in Baltimore City and LA
NEI3 <- subset(NEI2[grep("Veh", NEI2$Short.Name),], fips == "24510" | fips == "06037")

# sum the total emissions for all years
sumdata <- aggregate(NEI3$Emissions, by=list(NEI3$year, NEI3$fips), FUN=sum)

# put the data into a plot
png("plot6.png")
qplot(factor(Group.1), x, data=sumdata, geom="bar", facets=. ~ Group.2, stat="identity",
      xlab="Motor vehicle related emissions per year for Baltimor City and Los Angeles",
      ylab="Total PM2.5 emission")
dev.off()
