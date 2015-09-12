#plot1.R

data1<-read.csv("C:/Users/kostya2/Documents/R/DS/EX/household_power_consumption.txt",
                header = TRUE,sep=";",na.strings = "?", stringsAsFactors = FALSE)

data1$Date_new<-as.Date(data1$Date,format="%d/%m/%Y")
data1$Date_Time<-paste(data1$Date, data1$Time)
data1$Date_Time<-strptime(data1$Date_Time,"%d/%m/%Y %H:%M:%S")



dw<-subset(data1, Date_new >="2007-02-01" & Date_new<="2007-02-02")



#Plot specific#####above the same for all
#rm(data1)
par(mfrow=c(1,1))

#png(filename=paste0(getwd(),"/Plot1.png"), height=480, width=480, 
#    bg="white")

hist(dw$Global_active_power,col="red",main ="Global Active Power",
     xlab="Global Active Power (kilowatts)") 


dev.copy(png,file="./Plot1.png", height=480, width=480,bg="white")
dev.off()

