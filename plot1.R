household <- read.csv(file = "../household_power_consumption.txt",
                      sep = ";",
                      as.is = TRUE,
                      na.string = "?",
                      colClasses = c(NA, NA, "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
household$datetime <- strptime(paste(household$Date, household$Time), "%d/%m/%Y %H:%M:%S")
household <- subset(household, as.Date(datetime) %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))

png("plot1.png", width = 480, height = 480)

hist(household$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()
