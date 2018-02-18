##  Getting dataset
dataFile <- "./PowerConsumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Getting the subdata
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert datetime
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)

## Generate plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Save to plot2.png
png("plot2.png", width=480, height=480)
dev.off()
