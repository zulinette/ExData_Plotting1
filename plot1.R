#############################################################################################
# Plot #1
#############################################################################################

#Loading dataset
fileName<-"./household_power_consumption.txt"
energyUsageData <- read.table(fileName, header = TRUE, sep=";", na.strings="?", 
                              stringsAsFactors=FALSE)

#Selecting data from the dates 2007-02-01 and 2007-02-02
dataSubSet<-energyUsageData[energyUsageData$Date == "1/2/2007" | energyUsageData$Date== "2/2/2007", ]

#Plot 1
hist(dataSubSet$Global_active_power, col= "red", main= "Global Active Power", 
     xlab="Global Active Power (kilowatts)")

#Save PNG file
dev.copy(png, file="Plot1.png", height=480, width=480)
dev.off()
