#1.Download and unzip the data
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './household_power_consumption.zip')
unzip("./household_power_consumption.zip")

#2.Read the data, subset the data and conver the data format
power <- read.table("household_power_consumption.txt", na.strings = "?",  sep = ";", header = TRUE)
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
subpower$Date <- as.Date(subpower$Date, format = '%d/%m/%Y')
subpower$DateTime <- as.POSIXct(paste(subpower$Date, subpower$Time))

#3. Plot2
if(!file.exists("figures)) dir.create("figures")
png(filename = "./figures/plot2.png", width = 480, height = 480, units="px")
plot(subpower$DateTime, subpower$Global_active_power, xlab ="", ylab = "Global Active Power (kilowatt)", type = "l")
dev.off()
