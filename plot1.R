data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
working_data <- subset(data, data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"))

png('plot1.png')
hist(working_data$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', main='Global Active Power')
dev.off()
