## download the dataset "Electric power consumption" from the intructions webpage 
## on Coursera to the working directory

## read the dataset without the titles
power <- read.table("household_power_consumption.txt",skip=1,sep=";")

## name the variables/columns
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## make a subset of power consumption data
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

## open the PNG device with size 480x480 pixels
png(file = "Plot1.png", width = 480, height = 480, units = "px")

## call the basic plot function (histogram)
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

## annotate the graph with a title
title(main="Global Active Power")

## close the PNG device
dev.off()