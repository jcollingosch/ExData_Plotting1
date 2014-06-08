
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

# build plot 2

plot(powerDat$DateTime, powerDat$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

# save plot 2
dev.copy(png,
         filename = "plot2.png",
         width = 480,
         height = 480)
dev.off()



