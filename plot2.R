library(dplyr)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
head(data)
sep_dates <- c("1/2/2007", "2/2/2007")
sep_data <- filter(data, Date %in% sep_dates)
head(sep_data)
data_GAP <- as.numeric(as.character(sep_data$Global_active_power))
Datetime <- strptime(paste(sep_data$Date, sep_data$Time), "%d/%m/%Y %H:%M:%S")
head(Datetime)
plot(Datetime, data_GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
