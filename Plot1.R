
#Read the data
household_power_consumption <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE, dec=".")
#convert the date column to the date format
household_power_consumption$Date <- as.Date(household_power_consumption$Date,format="%d/%m/%Y")
#take the subset of the data for the period 2007-02-01 to 2007-02-02
fromDate <- as.Date("01/02/2007","%d/%m/%Y")
toDate <- as.Date("02/02/2007","%d/%m/%Y")
household_power_consumption_subset <- subset(household_power_consumption,household_power_consumption$Date>=fromDate & household_power_consumption$Date<=toDate)
#Get the active power in KW
active_power_in_kw <- as.numeric(household_power_consumption_subset$Global_active_power)

png("plot1.png",width=480,height = 480)
#plot the histogram
hist(active_power_in_kw,col="red",main = "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
