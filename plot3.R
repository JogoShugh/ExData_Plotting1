data <- read.csv(file="household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")
data$Datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
subd <- subset(data, Datetime >= as.POSIXlt("2007-02-01 00:00:00") & Datetime < as.POSIXlt("2007-02-03 00:00:00"))
# OK: returns expected 2880 rows
png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(x=subd$Datetime, y=subd$Sub_metering_1, ylab="Energy sub metering", xlab="", type='n')
lines(x=subd$Datetime, y=subd$Sub_metering_1)
lines(x=subd$Datetime, y=subd$Sub_metering_2, col="red")
lines(x=subd$Datetime, y=subd$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), cex = 0.95, lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()