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
with(twodays, plot(with(twodays, as.POSIXct(paste(Date, Time))), Global_active_power, 
                    type = "S", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, "plot2.png")
dev.off()
