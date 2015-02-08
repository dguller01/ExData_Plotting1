
setwd("C:/Coursera/Exploratory Data Analysis/ExData_Plotting1")

##  Read in the full data file

colClasses <- c("character", "character", rep("numeric", 7))
fullData <- read.csv("household_power_consumption.txt", sep = ';', na.strings = "?",
                     colClasses = colClasses,
                     nrows = -1)
fullData$DateTime <- strptime(paste(fullData$Date, fullData$Time), "%d/%m/%Y %H:%M:%S")
fullData <- fullData[,c(10, 3:9)]   ## move DateTime to beginning, get rid of Date and Time

##  Subset only 2007-02-01 and 2007-02-02

subsetDates <- as.Date(c("2007-02-01", "2007-02-02"))
subsetData <- fullData[as.Date(fullData$DateTime) %in% subsetDates,]

##  Replicate plot 3;  plot of all three submetering data by time

png(filename = "plot3.png")

par(bg = "transparent")

with(subsetData, {
     plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
     lines(DateTime, Sub_metering_2, type = "l", col = "red")
     lines(DateTime, Sub_metering_3, type = "l", col = "blue")   
     legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            col = c("black", "red", "blue"), lty = 1)
     })

dev.off()