#plot2.R
library(lubridate)
#library(dplyr)


data1<-read.csv("C:/Users/kostya2/Documents/R/DS/EX/household_power_consumption.txt",
                header = TRUE,sep=";",na.strings = "?", stringsAsFactors = FALSE)

data1$Time<-hms(data1$Time)
data1$Date<-dmy(data1$Date)




dw<-subset(data1, Date >=ymd("2007-02-01") & Date<=ymd("2007-02-02"))


#rm(data1)

plot(dw$Global_active_power,type="o",pch=NA_integer_,
     ylab="Global Active Power (kilowatts)")


