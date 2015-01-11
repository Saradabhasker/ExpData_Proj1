plot3 <- function ()
{
setwd("E:/Sarada/Coursera/DataScience/ExploratoryDataAnalysis/Week1Project")
file1 <- read.csv("household_power_consumption.txt", sep =";")
reqFields <- subset(file1, select = c(Date, Time, Global_active_power, Sub_metering_1,Sub_metering_2, Sub_metering_3 ), subset=(Date == "1/2/2007" | Date == "2/2/2007")) 
dateTime <- paste(as.character(reqFields[,1]), as.character(reqFields[,2]))
metering1 <- as.numeric(as.character(reqFields[,4]))
metering2 <- as.numeric(as.character(reqFields[,5]))
metering3 <- as.numeric(as.character(reqFields[,6]))
dateTime <- strptime(dateTime, format = "%d/%m/%Y %H:%M:%S")
dateRange = c(as.Date(min(dateTime)), as.Date(max(dateTime))+60)
par(ps=8, pch=14, cex = 1.5, mfrow = c(1,1), cex.lab = 2, cex.axis= 1.5, col.axis="gray")
plot(dateTime, metering1, xaxt="n", type="l", col= "black", xlab=NA,ylab=NA)
lines(dateTime, metering2, xaxt="n", type= "l", col="red")
lines(dateTime, metering3, xaxt="n", type= "l", col="blue")
axis(side = 2, tck = -.02, labels = NA, col="dark grey", lwd = 2, col.axis="black")
axis.POSIXct(1,at=seq(dateRange[1], dateRange[2], by = "day"), format="%a", tck = -.02, col="black", lwd=1, col.ticks="black", col.axis="black" )
mtext(side = 2, text = "Energy sub metering", line = 3, cex = 1.5, col="black")
legend("topright", pch=NA,col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, y.intersp=0.75, cex=1.2)

dev.copy(jpeg,filename="plot3.png");
dev.off ();
}


