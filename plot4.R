## download the dataset "Electric power consumption" from the intructions webpage 
## on Coursera to the working directory

## read the dataset without the titles
power <- read.table("household_power_consumption.txt",skip=1,sep=";")

## name the variables/columns
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## make a subset of power consumption data
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

## translate labels in English
Sys.setlocale("LC_ALL", "English")

## transform the variables 'Date' and 'Time' from characters into objects of type Date and POSIXlt respectively
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

## open the PNG device with size 480x480 pixels
png(file = "Plot4.png", width = 480, height = 480, units = "px")

## initiate four plots into a 2x2 matrix plot (row wise)
par(mfrow=c(2,2))

## call the basic plot function that calls different plot functions to build the four plots that form the matrix plot
with(subpower,{
      plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
      plot(subpower$Time,as.numeric(as.character(subpower$Voltage)), type="l",xlab="datetime",ylab="Voltage")
      plot(subpower$Time,subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
      with(subpower,lines(Time,as.numeric(as.character(Sub_metering_1)),col="black"))
      with(subpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
      with(subpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
      legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.9, bty="n")
      plot(subpower$Time,as.numeric(as.character(subpower$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

## close the PNG device
dev.off()