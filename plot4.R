library(dplyr)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
head(data)
sep_dates <- c("1/2/2007", "2/2/2007")
sep_data <- filter(data, Date %in% sep_dates)
head(sep_data)
data_GAP <- as.numeric(as.character(sep_data$Global_active_power))
Datetime <- strptime(paste(sep_data$Date, sep_data$Time), "%d/%m/%Y %H:%M:%S")
head(Datetime)

par(mfrow = c(2, 2))

plot(Datetime, data_GAP, type = "l", ylab = "Global Active Power", xlab = "")

plot(Datetime, sep_data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(Datetime, sep_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(Datetime, sep_data$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
points(Datetime, sep_data$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n",)

plot(Datetime, as.numeric(as.character(sep_data$Global_reactive_power)), type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0, 0.5))

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
