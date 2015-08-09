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

#setting the PNG as the current graphics device then exporting plots to it
png("plot1.png", 480, 480, units = "px")
hist(powerdata$Global_active_power, breaks = 12, col = "red", main = "Global Active Power", xlab = "Global Active Power (KiloWatts)")
dev.off()
setwd(datapath)