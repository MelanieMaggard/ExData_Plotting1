## Read data file into R.
library(lubridate)
all_data <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE,
                       sep=";", na.strings = "?")

## Subset out only data from 2007-02-01 through 2007-02-02
all_data$Date_Time <- strptime(paste(all_data$Date, all_data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
daily_data <- all_data[all_data$Date_Time >= "2007-02-01" & all_data$Date_Time <"2007-02-03", ]

##Create plot matching plot 2.
plot(daily_data$Date_Time, daily_data$Global_active_power, 
     type= "l",
     main = " ", 
     ylab="Global Active Power (kilowatts)", 
     xlab=" ", 
     col="black")

##Copies plot to PNG file.
dev.copy(png, file="plot2.png", width=480, height=480)

##Closes graphics device.
dev.off()