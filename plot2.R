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

# Plot 2
plot(subdata$Global_active_power ~ subdata$datTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png,'plot2.png', width=480, height=480, units='px')
dev.off()
