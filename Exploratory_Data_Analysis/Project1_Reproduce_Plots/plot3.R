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
png(file = "plot3.png", width = 480, height = 480)
plot(Electric$datetime,
     Electric$Sub_metering_1,
     type = 'n',
     ylab = 'Energy sub metering',
     xlab = '')
points(Electric$datetime, Electric$Sub_metering_1, type = 'l')
points(Electric$datetime, Electric$Sub_metering_2, type = 'l', col = 'red')
points(Electric$datetime, Electric$Sub_metering_3, type = 'l', col = 'blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty= 1)
dev.off()