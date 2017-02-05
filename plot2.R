## read, clean

ulldata <- read.table("./Desktop/r/Data/household_power_consumption.txt", sep = ';', header = TRUE, na.strings = "?")
ulldata$Date <- as.Date(ulldata$Date, "%d/%m/%Y")
slice <- subset(ulldata, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
DateTime <- paste(slice$Date, slice$Time)
DateTime <- as.POSIXct(DateTime)
slice <- cbind(DateTime, slice)

## 2nd

plot(slice$Global_active_power~slice$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## save 

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()