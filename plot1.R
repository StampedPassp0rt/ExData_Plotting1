plot1 <- function(file) {
	
	power_data <- read.table('household_power_consumption.txt', sep=';', header=TRUE,colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),na.strings='?')
	power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")
	
	power_data_subset <- power_data[power_data$Date>="2007-02-01" & power_data$Date<="2007-02-02",]
	##producing histogram of global active power
	hist(power_data_subset[,3], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
	dev.copy(png, file="plot1.png", width=480, height=480)
	dev.off()
	
}

