## plot1.R
library(readr)

data1 <- read_csv2("household_power_consumption.txt", col_types = "ctnnnnnnn")
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")

# now find indices for dates between Feb 01 and Feb 02 2007

ind <- (data1$Date >= as.Date("2007-02-01") & data1$Date <= as.Date("2007-02-02"))

data2 <- data1[ind,]
bad <- data2$Global_active_power=='?'
data3 <- data2[!bad,]

# generate <datetime> which is a POSIXlt format
datetime <- strptime(paste(as.character(data3$Date), as.character(data3$Time)), "%Y-%m-%d %H:%M:%S")

png(file="plot4.png")
# plot 4
par(mfrow=c(2,2), mar=c(2,2,2,2))
plot(datetime, data3$Global_active_power, type = "l", ylab = "Global Active Power")
plot(datetime, data3$Voltage, type = "l")
plot(datetime, data2$Sub_metering_1, ylim=range(c(data2$Sub_metering_1,data2$Sub_metering_2,data2$Sub_metering_3)), main='Energy sub metering', col='red', type = 'l')
lines(datetime, data2$Sub_metering_2, col='green')
lines(datetime, data2$Sub_metering_3, col='blue')
legend("topright","(x,y)",legend = c("Sub_metering1","Sub_metering2","Sub_metering3"), lty = c(1,1,1), col= c("red","green","blue"))
plot(datetime,data3$Global_reactive_power, type = "l")

dev.off()