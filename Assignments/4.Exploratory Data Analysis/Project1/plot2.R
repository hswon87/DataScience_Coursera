Sys.setlocale(category = "LC_TIME", "English")
power <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
data <- subset(power, power$Date == "2007-02-01" | power$Date == "2007-02-02")
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
with(data, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
