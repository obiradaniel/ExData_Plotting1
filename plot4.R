datapath = "D:/OD_STUDY/Coursera/Exploratory Data Analysis/data"
gitpath = "C:/Users/ObiraDaniel/Dropbox/Exploratory Data Analysis/Prj1/ExData_Plotting1"
setwd(datapath)

#Estimated MEM in MB if each is 8 bytes, for 9 vars for 2075259 obs
2075259*9*8/(1024^2)

library(data.table)
powerdata = fread("household_power_consumption.txt", sep = ";", nrows = 2880 , skip = 66636, header = TRUE)
labelnames= fread("household_power_consumption.txt", sep = ";", nrows = 1)
colnames(powerdata) = colnames(labelnames)
69517 - 66637

powerdata$DateTime = paste(powerdata$Date, powerdata$Time)
dates = strptime(powerdata$DateTime, "%d/%m/%Y %H:%M:%S")
powerdata$DateTime = strptime(powerdata$DateTime, "%d/%m/%Y %H:%M:%S")
setwd(gitpath)

#png plotting
png("plot4.png", 480, 480, units = "px")
#setting a 2 x 2 grid
par(mfcol = c(2, 2))
#GRAPH 1
#MARGINS c(bottom, left, top, right)
par(mar = c(2, 4, 1, 1))
plot(dates, powerdata$Global_active_power, ylab = "Global Active Power (KiloWatts)", lty = 1, type = "l")

#GRAPH 2
par(mar = c(2, 4, 1, 1))
plot(dates, powerdata$Sub_metering_1, ylab = "Energy sub Metering", lty = 1, type = "l", col = 1)
lines(dates, powerdata$Sub_metering_2, col = "red")
lines(dates, powerdata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =1, col = c("black", "red", "blue"))

#GRAPH 3
par(mar = c(4, 4, 1, 1))
plot(dates, powerdata$Voltage, ylab = "Voltage", xlab = "datetime", lty = 1, type = "l", col = "black")

#GRAPH 4
par(mar = c(4, 4, 1, 1))
plot(dates, powerdata$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", lty = 1, type = "l", col = "black")
dev.off()
setwd(datapath)
