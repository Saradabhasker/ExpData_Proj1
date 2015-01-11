plot4 <- function ()
{
setwd("E:/Sarada/Coursera/DataScience/ExploratoryDataAnalysis/Week1Project")
file1 <- read.csv("household_power_consumption.txt", sep =";")
reqFields <- subset(file1, select = c(Date, Time, Global_active_power, Global_reactive_power, Voltage, Sub_metering_1,Sub_metering_2, Sub_metering_3 ), subset=(Date == "1/2/2007" | Date == "2/2/2007")) 
dateTime <- paste(as.character(reqFields[,1]), as.character(reqFields[,2]))
globalActivePower <- as.numeric(as.character(reqFields[,3]))
globalReactivePower <- as.numeric(as.character(reqFields[,4]))
voltage <- as.numeric(as.character(reqFields[,5]))
metering1 <- as.numeric(as.character(reqFields[,6]))
metering2 <- as.numeric(as.character(reqFields[,7]))
metering3 <- as.numeric(as.character(reqFields[,8]))

dateTime <- strptime(dateTime, format = "%d/%m/%Y %H:%M:%S")
dateRange = c(as.Date(min(dateTime)), as.Date(max(dateTime))+60)
par(ps=8, pch=14, cex = 1, mfrow = c(2,2), cex.lab = 1, cex.axis= 1)

#first plot
plot(dateTime, globalActivePower, xaxt="n", type="l", xlab=NA,ylab=NA)
axis(side = 2, tck = -.02, labels = NA, lwd = 1)
axis.POSIXct(1,at=seq(dateRange[1], dateRange[2], by = "day"), format="%a", tck = -.02, lwd=1)
mtext(side = 2, text = "Global Active Power (kilowatts)", line = 3, cex = 1)


#second plot voltage
plot(dateTime, voltage, xaxt="n", type="l", xlab=NA,ylab=NA)
axis(side = 2, tck = -.02, labels = NA, lwd = 1)
axis.POSIXct(1,at=seq(dateRange[1], dateRange[2], by = "day"), format="%a", tck = -.02, lwd=1 )
mtext(side = 1, text = "datetime", line = 3, cex = 1)
mtext(side = 2, text = "Voltage", line = 3, cex = 1)

#third plot - metering
plot(dateTime, metering1, xaxt="n", type="l", col= "black", xlab=NA,ylab=NA)
lines(dateTime, metering2, xaxt="n", type= "l", col="red")
lines(dateTime, metering3, xaxt="n", type= "l", col="blue")
axis(side = 2, tck = -.02, labels = NA)
axis.POSIXct(1,at=seq(dateRange[1], dateRange[2], by = "day"), format="%a", tck = -.02, lwd=1)
mtext(side = 2, text = "Energy sub metering", line = 3, cex= 1)
legend("topright", pch=NA, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, y.intersp=0.5)


#fourth plot global reactive power
plot(dateTime, globalReactivePower, xaxt="n", type="l",  xlab=NA,ylab=NA)
axis.POSIXct(1,at=seq(dateRange[1], dateRange[2], by = "day"), format="%a")
mtext(side = 1, text = "datetime", line = 3, cex = 1)
mtext(side = 2, text = "Global_reactive_power", line = 3, cex = 1)



dev.copy(jpeg,filename="plot4.png");
dev.off ();

}