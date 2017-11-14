library(lubridate)

data <- read.table(file = "household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
dates = c(ymd("2007-02-01"), ymd("2007-02-02"))
data <- subset(data, data$Date %in% dates)

par(mfrow = c(1, 1), mar = c(4, 4, 1, 1))
with(data, {
        plot(Date + Time, Sub_metering_1, type = "l", col = "black",
              xlab = "",
              ylab = "Energy sub metering",
              main = NULL);
        points(Date + Time, Sub_metering_2, type = "l", col = "red");
        points(Date + Time, Sub_metering_3, type = "l", col = "blue")
})
legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", width=480, height= 480)
dev.off()
