
library(dplyr)
# Electric Power Consumption data
powerDatFull <- read.table(file="household_power_consumption.txt",
                           header = TRUE,
                           sep = ";",
                           na.strings="?")

# subset data
powerDat <- filter(powerDatFull, Date == "1/2/2007" | Date == "2/2/2007")
powerDat <- mutate(powerDat, DateTime = paste(Date,Time))
powerDat <- transform(powerDat, DateTime = strptime(DateTime,"%d/%m/%Y %T"))


# set up plotting 
par(mfrow = c(2,2))

# build plot 4

# Global Active Power time series plot
plot(powerDat$DateTime, powerDat$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

# Voltage time series plot
plot(powerDat$DateTime, powerDat$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")

# Sub_metering time series plots
plot(powerDat$DateTime, powerDat$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")
lines(x=powerDat$DateTime, powerDat$Sub_metering_2, col = "red")
lines(x=powerDat$DateTime, powerDat$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       col = c("black", "red", "blue"),
       cex = 0.75,
       text.width = 85000,
       bty = "n")

# Global reactive power time series plot
plot(powerDat$DateTime, powerDat$Global_reactive_power,
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")


# save plot 4
dev.copy(png,
         filename = "plot4.png",
         width = 480,
         height = 480)
dev.off()





