NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#5
baltimore_road <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]
baltimore_road_year <- aggregate(Emissions ~ year, baltimore_road, sum)
g <- ggplot(baltimore_road_year, aes(as.factor(year), Emissions, fill = year, label = round(Emissions,2)))
g + geom_bar(stat = "identity") +  
        xlab("Years") + ylab(expression('PM'[2.5]*' in tons')) +  
        ggtitle(expression('Total amount of PM'[2.5]*' from motor vehicle source in Baltimore, MD')) +
        geom_label(aes(fill = year), colour = "white", fontface = "bold" )
dev.copy(png, file = "Plot5.png")
dev.off() 
