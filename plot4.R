data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
working_data <- subset(data, data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"))

working_data$DateTime <- as.POSIXct(paste(working_data$Date, working_data$Time),format = "%Y-%m-%d %H:%M:%S")

png("plot4.png")
par(mfrow = c(2, 2))

x_ticks <- as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03"))

# Top-left: Global Active Power
plot(working_data$DateTime, working_data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power", xaxt = "n")
axis(1, at = x_ticks, labels = c("Thu", "Fri", "Sat"))

# Top-right: Voltage
plot(working_data$DateTime, working_data$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis(1, at = x_ticks, labels = c("Thu", "Fri", "Sat"))

# Bottom-left: Energy Sub Metering
plot(working_data$DateTime, working_data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(working_data$DateTime, working_data$Sub_metering_2, col = "red")
lines(working_data$DateTime, working_data$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, bty = "n")
axis(1, at = x_ticks, labels = c("Thu", "Fri", "Sat"))

# Bottom-right: Global Reactive Power
plot(working_data$DateTime, working_data$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global Reactive Power", xaxt = "n")
axis(1, at = x_ticks, labels = c("Thu", "Fri", "Sat"))

dev.off()