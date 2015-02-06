#############################################################################################
# Plot #4
#############################################################################################

#Loading dataset
fileName<-"./household_power_consumption.txt"
energyUsageData <- read.table(fileName, header = TRUE, sep=";", na.strings="?", 
                              stringsAsFactors=FALSE)

#Selecting data from the dates 2007-02-01 and 2007-02-02
dataSubSet<-energyUsageData[energyUsageData$Date == "1/2/2007" | energyUsageData$Date== "2/2/2007", ]

#Merging Date and Time variables and convert it to date/time
dateTime<-paste(dataSubSet$Date, dataSubSet$Time, sep=" ")
dataSubSet$Date_Time<- as.POSIXct(dateTime, format="%d/%m/%Y %H:%M:%S")

#Constructing and saving Plot #4
png(file="Plot4.png", height=480, width=480)

par(mfrow = c(2, 2))
with(dataSubSet, {plot(Date_Time, Global_active_power, type="l", xlab="", 
                       ylab="Global Active Power")
                  plot(Date_Time, Voltage, type="l", xlab="datetime", 
                       ylab="Voltage")
                  plot(Date_Time, Sub_metering_1, type="l", xlab="", 
                       ylab="Energy sub metering")
                  lines(Date_Time, Sub_metering_2, col = "red")
                  lines(Date_Time, Sub_metering_3, col = "blue")
                  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                         col=c("black", "red", "blue"), lty=1, bty="n")
                  plot(Date_Time, Global_reactive_power, type="l", xlab="datetime", 
                       ylab="Global_reactive_power")
                  })
dev.off()