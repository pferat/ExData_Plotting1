## plot1.R
library(readr)

data1 <- read_csv2("household_power_consumption.txt", col_types = "ctnnnnnnn")
# all data fields will be coersed into a numeric, some entries will be NA; will filter those later
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")

# now find indices for dates between Feb 01 and Feb 02 2007

ind <- (data1$Date >= as.Date("2007-02-01") & data1$Date <= as.Date("2007-02-02"))
data2 <- data1[ind,]

# now remove all of the NA
bad <- is.na(data2$Global_active_power)
data3 <- data2[!bad,]

png(file="plot1.png")
# plot1
hist(data3$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power", ylab = "Frequency")
dev.off()
