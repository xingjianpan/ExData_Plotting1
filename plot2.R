
# set default dictionary
setwd('./workspace/datasciencecoursera/house/')

# Read data, convert dates and subset on two days in February 2007
fileURL='household_power_consumption.txt'
Data<-read.table(fileURL, header=TRUE,sep=";",na.string="?",
                 colClasses = c('character', 'character', 'numeric',
                                'numeric', 'numeric', 'numeric',
                                'numeric', 'numeric', 'numeric'))


Data$DateTime <- strptime(paste(Data$Date, Data$Time), 
                          "%d/%m/%Y %H:%M:%S")


Data <- subset(Data, as.Date(DateTime) >= as.Date("2007-02-01") & 
                   as.Date(DateTime) <= as.Date("2007-02-02"))



# Open plot1.png
png("plot2.png", height=480, width=480)


# Build histogram
plot(Data$DateTime,
     Data$Global_active_power,
     pch="",
     ylab="Global Active Power(kilowatts)",
     xlab="")

lines(Data$DateTime, Data$Global_active_power)

# Close PNG file
dev.off()