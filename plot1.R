library(lubridate)

data <- read.table(file = "household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
names(data)
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
dates = c(ymd("2007-02-01"), ymd("2007-02-02"))
data <- subset(data, data$Date %in% dates)

par(mfrow = c(1, 1), mar=c(5.1, 4.1, 4.1, 2.1))
hist(data$Global_active_power, col = "Red",
xlab = "Global Active Power (kilowatts)",
ylab = "Frequency",
main = "Global Active Power")
dev.copy(png, file = "plot1.png", width=480, height= 480)
dev.off()