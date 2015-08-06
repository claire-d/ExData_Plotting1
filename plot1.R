## Read the data, convert the Date and Time variables, subset to the dates 2007-02-01 and 2007-02-02

alldata <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")
alldata$Date <- strptime(alldata$Date, "%d/%m/%Y")
alldata$Date <- as.Date(alldata$Date)
alldata$Time <- paste(alldata$Date,alldata$Time)
alldata$Time <- strptime(alldata$Time, "%Y-%m-%d %H:%M:%S")
data <- alldata[(alldata$Date=="2007-02-01" | alldata$Date=="2007-02-02"), ]

## Generate plot1 and print png file

hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="red")
dev.copy(png, "plot1.png")
dev.off()

