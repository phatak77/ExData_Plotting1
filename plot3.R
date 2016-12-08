#Read the data
household_power_consumption <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE, dec=".")
#get the subset for the specified dates
hpc_subset <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]
#convert date and time column to date time  format
datetime <- strptime(paste(hpc_subset$Date,hpc_subset$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

#get sub metering data
submetering_1 <- as.numeric(hpc_subset$Sub_metering_1)
submetering_2 <- as.numeric(hpc_subset$Sub_metering_2)
submetering_3 <- as.numeric(hpc_subset$Sub_metering_3)
#plot
png("plot3.png",width=480,height = 480)
plot(datetime,submetering_1,type="l",xlab="",ylab="Energy sub Metering")
lines(datetime,submetering_2,col="red",type="l",xlab="",ylab="")
lines(datetime,submetering_3,col="blue",type="l",xlab="",ylab="")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=3)
dev.off()
