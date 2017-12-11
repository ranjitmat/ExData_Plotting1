#Plot 3 R code - Extracting the data files from given txt file

elecPowerData<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

#Plot 3 R code - Selecting the data for the given two dates

selectedEPdata<-rbind(elecPowerData[elecPowerData$Date=="1/2/2007",],elecPowerData[elecPowerData$Date=="2/2/2007",])

selectedEPdata$Date<-as.Date(selectedEPdata$Date,"%d/%m/%y")



 #Convert Date to datetime format

selectedEPdata<-cbind(selectedEPdata,"DateTime"=as.POSIXct(paste(selectedEPdata$Date,selectedEPdata$Time)))

#Plotting-3 code

with(selectedEPdata,{plot(selectedEPdata$Sub_metering_1~DateTime,type = "l",xlab="",ylab="Energy Sub Metering")})
lines(selectedEPdata$Sub_metering_2 ~ selectedEPdata$DateTime,col="Red")
lines(selectedEPdata$Sub_metering_3 ~ selectedEPdata$DateTime,col="Blue")
legend("topright", lty=1,lwd=3,col=c("black","red","blue"),legend("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
       
     

