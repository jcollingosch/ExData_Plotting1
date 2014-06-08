
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


# build plot 1

hist(powerDat$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# save plot 1
dev.copy(png,
         filename = "plot1.png",
         width = 480,
         height = 480)
dev.off()










