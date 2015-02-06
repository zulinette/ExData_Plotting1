#############################################################################################
# Plot #3
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

#Constructing and saving Plot #3
png(file="Plot3.png", height=480, width=480)

with(dataSubSet, {plot(Date_Time, Sub_metering_1, type="l", xlab="", 
                       ylab="Energy sub metering")
                  lines(Date_Time, Sub_metering_2, col = "red")
                  lines(Date_Time, Sub_metering_3, col = "blue")
                  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                         col=c("black", "red", "blue"), lty=1)})
dev.off()
