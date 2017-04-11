#Load and clean the dataset
Sys.setlocale(category = "LC_ALL", locale = "english") #Change locale for correct labeling. 
library(dplyr)
library(lubridate)
Powerdata <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
Powerdata$Date <- as.Date(Powerdata$Date, format="%d/%m/%Y")
Powerdata <- filter(Powerdata, Date == "2007-02-01" | Date == "2007-02-02")
Powerdata <- Powerdata %>% mutate(Datetime = paste(Date, Time, sep=" "))
Powerdata <- Powerdata[,c(10, 3:9)]
Powerdata$Datetime <- ymd_hms(Powerdata$Datetime)


#Plot GAPxSub_metering
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(Powerdata$Datetime, Powerdata$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy Sub-Metering")
lines(Powerdata$Datetime, Powerdata$Sub_metering_2, col = "red")
lines(Powerdata$Datetime, Powerdata$Sub_metering_3, col = "blue")
dev.off()