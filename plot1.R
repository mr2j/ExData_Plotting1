# PLOT1.R

# UNZIP THIS DATA INTO WORKING DIRECTORY https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# FILE TO BE USED IS "household_power_consumption.txt"

# INSTALL LUBRIDATE PACKAGE FOR DATES
install.packages("lubridate")
library(lubridate)

# READ DATA
data <- read.csv("./household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

# CHANGE DATE COLUMN TO DATE FORMAT
data$Date <- dmy(data$Date)

# REDUCE THE DATA TO ONLY DATES USED
data2 <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# CREATE PNG GRAPHICS DEVICE
png("plot1.png", width = 480, height = 480)

# PLOT DATA
with(data2, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

# TURN OFF GRAPHICS DEVICE
dev.off()