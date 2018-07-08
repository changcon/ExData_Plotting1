## Read in the Household Power Dataset
EnergyData<-read.table("C:\\Users\\ub67350\\Documents\\householdpower\\household_power_consumption.txt",sep=";",row.names=NULL,header=TRUE)

## Convert Date to Date format and subset to dates between 2/1/2007 and 2/2/2007

EnergyData$Date<-as.Date(as.character(EnergyData$Date),format="%d/%m/%Y")
EnergyDataSubset<-subset(EnergyData,EnergyData$Date<"2007-02-03" & EnergyData$Date >= "2007-02-01")

## Add together Date and Time to get a variable Date-Time
temp<-paste(EnergyDataSubset$Date,EnergyDataSubset$Time)
temp2<-strptime(temp,format="%Y-%m-%d %H:%M:%S")
EnergyDataSubset$DateTime<-temp2

#Convert Global Active Power, Voltage, and Global Reactive power to a numeric
EnergyDataSubset$Global_active_power<-as.numeric(as.character(EnergyDataSubset$Global_active_power))
EnergyDataSubset$Voltage<-as.numeric(as.character(EnergyDataSubset$Voltage))
EnergyDataSubset$Global_reactive_power<-as.numeric(as.character(EnergyDataSubset$Global_reactive_power))

#Convert Sub_metering columns to numeric
EnergyDataSubset$Sub_metering_1<-as.numeric(as.character(EnergyDataSubset$Sub_metering_1))
EnergyDataSubset$Sub_metering_2<-as.numeric(as.character(EnergyDataSubset$Sub_metering_2))
EnergyDataSubset$Sub_metering_3<-as.numeric(as.character(EnergyDataSubset$Sub_metering_3))

#Open png device, plot and close png device

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

#plot 1,1
plot(EnergyDataSubset$DateTime,EnergyDataSubset$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)

#plot 1,2
with(EnergyDataSubset,plot(DateTime,Voltage,type="l"))

#plot 2,1
with(EnergyDataSubset,plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA))
with(EnergyDataSubset,lines(DateTime,Sub_metering_2,type="l",col="red"))
with(EnergyDataSubset,lines(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

#plot 2,2
with(EnergyDataSubset,plot(DateTime,Global_reactive_power,type="l"))

dev.off()
