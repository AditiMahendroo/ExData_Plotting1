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

#plot the data 
plot(subset_data$dateandtime, subset_data$Global_active_power, type="l", 
     xlab = "", ylab= "Global Active Power (kilowatts)")

## Save the file as a PNG with width and height set to 480
dev.copy(png, file = "~/Documents/Coursera/Working Directory/ExploreData/plot2.png", height = 480, width = 480)
dev.off()