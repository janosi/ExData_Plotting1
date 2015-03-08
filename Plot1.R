indata<-read.table("household_power_consumption.txt",header=TRUE, sep=";", dec=".",na.strings="?")
shortdata<-indata[which(indata$Date=="1/2/2007" | indata$Date == "2/2/2007"),]
rm(indata)
hist(shortdata$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
dev.copy(png, file="plot1.png")
dev.off()
