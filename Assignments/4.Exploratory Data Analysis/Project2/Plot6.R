NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimore_road <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]
baltimore_road_year <- aggregate(Emissions ~ year, baltimore_road, sum)

#6
LA_road <- NEI[NEI$fips == "06037" & NEI$type == "ON-ROAD",]
LA_road_year <- aggregate(Emissions ~ year, LA_road, sum)
baltimore_road_year$county <- "Baltimore City, MD"
LA_road_year$county <- "Los Angeles County, CA"
both <- rbind(baltimore_road_year, LA_road_year)
g <- ggplot(both, aes(as.factor(year), Emissions, fill = county, label = round(Emissions,2)))
g + geom_bar(stat = "identity") +  
        facet_grid(county~., scale = "free") +
        xlab("Years") + ylab(expression('PM'[2.5]*' in tons')) +  
        ggtitle(expression('Total amount of PM'[2.5]*' from motor vehicle source in Baltimore, MD')) +
        geom_label(aes(fill = county), colour = "white", fontface = "bold" )
dev.copy(png, file = "Plot6.png")
dev.off() 
