#HPC-Plot 4
HPC<-read.delim("household_power_consumption.txt",header=T,sep=";",na.strings="?")
summary(HPC)
str(HPC)
HPC1 <- subset(HPC, Date=="1/2/2007"|Date =="2/2/2007")
summary(HPC1)
str(HPC1)

HPC1$Sub_metering_1 <- as.numeric(as.character(HPC1$Sub_metering_1))
HPC1$Sub_metering_2 <- as.numeric(as.character(HPC1$Sub_metering_2))
HPC1$Sub_metering_3 <- as.numeric(as.character(HPC1$Sub_metering_3))
HPC1$day <- as.POSIXct(strptime(paste(HPC1$Date,HPC1$Time), " %d/%m/%Y %H:%M:%S", tz="EST"))
HPC1$Global_active_power <- as.numeric(as.character(HPC1$Global_active_power))
HPC1$Global_reactive_power <- as.numeric(as.character(HPC1$Global_reactive_power))
HPC1$Voltage <- as.numeric(as.character(HPC1$Voltage))
png(filename="Plot4.png",width=480,height=480)
par(mfrow=c(2,2))

#Plot1
plot(HPC1$day, HPC1$Global_active_power, type="l", ylab ="Global Active Power (kilowatts)")

#Plot2
plot(HPC1$day, HPC1$Voltage, type="l",xlab="datetime", ylab ="Voltage")

#Plot 3
plot(HPC1$day,HPC1$Sub_metering_1,xlab="", ylab="Energy sub metering", type= "n")
lines(HPC1$day, HPC1$Sub_metering_1, type="l", col="black")
lines(HPC1$day, HPC1$Sub_metering_2, type="l", col="red")
lines(HPC1$day, HPC1$Sub_metering_3, type="l", col="blue")

legend("topright",lty=1, col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

#Plot4
plot(HPC1$day, HPC1$Global_reactive_power, type="l",xlab="datetime", ylab ="Global_reactive_power")

dev.off()
