#plot1.R
library(lubridate)

#C:/Users/kostya2/Documents/R/DS/EX
data1<-read.csv("C:/Users/kostya2/Documents/R/DS/EX/household_power_consumption.txt",
                header = TRUE,sep=";",na.strings = "?", stringsAsFactors = FALSE)

data1$Time<-hms(data1$Time)
data1$Date<-dmy(data1$Date)

data_work<- subset(data1, Date >= mdy("02/01/2007") & Date <= mdy("02/02/2007")) 
rm(data1)

