#plot1.R
library(lubridate)
library(dplyr)


data1<-read.csv("C:/Users/kostya2/Documents/R/DS/EX/household_power_consumption.txt",
                header = TRUE,sep=";",na.strings = "?", stringsAsFactors = FALSE)

data1$Time<-hms(data1$Time)
data1$Date<-dmy(data1$Date)




dw<-subset(data1, Date >=ymd("2007-02-01") & Date<=ymd("2007-02-02"))
#dw<-mutate(dw, agpKW=Global_reactive_power*10)
rm(data1)


hist(dw$Global_active_power,col="red",main ="Global Active Power",
     xlab="Global Active Power (kilowatts)") 