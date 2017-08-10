# Assignment 1 - plot 1
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
# plot 1
png(file = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
