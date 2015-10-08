#Coursera: Exploratory data analysis
#Course project 1 - PLOT 3

#read in data 
list.files()
HPCdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
head(HPCdata)
tail(HPCdata)
str(HPCdata)

#reformat date variables and subset to only records from 2007-02-01 to 2007-02-02
HPCdata$NewDate <- as.Date(strptime(HPCdata$Date, "%d/%m/%Y"))
HPCdata$NewTime <- strptime(paste(HPCdata$Date, HPCdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

HPCsubset <- HPCdata[as.Date("2007-02-01") <= HPCdata$NewDate & HPCdata$NewDate <= as.Date("2007-02-02"), ]
head(HPCsubset)
tail(HPCsubset)
summary(HPCsubset)

#create plot 3
names(HPCsubset)
HPCsubset$SubM1 <- as.numeric(as.character(HPCsubset$Sub_metering_1))
HPCsubset$SubM2 <- as.numeric(as.character(HPCsubset$Sub_metering_2))
HPCsubset$SubM3 <- HPCsubset$Sub_metering_3

png("plot3.png", width = 480, height=480, type="window")

plot(HPCsubset$NewTime, HPCsubset$SubM1, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(HPCsubset$NewTime, HPCsubset$SubM2, col = "red")
lines(HPCsubset$NewTime, HPCsubset$SubM3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
