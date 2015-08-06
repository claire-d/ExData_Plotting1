## Read the data, convert the Date and Time variables, subset to the dates 2007-02-01 and 2007-02-02

alldata <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")
alldata$Date <- strptime(alldata$Date, "%d/%m/%Y")
alldata$Date <- as.Date(alldata$Date)
alldata$Time <- paste(alldata$Date,alldata$Time)
alldata$Time <- strptime(alldata$Time, "%Y-%m-%d %H:%M:%S")
data <- alldata[(alldata$Date=="2007-02-01" | alldata$Date=="2007-02-02"), ]

## Generate plot3 and print png file

plot(data$Time, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, type="l", col="red")
lines(data$Time, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)
dev.copy(png, "plot3.png")
dev.off()
