indata<-read.table("household_power_consumption.txt",header=TRUE, sep=";", dec=".",na.strings="?")
shortdata<-indata[which(indata$Date=="1/2/2007" | indata$Date == "2/2/2007"),]
rm(indata)
dateTime <- strptime(paste(shortdata$Date,shortdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
shortdata$dateTime <- dateTime
par(mfrow=c(2,2))
with(shortdata,{
	plot(shortdata$dateTime,shortdata$Global_active_power,type="l", xlab="", ylab="Global Active Power")

	plot(shortdata$dateTime,shortdata$Voltage,type="l", xlab="datetime", ylab="Voltage")

	plot(shortdata$dateTime,shortdata$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
	lines(shortdata$dateTime, shortdata$Sub_metering_2,type="l",col="red")
	lines(shortdata$dateTime, shortdata$Sub_metering_3,type="l",col="blue")
	legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	
	plot(shortdata$dateTime,shortdata$Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power")

})
dev.copy(png, file="plot4.png")
dev.off()
