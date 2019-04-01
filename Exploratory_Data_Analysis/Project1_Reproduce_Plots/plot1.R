#plot1.
library(dplyr)
library(tidyr)

data <- read.table('household_power_consumption.txt', 
                       sep = ';', 
                       header = TRUE, 
                       colClasses = c("character", "character", rep("numeric", 7)),
                       na.strings = "?")

Electric <- filter(data, Date %in% c("1/2/2007", "2/2/2007"))

png(file = "plot1.png", width = 480, height = 480)
hist(Electric$Global_active_power, 
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     ylim = c(0,1200))
dev.off()
                   
