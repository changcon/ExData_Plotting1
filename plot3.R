## Read in the Household Power Dataset
EnergyData<-read.table("C:\\Users\\ub67350\\Documents\\householdpower\\household_power_consumption.txt",sep=";",row.names=NULL,header=TRUE)

## Convert Date to Date format and subset to dates between 2/1/2007 and 2/2/2007

EnergyData$Date<-as.Date(as.character(EnergyData$Date),format="%d/%m/%Y")
EnergyDataSubset<-subset(EnergyData,EnergyData$Date<"2007-02-03" & EnergyData$Date >= "2007-02-01")

## Add together Date and Time to get a variable Date-Time
temp<-paste(EnergyDataSubset$Date,EnergyDataSubset$Time)
temp2<-strptime(temp,format="%Y-%m-%d %H:%M:%S")
EnergyDataSubset$DateTime<-temp2

#Convert Global Active Power to a numeric
EnergyDataSubset$Sub_metering_1<-as.numeric(as.character(EnergyDataSubset$Sub_metering_1))
EnergyDataSubset$Sub_metering_2<-as.numeric(as.character(EnergyDataSubset$Sub_metering_2))
EnergyDataSubset$Sub_metering_3<-as.numeric(as.character(EnergyDataSubset$Sub_metering_3))

#Open png device, plot and close png device

png("plot3.png", width = 480, height = 480)

with(EnergyDataSubset,plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA))
with(EnergyDataSubset,lines(DateTime,Sub_metering_2,type="l",col="red"))
with(EnergyDataSubset,lines(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

dev.off()
