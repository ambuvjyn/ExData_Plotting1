#Assigning the url provided in the course work
HPC_Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#Downloading data from the url provided in the course work
download.file(HPC_Url,destfile="./household_power_consumption.zip",method="curl")

#unzipping the data
unzip(zipfile="./household_power_consumption.zip",exdir="./")

#Import data from txt file
HPC <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=F)

#Subset data from the dates 2007-02-01 and 2007-02-02
HPC_SS<- subset(HPC, (HPC$Date == "1/2/2007" | HPC$Date== "2/2/2007"))

#Formatting the date
HPC_SS$Date <- as.Date(HPC_SS$Date, format = "%d/%m/%Y")

#Combining date and Time
HPC_SS$D_T <- as.POSIXct(paste(HPC_SS$Date, HPC_SS$Time))

#Customised composite plot with 4 grids

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

#Plotting the grid with Global Active Power, Voltage, 4 Energy sub metering's and Global_reactive_power
plot(HPC_SS$D_T, HPC_SS$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

plot(HPC_SS$D_T, HPC_SS$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(HPC_SS$D_T, HPC_SS$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
  lines(HPC_SS$D_T, HPC_SS$Sub_metering_2, col = "red")
  lines(HPC_SS$D_T, HPC_SS$Sub_metering_3, col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), cex = 0.8, lty = 1 , bty = "n")

plot(HPC_SS$D_T, HPC_SS$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()