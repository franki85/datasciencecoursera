data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c(rep("character", 2), rep("numeric", 7)), na.strings = "?")

##  subset the data to only dates Feb 1st, 2007 and Feb 2nd, 2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##  corret data and time format
dataNeeded <- transform(subSetData, Date = as.Date(subSetData$Date, format = "%d/%m/%Y"), Time = strptime(paste(subSetData$Date, subSetData$Time), 
                                                                                                          format = "%d/%m/%Y %H:%M:%S"))
##  PNG graphics 2
png("plot2.png",  width = 480, height = 480)

##  line graph
plot(dataNeeded$Time, dataNeeded$Global_active_power, type = "l", pch = NA, lwd = 1, xlab = "", 
     ylab = "Global Active Power (kilowatts)", ylim = range(dataNeeded$Global_active_power))

##  closes the PNG graphics device
dev.off()
