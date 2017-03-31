##read in the file 
data_full <- read.csv("~/Documents/Coursera/Working Directory/ExploreData/household_power_consumption.txt", sep = ';', na.strings="?", header=T, nrows=2075259, 
                      check.names=F, stringsAsFactors=F)

##covert the date variable to the date class 
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

##subset the data 
subset_data <- subset(data_full, subset = (data_full$Date >= "2007-02-01" & data_full$Date <= "2007-02-02"))

##combine the date and time 
dateandtime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$dateandtime <- as.POSIXct(dateandtime)

##use the par function to lay out the graphs as two by two 
par(mfrow = c(2, 2))

#plot the Global Active Power Graph (same as plot 1)
plot(subset_data$dateandtime, subset_data$Global_active_power, type="l", 
     xlab = "", ylab= "Global Active Power (kilowatts)")

#plot the voltage data 
plot(subset_data$dateandtime, subset_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

#plot the Energy sub metering data then use
##lines function to add additional variables (same as plot 3)
plot(subset_data$dateandtime, subset_data$Sub_metering_1, type="l", 
     xlab = "", ylab= "Energy sub metering")
lines(subset_data$dateandtime, subset_data$Sub_metering_2, type="l", col="red")
lines(subset_data$dateandtime, subset_data$Sub_metering_3, type="l", col="blue")

##add in a legend with no border
legend("topright",lty=1, lwd = 2.5, cex=0.6, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), bty="n")

##plot the global reactive power data (plot 4)
plot(subset_data$dateandtime, subset_data$Global_reactive_power, type="l", xlab="datetime", ylab="Voltage")

##Save the file as a PNG with width and height set to 480
dev.copy(png, file = "~/Documents/Coursera/Working Directory/ExploreData/plot4.png", height = 480, width = 480)
dev.off()