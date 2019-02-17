NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimore <- subset(NEI, fips == "24510")


#3
library(ggplot2)
total_baltimore_type <- aggregate(Emissions ~ year + type, baltimore, sum)
g <- ggplot(total_baltimore_type, aes(as.factor(year), Emissions, fill = type, label = round(Emissions,2)))
g + geom_bar(stat = "identity") +  
        facet_grid(.~type) +  
        xlab("Years") + ylab(expression('PM'[2.5]*' in tons')) +  
        ggtitle(expression('Total amount of PM'[2.5]*' in Baltimore, MD at various types of source')) +
        geom_label(colour = "white", cex = 2, fontface = "bold" )
dev.copy(png, file = "Plot3.png", height = 700, width = 700)      
dev.off()    
