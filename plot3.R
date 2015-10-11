library(dplyr)

library(lubridate)

pwrDF <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings=c("?",""))

pwrTBL <- tbl_df(pwrDF)

pwrTBL$Date <- as.Date(pwrTBL$Date, format= "%d/%m/%Y")

pwrTBL2Dates <- filter(pwrTBL, Date == "2007-02-01" | Date == "2007-02-02")
pwrNewTBL <- pwrTBL2Dates

pwrNewTBL$tmpDtTime <- paste(pwrNewTBL$Date, pwrNewTBL$Time)
pwrNewTBL$Time <- strptime(pwrNewTBL$tmpDtTime, format = "%Y-%m-%d %H:%M:%S")



png("./plot3.png", width=480, height=480)

with (pwrNewTBL, plot(Time, Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering"))
with (pwrNewTBL, lines (Time, Sub_metering_2, type = "l", xlab="", col="red"))
with (pwrNewTBL, lines (Time, Sub_metering_3, type = "l", xlab="", col="blue"))

legend ("topr", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),  lty=c(1,1), 
                               lwd=c(2.5,2.5), col = c("black", "red", "blue"))

dev.off()



