data<-read.table("household_power_consumption.txt",header=TRUE,na.strings = "?", sep = ";")
data<-subset(data,Date %in% c("1/2/2007","2/2/2007"))
data$DateTime <- paste(data$Date,data$Time)
data$Date <- NULL
data$Time <- NULL
data <- data[c(8,1:7)]
data$DateTime <- strptime(data$DateTime,"%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png")
plot(data$DateTime,data$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(data$DateTime,data$Sub_metering_1)
lines(data$DateTime,data$Sub_metering_2,col="Red")
lines(data$DateTime,data$Sub_metering_3,col="Blue")
axis(2,pos=c(0,10,20,30))
legend("topright",lty=c(1,1),col=c("Black","Blue","Red"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()