ulldata <- read.table("./Desktop/r/Data/household_power_consumption.txt", sep = ';', header = TRUE, na.strings = "?")
ulldata$Date <- as.Date(ulldata$Date, "%d/%m/%Y")
slice <- subset(ulldata, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
DateTime <- paste(slice$Date, slice$Time)
DateTime <- as.POSIXct(DateTime)
slice <- cbind(DateTime, slice)

## 3 rd

 with(slice, { plot(Sub_metering_1~DateTime, type="l", ylab = "Energy sub metering", xlab = "")
+     lines(Sub_metering_2~DateTime, col = "red")
+     lines(Sub_metering_3~DateTime, col = "blue")
+     })

 legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"), lwd = c(1,1, 1), col = c("black", "red", "blue"))
 
## save 

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()