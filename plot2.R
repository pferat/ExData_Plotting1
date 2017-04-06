## plot2.R
library(readr)

data1 <- read_csv2("household_power_consumption.txt", col_types = "ctnnnnnnn")
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")

# now find indices for dates between Feb 01 and Feb 02 2007

ind <- (data1$Date >= as.Date("2007-02-01") & data1$Date <= as.Date("2007-02-02"))
data2 <- data1[ind,]

bad <- is.na(data2$Global_active_power)
data3 <- data2[!bad,]


# plot2
# generate <datetime> which is a POSIXlt format
datetime <- strptime(paste(as.character(data3$Date), as.character(data3$Time)), "%Y-%m-%d %H:%M:%S")

png(file="plot2.png")
plot(datetime, data3$Global_active_power, type = "l", ylab = "Global Active Power")
dev.off()


