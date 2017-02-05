ulldata <- read.table("./Desktop/r/Data/household_power_consumption.txt", sep = ';', header = TRUE, na.strings = "?")
ulldata$Date <- as.Date(ulldata$Date, "%d/%m/%Y")
slice <- subset(ulldata, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
DateTime <- paste(slice$Date, slice$Time)
DateTime <- as.POSIXct(DateTime)
slice <- cbind(DateTime, slice)

## 4th of four

par(mfrow = c(2,2))

#4.1 copy from 2, lose brackets

plot(slice$Global_active_power~slice$DateTime, type="l", ylab="Global Active Power", xlab="")

#4.2 

plot(slice$Voltage~slice$DateTime, type="l", xlab= "datetime", ylab="Voltage")

#4.3 copy 3rd, again lose brackets

with(slice, { plot(Sub_metering_1~DateTime, type="l", ylab = "Global Active Power", xlab = "")
   lines(Sub_metering_2~DateTime, col = "red")
   lines(Sub_metering_3~DateTime, col = "blue")
	})

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"), lwd = c(1,1, 1), col = c("black", "red", "blue"))
 
 #4.4
 
 plot(slice$Global_reactive_power~slice$DateTime, type="l", xlab= "datetime", ylab="Global_reactive_power")
 
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()