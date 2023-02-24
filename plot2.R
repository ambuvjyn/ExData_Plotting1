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

#Plot the histogram plot and writing it as a png file
png("plot2.png", width = 480, height = 480)

plot(HPC_SS$D_T, HPC_SS$Global_active_power, type="l", ylab= "Global Active Power(kilowatts)", xlab="")

dev.off()