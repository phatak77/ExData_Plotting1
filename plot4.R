#Read the data
household_power_consumption <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE, dec=".")
#get the subset for the specified dates
hpc_subset <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]
#convert date and time column to date time  format
datetime <- strptime(paste(hpc_subset$Date,hpc_subset$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
#get global active power
active_power_in_kw <- as.numeric(hpc_subset$Global_active_power)

#get submetering data
submetering_1 <- as.numeric(hpc_subset$Sub_metering_1)
submetering_2 <- as.numeric(hpc_subset$Sub_metering_2)
submetering_3 <- as.numeric(hpc_subset$Sub_metering_3)

#get voltage data
voltage <- as.numeric(hpc_subset$Voltage)

#get the global reactive power
global_reactive_power <- as.numeric(hpc_subset$Global_reactive_power)

#set plot area


#plot
png("plot4.png",width=480,height = 480)
par(mfrow = c(2,2))
plot(datetime,active_power_in_kw,type="l",xlab="",ylab = "Global Active Power")
plot(datetime,voltage,type="l",xlab="",ylab="Voltage")
plot(datetime,submetering_1,type="l",xlab="",ylab="Energy sub Metering")
lines(datetime,submetering_2,col="red",type="l",xlab="",ylab="")
lines(datetime,submetering_3,col="blue",type="l",xlab="",ylab="")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=3,bty="n")
plot(datetime,global_reactive_power,type="l",xlab="",ylab="Global Reactive Power")

dev.off()
