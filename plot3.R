# read in the data
data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# look at the data
head(data)
str(data)

# Create a date time combined column 
data["datTime"] <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# subset the data
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
str(subdata)

# Plot 3
plot(subdata$Sub_metering_1 ~ subdata$datTime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(subdata$Sub_metering_2 ~ subdata$datTime, type = "l", ylab = "", xlab = "", col = "red")
lines(subdata$Sub_metering_3 ~ subdata$datTime, type = "l", ylab = "", xlab = "", col = "blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","red", "blue"),lty=c(1,1,1))
dev.copy(png,'plot3.png', width=480, height=480, units='px')
dev.off()
