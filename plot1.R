## Read data file into R.
all_data <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE,
            sep=";", na.strings = "?")

## Subset out only data from 2007-02-01 through 2007-02-02
all_data$Date_Time <- strptime(paste(all_data$Date, all_data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
daily_data <- all_data[all_data$Date_Time >= "2007-02-01" & all_data$Date_Time <"2007-02-03", ]

##Create histogram matching plot 1.
hist(daily_data$Global_active_power, 
   main = "Global Active Power", 
   xlab="Global Active Power (kilowatts)", ylab="Frequency", 
   col="red")

##Copies plot to PNG file.
dev.copy(png, file="plot1.png", width=480, height=480)

##Closes graphics device.
dev.off()