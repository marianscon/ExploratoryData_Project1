# household_power_consumption.txt is saved into the current
# directory

data <- read.table("./household_power_consumption.txt", 
        header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#reads data from dates 2007-02-01 and 2007-02-02.
dataDate <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
dataTime <- strptime(paste(dataDate$Date, dataDate$Time, 
            sep=" "), "%d/%m/%Y %H:%M:%S") 

subMetering1 <- as.numeric(dataDate$Sub_metering_1)
subMetering2 <- as.numeric(dataDate$Sub_metering_2)
subMetering3 <- as.numeric(dataDate$Sub_metering_3)

#saves plot3
png("plot3.png", width=480, height=480)

plot(dataTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dataTime, subMetering2, type="l", col="red")
lines(dataTime, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
      lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()

