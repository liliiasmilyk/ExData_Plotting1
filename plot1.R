##to read file, converte Date and Time
rawdata<- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", 
                     na.strings = "?")
rawdata$Date<- as.Date(rawdata$Date, tryFormats = "%d/%m/%Y")
rawdata$Time<- times(rawdata$Time)
head(rawdata)

firstday<- subset(rawdata, Date == "2007-02-01")
secondday<- subset(rawdata, Date == "2007-02-02")
twodays<- rbind(firstday, secondday)

## to build histogram
hist(twodays$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off()
