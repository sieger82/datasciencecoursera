# load ggplot2 library
library(ggplot2)

# read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset only Baltimore City data
NEIBC <- subset(NEI, fips == 24510)

# sum the total emissions for all years
sumdata <- aggregate(NEIBC$Emissions, by=list(NEIBC$year, NEIBC$type), FUN=sum)

# make the plot
png("plot3.png", width=960)
qplot(factor(Group.1), x, data=sumdata, geom="bar", facets=. ~ Group.2, stat="identity",
      xlab="Emissions per year for each type of source for Baltimor City",
      ylab="Total PM2.5 emission")
dev.off()

