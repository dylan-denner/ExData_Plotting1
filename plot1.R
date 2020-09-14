########################################################
#
# Dylan Denner
# Exploratory Data Analysis
# Project 1
# 9/14/2020
#
# plot1.R
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


### Creating Plot
png(filename="plot1.png")
hist(date_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()