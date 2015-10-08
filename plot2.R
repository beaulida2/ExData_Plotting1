#Coursera: Exploratory data analysis
#Course project 1 - PLOT 2

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

#create plot 2
names(HPCsubset)
HPCsubset$GAct <- as.numeric(as.character(HPCsubset$Global_active_power))
plot(HPCsubset$NewTime, HPCsubset$GAct, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()
