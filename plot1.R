#Plot 1 R code - Extracting the data files from given txt file

elecPowerData<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

#Plot 1 R code - Selecting the data for the given two dates

selectedEPdata<-rbind(elecPowerData[elecPowerData$Date=="1/2/2007",],elecPowerData[elecPowerData$Date=="2/2/2007",])

selectedEPdata$Date<-as.Date(selectedEPdata$Date,"%d/%m/%y")



selectedEPdata<-cbind(selectedEPdata,"DateTime"=as.POSIXct(paste(selectedEPdata$Date,selectedEPdata$Time)))

#Plotting-1 code
hist(as.numeric(selectedEPdata$Global_active_power),col="Red",main="Global Active Power",xlab="Global Active Power (KiloWatts)",ylab="Frequency")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
