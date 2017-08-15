# PLOT2.R

# READ DATA
data <- read.csv("./household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

# CHANGE DATE COLUMN TO DATE FORMAT
data$Date <- dmy(data$Date)

# REDUCE THE DATA TO ONLY DATES USED
data2 <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# CONSTRUCT NEW DATETIME VARIABLE
datetime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

# EXTRACT GLOBAL ACTIVE POWER
globalactivepower <- as.numeric(data2$Global_active_power)

# CREATE PNG GRAPHICS DEVICE
png("plot2.png", width = 480, height = 480)

# PLOT DATA
plot(datetime, globalactivepower, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

# TURN OFF GRAPHICS DEVICE
dev.off()


