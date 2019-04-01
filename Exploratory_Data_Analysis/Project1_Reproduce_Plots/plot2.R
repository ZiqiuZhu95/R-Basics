library(dplyr)
library(tidyr)

data <- read.table('household_power_consumption.txt', 
                   sep = ';', 
                   header = TRUE, 
                   colClasses = c("character", "character", rep("numeric", 7)),
                   na.strings = "?")

Electric <- filter(data, Date %in% c("1/2/2007", "2/2/2007"))

Electric$Date <- as.Date(Electric$Date, format = "%d/%m/%Y")
Electric$datetime <- strptime(paste(Electric$Date, Electric$Time), "%Y-%m-%d %H:%M:%S")

png(file = "plot2.png", width = 480, height = 480)
plot(Electric$datetime, 
     Electric$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = 'l')
dev.off()
