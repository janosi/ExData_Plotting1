indata<-read.table("household_power_consumption.txt",header=TRUE, sep=";", dec=".",na.strings="?")
shortdata<-indata[which(indata$Date=="1/2/2007" | indata$Date == "2/2/2007"),]
rm(indata)
dateTime <- strptime(paste(shortdata$Date,shortdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
shortdata$dateTime <- dateTime
with(shortdata,plot(shortdata$dateTime,shortdata$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.copy(png, file="plot2.png")
dev.off()
