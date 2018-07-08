## Read in the Household Power Dataset
EnergyData<-read.table("C:\\Users\\ub67350\\Documents\\householdpower\\household_power_consumption.txt",sep=";",row.names=NULL,header=TRUE)

## Convert Date to Date format and subset to dates between 2/1/2007 and 2/2/2007

EnergyData$Date<-as.Date(as.character(EnergyData$Date),format="%d/%m/%Y")
EnergyDataSubset<-subset(EnergyData,EnergyData$Date<"2007-02-03" & EnergyData$Date >= "2007-02-01")

#Convert Global Active Power to a numeric
EnergyDataSubset$Global_active_power<-as.numeric(as.character(EnergyDataSubset$Global_active_power))

#Open png device, plot and close png device

png("plot1.png", width = 480, height = 480)
hist(EnergyDataSubset$Global_active_power,breaks=12,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
