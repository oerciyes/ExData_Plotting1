#HPC-Plot 2
HPC<-read.delim("household_power_consumption.txt",header=T,sep=";",na.strings="?")
summary(HPC)
str(HPC)
HPC1 <- subset(HPC, Date=="1/2/2007"|Date =="2/2/2007")
summary(HPC1)
str(HPC1)

HPC1$Global_active_power <- as.numeric(as.character(HPC1$Global_active_power))
HPC1$day <- as.POSIXct(strptime(paste(HPC1$Date,HPC1$Time), " %d/%m/%Y %H:%M:%S", tz="EST"))
png(filename="Plot2.png",width=480,height=480)
plot(HPC1$day, HPC1$Global_active_power, type="l",xlab="", ylab ="Global Active Power (kilowatts)")
dev.off()
