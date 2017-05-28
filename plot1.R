# Assumes your data has been extracted into the "data" directory
electric <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE)
electric <- electric[electric$Date == "1/2/2007" | electric$Date == "2/2/2007",]
electric$Global_active_power <- as.numeric(electric$Global_active_power)

png(filename="plot1.png")
hist(electric$Global_active_power / 500, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()