##to read file, converte Date and Time
rawdata<- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", 
                     na.strings = "?")
rawdata$Date<- as.Date(rawdata$Date, tryFormats = "%d/%m/%Y")
rawdata$Time<- times(rawdata$Time)
head(rawdata)

firstday<- subset(rawdata, Date == "2007-02-01")
secondday<- subset(rawdata, Date == "2007-02-02")
twodays<- rbind(firstday, secondday)

## to built a plot
with(twodays, plot(with(twodays, as.POSIXct(paste(Date, Time))), Sub_metering_1, 
                   type = "S", xlab = "", ylab = "Energy sub metering"))
lines(with(twodays, as.POSIXct(paste(Date, Time))), twodays$Sub_metering_2, col = "red", 
      type = "S")
lines(with(twodays, as.POSIXct(paste(Date, Time))), twodays$Sub_metering_3, col = "blue", 
      type = "S")
legend("topright", pch = c(NA, NA, NA), col = c("black", "red", "blue"), lwd = 2, 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, "plot3.png")
dev.off()
