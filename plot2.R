library(dplyr)

library(lubridate)

pwrDF <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings=c("?",""))

pwrTBL <- tbl_df(pwrDF)

pwrTBL$Date <- as.Date(pwrTBL$Date, format= "%d/%m/%Y")

pwrTBL2Dates <- filter(pwrTBL, Date == "2007-02-01" | Date == "2007-02-02")
pwrNewTBL <- pwrTBL2Dates

tmpDtTime <- paste(pwrNewTBL$Date, pwrNewTBL$Time)
pwrNewTBL$Time <- strptime(tmpDtTime, format = "%Y-%m-%d %H:%M:%S")



png("./plot2.png", width=480, height=480)

with (pwrNewTBL, plot(Time, Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()



