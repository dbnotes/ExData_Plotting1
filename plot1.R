library(dplyr)

# Set working directory
getwd()
# If necessary:
# setwd("/../../ExData_Plotting1")

# Download the files to a data directory
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/household_power_consumption.zip")

# Unzip dataSet to the data directory
unzip(zipfile="./data/household_power_consumption.zip",exdir="./data")
# calculate memory: 2075259*9*8 (rows*cols*8bytes)/(1024*1024 for MB) is approx 142 MB

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

# Plot 1
hist(subdata$Global_active_power,col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png,'plot1.png', width=480, height=480, units='px')
dev.off()
