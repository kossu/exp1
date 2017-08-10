# Assignment 1 - plot 3
#
# load and subset data by date
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") #read datadata$Date <- as.Date(strptime(data$Date, "%d/%m/%Y")) # convert dates & time
d <- data$Date
t <- data$Time
dt <- paste(d,t)
data$Date <- strptime(dt, "%d/%m/%Y %H:%M:%S")
rm(list = c("d", "t", "dt")) # cleanup
data <- data[data$Date >= "2007-02-01 00:00:00" & data$Date <= "2007-02-02 23:59:00",] #subset data (2007-02-01 and 2007-02-02)
na <- is.na(data$Date) # get na's
data <- data[!na,] # drop na's
rm(na) # cleanup
#
# plot 3
png(file = "plot3.png", width = 480, height = 480)
plot(data$Date,data$Sub_metering_1, type="n", pch = ".", xlab = "", ylab = "Energy sub metering")
lines(data$Date,data$Sub_metering_1, col = "black")
lines(data$Date,data$Sub_metering_2, col = "red")
lines(data$Date,data$Sub_metering_3, col = "blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()