indata<-read.table("household_power_consumption.txt",header=TRUE, sep=";", dec=".",na.strings="?")
shortdata<-indata[which(indata$Date=="1/2/2007" | indata$Date == "2/2/2007"),]
rm(indata)
dateTime <- strptime(paste(shortdata$Date,shortdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
shortdata$dateTime <- dateTime
with(shortdata,	plot(shortdata$dateTime,shortdata$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering"))
lines(shortdata$dateTime, shortdata$Sub_metering_2,type="l",col="red")
lines(shortdata$dateTime, shortdata$Sub_metering_3,type="l",col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png")
dev.off()
