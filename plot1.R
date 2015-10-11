library(dplyr)

library(lubridate)

pwrDF <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings=c("?",""))

pwrTBL <- tbl_df(pwrDF)

pwrTBL$Date <- as.Date(pwrTBL$Date, format= "%d/%m/%Y")

pwrTBL2Dates <- filter(pwrTBL, Date == "2007-02-01" | Date == "2007-02-02")
pwrNewTBL <- pwrTBL2Dates

png("./plot1.png", width=480, height=480)
hist(pwrNewTBL$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()



