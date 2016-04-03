data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c(rep("character", 2), rep("numeric", 7)), na.strings = "?")

##  subset data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##  corret data and time format
dataNeeded <- transform(subSetData, Date = as.Date(subSetData$Date, format = "%d/%m/%Y"), Time = strptime(paste(subSetData$Date, subSetData$Time), format = "%d/%m/%Y %H:%M:%S"))
##  PNG graphics
png("plot1.png",  width = 480, height = 480)

##  histogram
hist(dataNeeded$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", xlim = range(dataNeeded$Global_active_power), ylim = c(0, 1200))

##  closes the PNG graphics device
dev.off()
