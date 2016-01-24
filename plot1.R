
## if needed, download and extract the file

if (!file.exists("./household_power_consumption.txt")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./power_data.zip", method = "wget")
  unzip("./power_data.zip", overwrite = T)
}

## Read csv file as dataframe, grepping only the needed dates

df <- file("household_power_consumption.txt")
mydf <- read.table(text = grep("^[1,2]/2/2007", readLines(df), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)


#Plot the histogram
hist(mydf$Global_active_power, col = "Red", xlab = "Global active power (kilowatts)" ,main = paste("Global Active Power"))


#Export the plot to file

dev.copy(png,"plot1.png")
dev.off()