# household_power_consumption.txt is saved into the current
# directory

data <- read.table("./household_power_consumption.txt", 
        header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataDate <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
dataTime <- strptime(paste(dataDate$Date, dataDate$Time, 
            sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(dataDate$Global_active_power)
globalReactivePower <- as.numeric(dataDate$Global_reactive_power)
voltage <- as.numeric(dataDate$Voltage)
subMetering1 <- as.numeric(dataDate$Sub_metering_1)
subMetering2 <- as.numeric(dataDate$Sub_metering_2)
subMetering3 <- as.numeric(dataDate$Sub_metering_3)

#saves plot4
png("plot4.png", width=480, height=480)

#4 plots in 1!
par(mfrow = c(2, 2)) 

#plot 1
plot(dateTime, globalActivePower, type="l", xlab="", 
     ylab="Global Active Power", cex=0.5)

#plot2
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

#plot3
plot(dateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#plot4
plot(dateTime, globalReactivePower, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()
