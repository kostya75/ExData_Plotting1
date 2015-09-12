#plot3.R
library(lubridate)
#library(dplyr)


data1<-read.csv("C:/Users/kostya2/Documents/R/DS/EX/household_power_consumption.txt",
                header = TRUE,sep=";",na.strings = "?", stringsAsFactors = FALSE)

data1$Time<-hms(data1$Time)
data1$Date<-dmy(data1$Date)




dw<-subset(data1, Date >=ymd("2007-02-01") & Date<=ymd("2007-02-02"))
plot_colors <- c("black","red","blue")
plot(dw$Sub_metering_1,type="o",pch=NA_integer_,
     ylab="Energy sub metering",col=plot_colors[1])

lines(dw$Sub_metering_2,type="o",pch=NA_integer_, col=plot_colors[2])
lines(dw$Sub_metering_3,type="o",pch=NA_integer_, col=plot_colors[3])

legend("topright",legend=names(dw)[grep("Sub",names(dw),ignore.case = TRUE)],
       col=plot_colors,cex=1,lty=c(1,1,1))
