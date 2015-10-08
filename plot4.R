#Coursera: Exploratory data analysis
#Course project 1 - PLOT 4

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

#create plot 4
names(HPCsubset)
HPCsubset$GAct <- as.numeric(as.character(HPCsubset$Global_active_power))
HPCsubset$SubM1 <- as.numeric(as.character(HPCsubset$Sub_metering_1))
HPCsubset$SubM2 <- as.numeric(as.character(HPCsubset$Sub_metering_2))
HPCsubset$SubM3 <- HPCsubset$Sub_metering_3
HPCsubset$Volt <- as.numeric(as.character(HPCsubset$Voltage))
HPCsubset$GReact <- as.numeric(as.character(HPCsubset$Global_reactive_power))

png("plot4.png", width = 480, height=480, type="window")

par(mfrow= c(2,2))
#first plot
plot(HPCsubset$NewTime, HPCsubset$GAct, type = "l", xlab = " ", ylab = "Global Active Power")

#second plot
plot(HPCsubset$NewTime, HPCsubset$Volt, type = "l", xlab = "datetime", ylab = "Voltage")

#third plot
plot(HPCsubset$NewTime, HPCsubset$SubM1, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(HPCsubset$NewTime, HPCsubset$SubM2, col = "red")
lines(HPCsubset$NewTime, HPCsubset$SubM3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

#fourth plot
plot(HPCsubset$NewTime, HPCsubset$GReact, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()


