
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

# build plot 3

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
       text.width = 46000)

# save plot 3
dev.copy(png,
         filename = "plot3.png",
         width = 480,
         height = 480)
dev.off()







