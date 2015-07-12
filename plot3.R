## Read data file into R.
library(lubridate)
all_data <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE,
                       sep=";", na.strings = "?")

## Subset out only data from 2007-02-01 through 2007-02-02
all_data$Date_Time <- strptime(paste(all_data$Date, all_data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
daily_data <- all_data[all_data$Date_Time >= "2007-02-01" & all_data$Date_Time <"2007-02-03", ]

##Create plot matching plot 3.
##Sub_metering_1 data
plot(daily_data$Date_Time, daily_data$Sub_metering_1, 
     type = "l",
     col = "black",
     main = " ", 
     ylab = "Energy sub metering", 
     xlab = " ")

##Sub_metering_2 data
points(daily_data$Date_Time, daily_data$Sub_metering_2, 
type = "l",
col = "red")

##Sub_metering_3 data
points(daily_data$Date_Time, daily_data$Sub_metering_3, 
type = "l",
col = "blue")

legend("topright", pch=c(NA, NA, NA), lwd=c(4, 4, 4),
      col=c("black", "red", "blue"),
      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Copies plot to PNG file.
dev.copy(png, file="plot3.png", width=480, height=480)

##Closes graphics device.
dev.off()