#Plot 2 R code - Extracting the data files from given txt file

elecPowerData<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

#Plot 2 R code - Selecting the data for the given two dates

selectedEPdata<-rbind(elecPowerData[elecPowerData$Date=="1/2/2007",],elecPowerData[elecPowerData$Date=="2/2/2007",])

selectedEPdata$Date<-as.Date(selectedEPdata$Date,"%d/%m/%y")



 #Convert Date to datetime format

selectedEPdata<-cbind(selectedEPdata,"DateTime"=as.POSIXct(paste(selectedEPdata$Date,selectedEPdata$Time)))

#Plotting-2 code

plot(selectedEPdata$Global_active_power~selectedEPdata$DateTime,type = "l",xlab="",ylab="Global Active Power (KiloWatts)")



## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


