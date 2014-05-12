data <- read.csv(file="household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")
data$Datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
subd <- subset(data, Datetime >= as.POSIXlt("2007-02-01 00:00:00") & Datetime < as.POSIXlt("2007-02-03 00:00:00"))
# OK: returns expected 2880 rows
png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(x=subd$Datetime, y=subd$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type='n')
lines(x=subd$Datetime, y=subd$Global_active_power)

dev.off()