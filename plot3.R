# Assumes your data has been extracted into the "data" directory
electric <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE)
electric <- electric[electric$Date == "1/2/2007" | electric$Date == "2/2/2007",]
electric$Global_active_power <- as.numeric(electric$Global_active_power)
electric$DateTime <- strptime(paste(electric$Date, electric$Time), "%d/%m/%Y %H:%M:%S")

png(filename="plot3.png")
plot(electric$DateTime, electric$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(electric$DateTime, electric$Sub_metering_2, col = "red")
lines(electric$DateTime, electric$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch="_", col = c("black", "red", "blue"))
dev.off()