library(dplyr)

library(lubridate)

pwrDF <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings=c("?",""))

pwrTBL <- tbl_df(pwrDF)

pwrTBL$Date <- as.Date(pwrTBL$Date, format= "%d/%m/%Y")

pwrTBL2Dates <- filter(pwrTBL, Date == "2007-02-01" | Date == "2007-02-02")
pwrNewTBL <- pwrTBL2Dates

pwrNewTBL$tmpDtTime <- paste(pwrNewTBL$Date, pwrNewTBL$Time)
pwrNewTBL$Time <- strptime(pwrNewTBL$tmpDtTime, format = "%Y-%m-%d %H:%M:%S")


# setting the width and height for the png

png("./plot4.png", width=480, height=480)

opt = par(mfrow = c(2,2))
# first row first col plot
with (pwrNewTBL, plot(Time, Global_active_power, type = "l", xlab="", ylab="y"))

# first row second column plot
with (pwrNewTBL, plot(Time, Voltage, type = "l", xlab="datetime", ylab="Voltage"))

# second row first column plot

with (pwrNewTBL, plot(Time, Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering"))
with (pwrNewTBL, lines (Time, Sub_metering_2, type = "l", xlab="", col="red"))
with (pwrNewTBL, lines (Time, Sub_metering_3, type = "l", xlab="", col="blue"))

# second row second columns plot
with (pwrNewTBL, plot(Time, Global_reactive_power, type = "l", xlab="datetime"))

par(opt)

dev.off()



