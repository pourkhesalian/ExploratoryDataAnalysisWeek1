#Peer-graded Assignment: Course Project 1
#Exploratory Data Analysis Week 1 Course Project 1 Prev
#By: Ali Pourkhesalian
#
#
#
#loading libraries
library(data.table)
library(dplyr)
library(lubridate)
#downloading the data
file.url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
if (!file.exists('household_power_consumption.zip')){download.file(file.url, destfile = 'household_power_consumption.zip')}
if (!file.exists('household_power_consumption.txt')){unzip('household_power_consumption.zip')}
column.names <- colnames(fread(file ='household_power_consumption.txt', nrows = 1))
all.data<- fread(na.strings = '?', file ='household_power_consumption.txt', nrows = 5000, skip = 66000 )
colnames(all.data)<- column.names
#all.data$Date<- dmy(all.data$Date)
all.data$Time<- ymd_hms(paste(dmy(all.data$Date),all.data$Time))
all.data<- filter(all.data,dmy(all.data$Date)==ymd("2007-02-01")|dmy(all.data$Date)==ymd("2007-02-02"))
head(all.data)
png(filename = "plot2.png",
    width = 480, height = 480)
plot(x= all.data$Time, 
     y=all.data$Global_active_power,
     type = 'l',
     ylab = 'Global Active Power (Kilowatts)',
     xlab = '')
dev.off()
