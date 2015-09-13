data<-read.table("household_power_consumption.txt",header=TRUE,na.strings = "?", sep = ";")
data<-subset(data,Date %in% c("1/2/2007","2/2/2007"))
data$DateTime <- paste(data$Date,data$Time)
data$Date <- NULL
data$Time <- NULL
data <- data[c(8,1:7)]
data$DateTime <- strptime(data$DateTime,"%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png")
plot(data$DateTime,data$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="n")
lines(data$DateTime,data$Global_active_power)
dev.off()