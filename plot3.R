## copy dataset

dataFile <- "./PowerConsumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## generate subdata
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Create Filters
globalActivePower <- as.numeric(subData$Global_active_power)
Metering1 <- as.numeric(subData$Sub_metering_1)
Metering2 <- as.numeric(subData$Sub_metering_2)
Metering3 <- as.numeric(subData$Sub_metering_3)

## Generate plots
plot(datetime, Metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Metering2, type="l", col="red")
lines(datetime, Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Copy to plot3.png
png("plot3.png", width=480, height=480)
dev.off()
