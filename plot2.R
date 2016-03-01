plot2 <- function(file) {
	
	power_data <- read.table('household_power_consumption.txt', sep=';', header=TRUE,colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),na.strings='?')
	power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")
	
	power_data_subset <- power_data[power_data$Date>="2007-02-01" & power_data$Date<="2007-02-02",]
	##creating timestamp
	timestamp <- paste(as.Date(power_data_subset$Date), power_data_subset$Time)
	##making timestamp into POSIXct class
	power_data_subset$timestamp <- as.POSIXct(timestamp)
	##Line plot of Active Power by Day
	plot(power_data_subset$Global_active_power ~ power_data_subset$timestamp, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
	dev.copy(png, file="plot2.png", width=480, height=480)
	dev.off()
	
}

