data <- read.csv(file="household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")
data$Datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
subd <- subset(data, Datetime >= as.POSIXlt("2007-02-01 00:00:00") & Datetime < as.POSIXlt("2007-02-03 00:00:00"))
# OK: returns expected 2880 rows

png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfcol=c(2,2))

# 1
plot(x=subd$Datetime, y=subd$Global_active_power, ylab="Global Active Power", xlab="", type='n')
lines(x=subd$Datetime, y=subd$Global_active_power)

# 2
plot(x=subd$Datetime, y=subd$Sub_metering_1, ylab="Energy sub metering", xlab="", type='n')
lines(x=subd$Datetime, y=subd$Sub_metering_1)
lines(x=subd$Datetime, y=subd$Sub_metering_2, col="red")
lines(x=subd$Datetime, y=subd$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), cex = 1.00, lty=1, bty='n', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# 3
plot(x=subd$Datetime, y=subd$Voltage, ylab='Voltage', xlab='datetime', type='n')
lines(x=subd$Datetime, y=subd$Voltage)

# 4
plot(x=subd$Datetime, y=subd$Global_reactive_power, ylab='Global_reactive_power', xlab='datetime', type='n')
lines(x=subd$Datetime, y=subd$Global_reactive_power)

# Finish it!
dev.off()