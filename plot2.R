library(lubridate)

data <- read.table(file = "household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
dates = c(ymd("2007-02-01"), ymd("2007-02-02"))
data <- subset(data, data$Date %in% dates)

par(mfrow = c(1, 1), mar = c(5, 4.1, 1, 1))
with(data, 
     plot(Date + Time, Global_active_power, type = "l",
          xlab = "",
          ylab = "Global Active Power (kilowatts)",
          main = NULL)
)        
dev.copy(png, file = "plot2.png", width=480, height= 480)
dev.off()
