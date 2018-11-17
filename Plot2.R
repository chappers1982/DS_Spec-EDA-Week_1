library(dplyr)


#Import data
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL,"./HPC.zip", method = "curl")

HPC <- read.csv(unz("HPC.zip", "household_power_consumption.txt"), sep=";")

#Fix Dates
HPC$Date_Time <- as.POSIXct(paste(HPC$Date, HPC$Time), format="%d/%m/%Y %H:%M:%S")

#Filter to date range
HPC_filtered <- filter(HPC, Date_Time >="2007-02-01" & Date_Time <"2007-02-03")

#Fix numeric values
HPC_filtered$Global_active_power <- as.numeric(as.character(HPC_filtered$Global_active_power))
HPC_filtered$Global_reactive_power <- as.numeric(as.character(HPC_filtered$Global_reactive_power))
HPC_filtered$Voltage <- as.numeric(as.character(HPC_filtered$Voltage))
HPC_filtered$Sub_metering_1 <- as.numeric(as.character(HPC_filtered$Sub_metering_1))
HPC_filtered$Sub_metering_2 <- as.numeric(as.character(HPC_filtered$Sub_metering_2))
HPC_filtered$Sub_metering_3 <- as.numeric(as.character(HPC_filtered$Sub_metering_3))




#Plot 2
with(HPC_filtered, plot(x = Date_Time, y=Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.copy(png, file = "Plot2.png")
dev.off()

