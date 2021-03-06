## getting full dataset to process
full_data <- read.csv("./household_power_consumption.txt", header=T, sep=";", 
                      na.strings="?", check.names=F, stringsAsFactors=F, 
                      comment.char="", quote='\"')

full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

## subsetting the data
data <- subset(full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_data)

## Converting dates
dateTime <- paste(as.Date(data$Date), data$Time)
data$DateTime <- as.POSIXct(dateTime)

## plot 2
plot(data$Global_active_power~data$DateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="./plot2.png", height=480, width=480)
dev.off()

