# Assumes your data has been extracted into the "data" directory
electric <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE)
electric <- electric[electric$Date == "1/2/2007" | electric$Date == "2/2/2007",]
electric$Global_active_power <- as.numeric(electric$Global_active_power)
electric$Global_reactive_power <- as.numeric(electric$Global_reactive_power)
electric$Voltage <- as.numeric(electric$Voltage)
electric$DateTime <- strptime(paste(electric$Date, electric$Time), "%d/%m/%Y %H:%M:%S")


png(filename="plot4.png")
par(mfcol=c(2,2))
# Plot 1
plot(electric$DateTime, electric$Global_active_power / 500, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Plot 2
plot(electric$DateTime, electric$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(electric$DateTime, electric$Sub_metering_2, col = "red")
lines(electric$DateTime, electric$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch="_", col = c("black", "red", "blue"))

# Plot 3
plot(electric$DateTime, electric$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 4
plot(electric$DateTime, electric$Global_reactive_power / 500, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
