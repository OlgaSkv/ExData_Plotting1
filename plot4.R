library(lubridate)

data <- read.table(file = "household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
dates = c(ymd("2007-02-01"), ymd("2007-02-02"))
data <- subset(data, data$Date %in% dates)

par(mfrow = c(2, 2), mar = c(5, 4.1, 1, 1))
with(data, {
        plot(Date + Time, Global_active_power, type = "l",
             xlab = "",
             ylab = "Global Active Power",
             main = NULL);
        plot(Date + Time, Voltage, type = "l",
             xlab = "datetime",
             ylab = "Voltage",
             main = NULL);
        plot(Date + Time, Sub_metering_1, type = "l", col = "black",
             xlab = "",
             ylab = "Energy sub metering",
             main = NULL);
        points(Date + Time, Sub_metering_2, type = "l", col = "red");
        points(Date + Time, Sub_metering_3, type = "l", col = "blue")
        legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.5);
        plot(Date + Time, Global_reactive_power, type = "l",
             xlab = "datetime",
             ylab = "Global_reactive_power",
             main = NULL);     
})        
dev.copy(png, file = "plot4.png", width=480, height= 480)
dev.off()
