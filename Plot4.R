#1.Download and unzip the data
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './household_power_consumption.zip')
unzip("./household_power_consumption.zip")

#2.Read the data, subset the data and conver the data format
power <- read.table("household_power_consumption.txt", na.strings = "?",  sep = ";", header = TRUE)
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
subpower$Date <- as.Date(subpower$Date, format = '%d/%m/%Y')
subpower$DateTime <- as.POSIXct(paste(subpower$Date, subpower$Time))

#3. Plot4
if(!file.exists("figures")) dir.create("figures")
png(filename = "./figures/plot4.png", width = 480, height = 480, units="px")
par(mfrow = c(2, 2))
plot(subpower$DateTime, subpower$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatt)", type = "l")
plot(subpower$DateTime, subpower$Voltage, xlab = "datetime, ylab = Voltage", type = "l")
plot(subpower$DateTime, subpower$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(subpower$DateTime, subpower$Sub_metering_2, col = "red")
lines(subpower$DateTime, subpower$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
plot(subpower$DateTime, subpower$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()