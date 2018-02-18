# Get the data set
dataFile <- "./PowerConsumption/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset the data
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Generate plot 
globalActivePower <- as.numeric(subData$Global_active_power)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# save to plot1.png
png("plot1.png", width=480, height=480)
dev.off()
