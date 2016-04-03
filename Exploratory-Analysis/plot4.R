data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c(rep("character", 2), rep("numeric", 7)), na.strings = "?")

##  subset the data to only dates Feb 1st, 2007 and Feb 2nd, 2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##  corret data and time format
dataNeeded <- transform(subSetData, Date = as.Date(subSetData$Date, format = "%d/%m/%Y"), Time = strptime(paste(subSetData$Date, subSetData$Time), format = "%d/%m/%Y %H:%M:%S"))
##  PNG graphics
png("plot4.png",  width = 480, height = 480)

par(mfrow = c(2, 2))

##  1st graph: Time and Global Active Power
plot(dataNeeded$Time, dataNeeded$Global_active_power, type = "l", pch = NA, lwd = 1, xlab = "", ylab = "Global Active Power", ylim = range(dataNeeded$Global_active_power))

##  2nd graph: Time and Voltage
plot(dataNeeded$Time, dataNeeded$Voltage, type = "l", pch = NA, lwd = 1, xlab = "datetime", ylab = "Voltage", ylim = range(dataNeeded$Voltage))

##  3rd graph:  Time and Sub Meterings 
plot(dataNeeded$Time, dataNeeded$Sub_metering_1, type = "l", pch = NA, lwd = 1, xlab = "",ylab = "Energy sub metering", ylim = range(dataNeeded$Sub_metering_1))
lines(dataNeeded$Time, dataNeeded$Sub_metering_2, pch = NA, lwd = 1, col = "red")
lines(dataNeeded$Time, dataNeeded$Sub_metering_3, pch = NA, lwd = 1, col = "blue")
legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), bty = "n")

##  4th graph:  Time and Global Reactive Power 
plot(dataNeeded$Time, dataNeeded$Global_reactive_power, type = "l", pch = NA, lwd = 1,xlab = "datetime", ylab = "Global_reactive_power", ylim = range(dataNeeded$Global_reactive_power))

##  closes the PNG graphics device
dev.off()
