########################################################
#
# Dylan Denner
# Exploratory Data Analysis
# Project 1
# 9/14/2020
#
# plot4.R
#
########################################################

### Downloading the data

# #data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# #destfile <- "C:/Users/dylan/Documents/R/datasciencecoursera/expdataAnalysis/ExData_Plotting1/household_power_consumption.txt"
# #download.file(data_url, destfile)
# 
# 

### Creating table
rawdata <- read.table("household_power_consumption.txt", header = TRUE, 
                      sep = ";", na.strings = "?")

### Setting column names as given in assignment
names(rawdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
date_data <- subset(rawdata,rawdata$Date=="1/2/2007" | rawdata$Date =="2/2/2007")

### Setting format of Data and Time for plotting
date_data$Time <- strptime(date_data$Time, format="%H:%M:%S")
date_data$Date <- as.Date(date_data$Date, format="%d/%m/%Y")


### Creating Plot
png(filename="plot4.png")
par(mfrow = c(2, 2))
plot(date_data$Time, date_data$Global_active_power, type = "l", ylab = "Global Active Power", 
     xlab = "")
plot(date_data$Time, date_data$Voltage, type = "l", xlab = "dateTime", ylab = "Voltage")
plot(date_data$Time, date_data$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
     xlab = "")
lines(date_data$Time, date_data$Sub_metering_2, col = "Red")
lines(date_data$Time, date_data$Sub_metering_3, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

plot(date_data$Time, date_data$Global_reactive_power, type = "l", ylab = "Global reactive power", xlab = "dateTime")
dev.off()