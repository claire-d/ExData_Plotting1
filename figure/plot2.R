## Read the data, convert the Date and Time variables, subset to the dates 2007-02-01 and 2007-02-02

alldata <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")
alldata$Date <- strptime(alldata$Date, "%d/%m/%Y")
alldata$Date <- as.Date(alldata$Date)
alldata$Time <- paste(alldata$Date,alldata$Time)
alldata$Time <- strptime(alldata$Time, "%Y-%m-%d %H:%M:%S")
data <- alldata[(alldata$Date=="2007-02-01" | alldata$Date=="2007-02-02"), ]

## Generate plot2 and print png file

plot(data$Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, "plot2.png")
dev.off()
