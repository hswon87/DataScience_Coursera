NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#2
baltimore <- subset(NEI, fips == "24510")
total_baltimore <- aggregate(Emissions ~ year, baltimore, sum)
x2<-barplot(height = total_baltimore$Emissions/1000, names.arg = total_baltimore$year, xlab = "Years", ylab = expression('PM'[2.5]*' (in kilotons)'), ylim = c(0, 4))
text(x = x2, y = round(total_baltimore$Emissions/1000, 2), label = round(total_baltimore$Emissions/1000, 2), pos = 3, cex = 0.8)
title(main = expression('Total amount of PM'[2.5]*' in Baltimore, MD'))
dev.copy(png, file = "Plot2.png")      
dev.off()
