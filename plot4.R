household <- read.csv(file = "../household_power_consumption.txt",
                      sep = ";",
                      as.is = TRUE,
                      na.string = "?",
                      colClasses = c(NA, NA, "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
household$datetime <- strptime(paste(household$Date, household$Time), "%d/%m/%Y %H:%M:%S")
household <- subset(household, as.Date(datetime) %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))

png("plot4.png", width = 480, height = 480)

par(mfcol = c(2, 2), mar = c(4, 4, 1, 1))

# This is the same as plot 2
with(household, { plot(datetime, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
  lines(datetime, Global_active_power)  })

# This is the same as plot 3
with(household, { plot(datetime, Sub_metering_1, type = "n",
                       xlab = "", ylab = "Energy sub metering")
  lines(datetime, Sub_metering_1, col = "black")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
  legend("topright",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"),
         lty = 1 )
})

with(household, { plot(datetime, Voltage, type = "n", ylab = "Voltage")
                  lines(datetime, Voltage) } )

with(household, { plot(datetime, Global_reactive_power, type = "n", ylab = "Global_reactive_power")
                  lines(datetime, Global_reactive_power) } )

dev.off()
