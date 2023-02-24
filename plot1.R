#Assigning the url provided in the course work
HPC_Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#Downloading data from the url provided in the course work
download.file(HPC_Url,destfile="./household_power_consumption.zip",method="curl")

#unzipping the data
unzip(zipfile="./household_power_consumption.zip",exdir="./")

#Import data from txt file
HPC <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=F)

#Subset data from the dates 2007-02-01 and 2007-02-02
HPC$Date <- as.Date(HPC$Date, format = "%d/%m/%Y")

HPC_SS <- subset(HPC, Date >= "2007-02-01" & Date <= "2007-02-02")

#Converting class to numeric for third column
HPC_SS$Global_active_power <- as.numeric(HPC_SS$Global_active_power)

#Plot the histogram plot and writing it as a png file
png("plot1.png", width = 480, height = 480)

hist(HPC_SS[, 3], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()