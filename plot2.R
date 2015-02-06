#############################################################################################
# Plot #2
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

#Plot #2
plot(dataSubSet$Date_Time, dataSubSet$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

#Save PNG file
dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()