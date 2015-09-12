#plot2.R

data1<-read.csv("./household_power_consumption.txt",
                header = TRUE,sep=";",na.strings = "?", stringsAsFactors = FALSE)

data1$Date_new<-as.Date(data1$Date,format="%d/%m/%Y")
data1$Date_Time<-paste(data1$Date, data1$Time)
data1$Date_Time<-strptime(data1$Date_Time,"%d/%m/%Y %H:%M:%S")



dw<-subset(data1, Date_new >="2007-02-01" & Date_new<="2007-02-02")

#Plot specific#####above the same for all

#rm(data1)
par(mfrow=c(1,1))

#initialize the plot area. supress annotation
plot(dw$Date_Time,dw$Global_active_power,type="n",ann=FALSE)
#add lines
lines(dw$Date_Time,dw$Global_active_power,type="o",pch=NA_integer_)
#add ylab title only
title(ylab="Global Active Power (kilowatts)")

#Save Plot to file
dev.copy(png,file="./Plot2.png", height=480, width=480,bg="white")
dev.off()