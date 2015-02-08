
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

##  Replicate plot 1;  histogram of global active power

png(filename = "plot1.png")

par(bg = "transparent")

hist(subsetData$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()