#HPC-Plot 1
HPC<-read.delim("household_power_consumption.txt",header=T,sep=";",na.strings="?")
summary(HPC)
str(HPC)
HPC1 <- subset(HPC, Date=="1/2/2007"|Date =="2/2/2007")
summary(HPC1)
str(HPC1)

HPC1$Global_active_power <- as.numeric(HPC1$Global_active_power)
png(filename="Plot1.png",width=480,height=480)
hist(HPC1$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
