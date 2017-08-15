# PLOT3.R

# READ DATA
data <- read.csv("./household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

# CHANGE DATE COLUMN TO DATE FORMAT
data$Date <- dmy(data$Date)

# REDUCE THE DATA TO ONLY DATES USED
data2 <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# CONSTRUCT NEW DATETIME VARIABLE
datetime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

# EXTRACT SUB METERING VARIABLES
sub_metering_1 <- as.numeric(data2$Sub_metering_1)
sub_metering_2 <- as.numeric(data2$Sub_metering_2)
sub_metering_3 <- as.numeric(data2$Sub_metering_3)

# CREATE PNG GRAPHICS DEVICE
png("plot3.png", width = 480, height = 480)

# PLOT DATA
plot(datetime, sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, sub_metering_2, type = "l", col = "red")
lines(datetime, sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# TURN OFF GRAPHICS DEVICE
dev.off()
