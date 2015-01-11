plot1 <- function ()
{
setwd("E:/Sarada/Coursera/DataScience/ExploratoryDataAnalysis/Week1Project")
file1 <- read.csv("household_power_consumption.txt", sep =";")
reqFields <- subset(file1, select = c(Global_active_power), subset=(Date == "1/2/2007" | Date == "2/2/2007")) 
globalActivePower <- as.numeric(as.character(reqFields[,1]))
breaks <- seq(0,max(globalActivePower)+ 0.1 ,0.5)
par(ps=8, pch=14, cex = 1.5, mfrow = c(1,1), cex.lab = 2, cex.axis= 1.5)
hist(globalActivePower, breaks, col = "red", xlab = NA, ylab = NA, main = "", axes=F)
title(main = "Global Active Power", font.main = 2, cex.main = 1.75)
axis(side = 1, tck = -.02, labels = NA, col="black", lwd=1)
axis(side = 2, tck = -.02, labels = NA, col="dark grey", lwd=2)
axis(side = 1, lwd = 0)
axis(side = 2, lwd = 0)
mtext(side = 2, text = "Frequency", line = 3, cex=1.5)
mtext(side = 1, text = "Global Active Power (kilowatts)", line = 3, cex=1.5)
dev.copy(jpeg,filename="plot1.png");
dev.off ();

}

