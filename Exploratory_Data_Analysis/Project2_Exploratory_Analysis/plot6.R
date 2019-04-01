library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore.LA <- filter(NEI, fips == '24510' | fips == '06037')
Vehicles <- filter(SCC, grepl('Vehicles', EI.Sector) )
Motor.Vehicles.NEI <- filter(Baltimore.LA, SCC %in% Vehicles$SCC)
county.names <- c('06037' = 'Baltimore','24510' = 'LA')

png(file = "plot6.png", width = 480, height = 480)
g <- ggplot(data = Motor.Vehicles.NEI, aes(factor(year), Emissions, fill = fips))
g + geom_bar(stat = "identity") + facet_grid(fips ~ ., scales = "free", labeller = as_labeller(county.names)) +
  xlab("Year") + ggtitle("Motor Vehicle Emission in Baltimore and Los Angeles in Tonnes")
dev.off()