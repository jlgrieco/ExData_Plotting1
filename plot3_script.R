household <- read.table("household_power_consumption.txt", skip=1, sep=";")


household[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]


household[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


household <- household[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot3.png", width=480, height=480)

# Plot 3
plot(household[, dateTime], household[, Sub_metering_1], type="l", xlab="", ylab="Energy Sub Metering")
lines(household[, dateTime], household[, Sub_metering_2],col="red")
lines(household[, dateTime], household[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))