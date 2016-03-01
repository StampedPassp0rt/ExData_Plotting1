plot4 <- function(file) {
	
	power_data <- read.table('household_power_consumption.txt', sep=';', header=TRUE,colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),na.strings='?')
	power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")
	
	power_data_subset <- power_data[power_data$Date>="2007-02-01" & power_data$Date<="2007-02-02",]
		##creating timestamp
	timestamp <- paste(as.Date(power_data_subset$Date), power_data_subset$Time)
		##making timestamp into POSIXct class
	power_data_subset$timestamp <- as.POSIXct(timestamp)
		##setting up the plot to take four plots in one screen
	par(mfrow = c(2,2))
		##Plots
	with(power_data_subset, { 
		##Global Active Power by Day line plot
	plot(Global_active_power ~ timestamp, type = "l", ylab = "Global Active Power", xlab = "") 
		##Voltage line plot by Day
	plot(Voltage ~ timestamp, type = "l", ylab = "Voltage", xlab = "datetime") 
		##Sub Metering plot
	plot(Sub_metering_1 ~ timestamp, type = "l", col = "black", ylab = "Energy Sub Metering", xlab = "")
	lines(Sub_metering_2 ~ timestamp, type = "l", col = "red")
	lines(Sub_metering_3 ~ timestamp, type = "l", col = "blue")
	legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
		##Global reactive power plot
	plot(Global_reactive_power ~ timestamp, type = "l", ylab = "Global_reactive_power", xlab = "datetime") 
	})
	dev.copy(png, file="plot4.png", width=480, height=480)
	dev.off()
	
}

