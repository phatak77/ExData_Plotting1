#Read the data
household_power_consumption <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE, dec=".")
#get the subset for the specified dates
hpc_subset <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]
#convert date and time column to date time  format
datetime <- strptime(paste(hpc_subset$Date,hpc_subset$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
#get the global active power
active_power_in_kw <- as.numeric(hpc_subset$Global_active_power)
#plot
png("plot2.png",width=480,height = 480)
plot(datetime,active_power_in_kw,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
