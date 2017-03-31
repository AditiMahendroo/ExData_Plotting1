##read in the file 
data_full <- read.csv("~/Documents/Coursera/Working Directory/ExploreData/household_power_consumption.txt", sep = ';', na.strings="?", header=T, nrows=2075259, 
                      check.names=F, stringsAsFactors=F)

##covert the date variable to the date class 
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

##subset the data 
subset_data <- subset(data_full, subset = (data_full$Date >= "2007-02-01" & data_full$Date <= "2007-02-02"))

##convert the time variable to the time class 
##data_full$Time <- strptime(data_full$Time, format="%H:%M:%S")

#Plot 1: create a histogram with the x and y-axis labels 
## as shown in the course assignment
hist(subset_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

## Save the file as a PNG with the width and height set to 480
dev.copy(png, file = "~/Documents/Coursera/Working Directory/ExploreData/plot1.png", height = 480, width = 480)
dev.off()
