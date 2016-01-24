## if needed, download and extract the file

if (!file.exists("./household_power_consumption.txt")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./power_data.zip", method = "wget")
  unzip("./data/power_data.zip", overwrite = T)
}

##Read the file and create dataframe

df <- file("household_power_consumption.txt")
mydf <- read.table(text = grep("^[1,2]/2/2007", readLines(df), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE, na.strings = "?")

##Convert dates

mydf$convertedDate <- strptime(paste(mydf$Date, mydf$Time), "%d/%m/%Y %H:%M:%S")

#Plot the lines
plot(mydf$convertedDate, mydf$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(mydf$convertedDate, mydf$Sub_metering_2, col = "Red")
lines(mydf$convertedDate, mydf$Sub_metering_3, col = "blue")
legend("topright", lty = 1,  col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"))

#Export the plot to file

dev.copy(png,"plot3.png")
dev.off()