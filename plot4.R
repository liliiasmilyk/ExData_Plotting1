##to read file, converte Date and Time
rawdata<- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", 
                     na.strings = "?")
rawdata$Date<- as.Date(rawdata$Date, tryFormats = "%d/%m/%Y")
rawdata$Time<- times(rawdata$Time)
head(rawdata)

firstday<- subset(rawdata, Date == "2007-02-01")
secondday<- subset(rawdata, Date == "2007-02-02")
twodays<- rbind(firstday, secondday)

## to build 4 plots
par(mfrow = c(2,2), mar = c(4, 4, 2, 1))
with(twodays, {
        plot(with(twodays, as.POSIXct(paste(Date, Time))), Global_active_power, 
                   type = "S", xlab = "", ylab = "Global Active Power")
        plot(with(twodays, as.POSIXct(paste(Date, Time))), Voltage, 
             type = "S", xlab = "datetime", ylab = "Voltage")
        plot(with(twodays, as.POSIXct(paste(Date, Time))), Sub_metering_1, 
             type = "S", xlab = "", ylab = "Energy sub metering")
        lines(with(twodays, as.POSIXct(paste(Date, Time))), twodays$Sub_metering_2, col = "red", 
                type = "S")
        lines(with(twodays, as.POSIXct(paste(Date, Time))), twodays$Sub_metering_3, col = "blue", 
                type = "S")
        legend("topright", pch = c(NA, NA, NA), col = c("black", "red", "blue"), lwd = 1, 
               cex = 0.5, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(with(twodays, as.POSIXct(paste(Date, Time))), Global_reactive_power, 
             type = "S", xlab = "datetime", ylab = "Global_reactive_power")
        })
dev.copy(png, "plot4.png")
dev.off()
