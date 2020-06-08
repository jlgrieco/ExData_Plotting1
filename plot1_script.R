#Plot 1
household <- read.table("household_power_consumption.txt", skip=1, sep=";")
names(household) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(household, household$Date=="1/2/2007" | household$Date =="2/2/2007")
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")