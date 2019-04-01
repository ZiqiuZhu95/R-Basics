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


png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
plot(Electric$datetime, 
     Electric$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = 'l')

plot(Electric$datetime,
    Electric$Voltage,
    xlab = 'datetime',
    ylab = 'Voltage',
    type = 'l')

plot(Electric$datetime,
     Electric$Sub_metering_1,
     type = 'n',
     ylab = 'Energy sub metering',
     xlab = '')
points(Electric$datetime, Electric$Sub_metering_1, type = 'l')
points(Electric$datetime, Electric$Sub_metering_2, type = 'l', col = 'red')
points(Electric$datetime, Electric$Sub_metering_3, type = 'l', col = 'blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty= 1, bty ='n', cex = 0.5)

plot(Electric$datetime,
     Electric$Global_reactive_power,
     xlab = 'datetime',
     ylab = 'Global_reactive_power',
     type = 'l')
dev.off()