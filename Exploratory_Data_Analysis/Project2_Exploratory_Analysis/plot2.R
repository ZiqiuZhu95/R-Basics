library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore <- NEI %>% filter(fips == "24510")

png(file = "plot2.png", width = 480, height = 480)
plot(x = unique(Baltimore$year) ,
     y = tapply(Baltimore$Emissions, Baltimore$year, sum), 
     type = 'l', 
     xlab = "Year",
     ylab = "Baltimore Emissions",
     main = "Total Emissions in Baltimore by Year in Tonnes")
points(unique(Baltimore$year), tapply(Baltimore$Emissions, Baltimore$year, sum), pch = 20)
dev.off()

