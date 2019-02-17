unzip("./exdata%2Fdata%2FNEI_data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#1
total <- aggregate(Emissions ~ year, NEI, sum)
x1<-barplot(height = total$Emissions/1000, names.arg = total$year, xlab = "Years", ylab = expression('PM'[2.5]*' (in kilotons)'), ylim = c(0, 8000))
text(x = x1, y = round(total$Emissions/1000, 0), label = round(total$Emissions/1000, 0), pos = 3, cex = 0.8)
title(main = expression('Total amount of PM'[2.5]*' at various years'))
dev.copy(png, file = "Plot1.png")      
dev.off() 
