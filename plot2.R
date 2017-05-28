# Assumes your data has been extracted into the "data" directory
electric <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE)
electric <- electric[electric$Date == "1/2/2007" | electric$Date == "2/2/2007",]
electric$Global_active_power <- as.numeric(electric$Global_active_power)
electric$DateTime <- strptime(paste(electric$Date, electric$Time), "%d/%m/%Y %H:%M:%S")

png(filename="plot2.png")
plot(electric$DateTime, electric$Global_active_power / 500, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()