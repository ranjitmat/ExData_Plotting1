#Plot 4 R code - Extracting the data files from given txt file

elecPowerData<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

#Plot 4 R code - Selecting the data for the given two dates

selectedEPdata<-rbind(elecPowerData[elecPowerData$Date=="1/2/2007",],elecPowerData[elecPowerData$Date=="2/2/2007",])

selectedEPdata$Date<-as.Date(selectedEPdata$Date,"%d/%m/%y")



 #Convert Date to datetime format

selectedEPdata<-cbind(selectedEPdata,"DateTime"=as.POSIXct(paste(selectedEPdata$Date,selectedEPdata$Time)))

#Plotting-4 code

## Create Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(selectedEPdata, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})



## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()


