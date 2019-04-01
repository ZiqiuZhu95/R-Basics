library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore <- filter(NEI, fips == '24510')
Vehicles <- filter(SCC, grepl('Vehicles', EI.Sector) )
Motor.Vehicles.NEI <- filter(Baltimore, SCC %in% Vehicles$SCC)

png(file = "plot5.png", width = 480, height = 480)
g <- ggplot(data = Motor.Vehicles.NEI, aes(factor(year), Emissions, fill = year))
g + geom_bar(stat = "identity") + ggtitle("Motor Vehicle Emission in Baltimore in Tonnes")
dev.off()