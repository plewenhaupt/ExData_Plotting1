#Load and clean the dataset
library(dplyr)
library(lubridate)
Powerdata <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
Powerdata$Date <- as.Date(Powerdata$Date, format="%d/%m/%Y")
Powerdata <- filter(Powerdata, Date == "2007-02-01" | Date == "2007-02-02")
Powerdata <- Powerdata %>% mutate(Datetime = paste(Date, Time, sep=" "))
Powerdata <- Powerdata[,c(10, 3:9)]
Powerdata$Datetime <- ymd_hms(Powerdata$Datetime)

#Histogram of GAP
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(Powerdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()

