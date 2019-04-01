library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Coal.SCC <- filter(SCC, grepl('Coal', EI.Sector))
Coal.NEI <- filter(NEI, SCC %in% Coal.SCC$SCC)

png(file = "plot4.png", width = 480, height = 480)
g <- ggplot(data = Coal.NEI, aes(x = factor(year), y = Emissions, fill = factor(year)))
g + geom_bar(stat = "identity") + ggtitle("Emissions from Coal Combustion-Related Sources across U.S. by Year") +
  xlab("Year") + ylab("Emissions in Tonnes")
dev.off()