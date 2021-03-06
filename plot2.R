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
EnergyDataSubset$Global_active_power<-as.numeric(as.character(EnergyDataSubset$Global_active_power))

#Open png device, plot and close png device

png("plot2.png", width = 480, height = 480)
plot(EnergyDataSubset$DateTime,EnergyDataSubset$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)
dev.off()
