#plot4.R

data1<-read.csv("C:/Users/kostya2/Documents/R/DS/EX/household_power_consumption.txt",
                header = TRUE,sep=";",na.strings = "?", stringsAsFactors = FALSE)

data1$Date_new<-as.Date(data1$Date,format="%d/%m/%Y")
data1$Date_Time<-paste(data1$Date, data1$Time)
data1$Date_Time<-strptime(data1$Date_Time,"%d/%m/%Y %H:%M:%S")



dw<-subset(data1, Date_new >="2007-02-01" & Date_new<="2007-02-02")

#Plot specific#####above the same for all
#rm(data1)

#Initialize png device
png(filename="./Plot4.png", height=480, width=480, 
    bg="white") 


#set grid
par(mfrow=c(2,2)) 
#change order to match assignment without reshuffeling code
layout(matrix(c(1, 3, 2, 4), byrow=TRUE, ncol=2))

#plotA Plot2 initial

    #initialize the plot area. supress annotation
    plot(dw$Date_Time,dw$Global_active_power,type="n",ann=FALSE)
    #add lines
    lines(dw$Date_Time,dw$Global_active_power,type="o",pch=NA_integer_)
    #add ylab title only
    title(ylab="Global Active Power")


#plotB Plot3 initial
    #vector of colours
    plot_colors <- c("black","red","blue")
    
    #initialize plot area
    plot(dw$Date_Time,dw$Sub_metering_1,type="n",ann=FALSE)
    
    #add lines
    lines(dw$Date_Time,dw$Sub_metering_1,type="o",pch=NA_integer_, col=plot_colors[1])
    lines(dw$Date_Time,dw$Sub_metering_2,type="o",pch=NA_integer_, col=plot_colors[2])
    lines(dw$Date_Time,dw$Sub_metering_3,type="o",pch=NA_integer_, col=plot_colors[3])
    
    #add legend
    legend("topright",legend=names(dw)[grep("Sub",names(dw),ignore.case = TRUE)],
           col=plot_colors,cex=.75,lty=c(1,1,1),box.lty =0 )
    box()
    
    title(ylab="Energy sub metering")

#plotC
        plot(dw$Date_Time,dw$Voltage,type="o",pch=NA_integer_,
             xlab="datetime",ylab="Voltage")

#plotD
    plot(dw$Date_Time,dw$Global_reactive_power,type="o",pch=NA_integer_,
         xlab="datetime",ylab="Global_reactive_power")

dev.off()

