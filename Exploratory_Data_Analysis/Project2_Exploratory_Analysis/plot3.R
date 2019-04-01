library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
options(scipen=100000)

Baltimore <- filter(NEI, fips == "24510")

png(file = "plot3.png", width = 480, height = 480)
g <- ggplot(data = Baltimore, aes(x = factor(year), y = Emissions, fill = type))
g + geom_bar(stat = "identity", width = 0.5) + facet_grid(.~ factor(type)) + xlab("Year") +
  ylab("Total PM2.5 Emission") + ggtitle("Emissions in Baltimore by type in Tonnes")
dev.off()