data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
working_data <- subset(data, data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"))

working_data$DateTime <- as.POSIXct(paste(working_data$Date, working_data$Time),format = "%Y-%m-%d %H:%M:%S")

png("plot3.png")

plot(working_data$DateTime, working_data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering", xaxt="n")
lines(working_data$DateTime, working_data$Sub_metering_2, col = "red")
lines(working_data$DateTime, working_data$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, bty = "n")

axis(1, at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")), labels = c("Thu", "Fri", "Sat"))
dev.off()

