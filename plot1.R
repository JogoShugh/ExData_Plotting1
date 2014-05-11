library(data.table)
data <- read.csv(file="household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")
data$Datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
subd <- subset(data, Datetime >= as.POSIXlt("2007-02-01 00:00:00") & Datetime < as.POSIXlt("2007-02-03 00:00:00"))
# OK: returns expected 2880 rows
hist(subd$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.copy(png, file='plot1.png')
dev.off()