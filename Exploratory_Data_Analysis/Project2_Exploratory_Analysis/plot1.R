library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI1999 <- subset(NEI, year == 1999)
NEI2002 <- subset(NEI, year == 2002)
NEI2005 <- subset(NEI, year == 2005)
NEI2008 <- subset(NEI, year == 2008)

total.pm99 <- sum(NEI1999$Emissions, na.rm = TRUE) #There are no na values but it's nice to use na.rm anyways
total.pm02 <- sum(NEI2002$Emissions, na.rm = TRUE)
total.pm05 <- sum(NEI2005$Emissions, na.rm = TRUE)
total.pm08 <- sum(NEI2008$Emissions, na.rm = TRUE)

png(file = "plot1.png", width = 480, height = 480)
plot(c("1999", "2002", "2005", "2008"), c(total.pm99, total.pm02, total.pm05, total.pm08),
     xlab = "Year",
     ylab = "Total Emissions",
     main = "Total PM2.5 Emissions by Year in Tonnes",
     type = 'l')
points(c("1999", "2002", "2005", "2008"), c(total.pm99, total.pm02, total.pm05, total.pm08), pch = 20)
dev.off()
