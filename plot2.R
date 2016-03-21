# household_power_consumption.txt is saved into the current
# directory

data <- read.table("./household_power_consumption.txt", 
        header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#reads data from dates 2007-02-01 and 2007-02-02.
dataDate <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
dataTime <- strptime(paste(dataDate$Date, dataDate$Time, 
            sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dataDate$Global_active_power)

#saves plot2
png("plot2.png", width=480, height=480)
plot(dataTime, globalActivePower, type="l", xlab = " ", 
     ylab="Global Active Power (kilowatts)")

dev.off()
