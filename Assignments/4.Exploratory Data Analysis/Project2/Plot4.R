NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#4
NEISCC <- merge(NEI, SCC, by = "SCC")
coal_match <- grepl("coal", NEISCC$Short.Name, ignore.case = TRUE)
coal <- NEISCC[coal_match,]
coal_year <- aggregate(Emissions ~ year, coal, sum)
library(ggplot2)
g <- ggplot(coal_year, aes(as.factor(year), Emissions/1000, fill = year, label = round(Emissions/1000,2)))
g + geom_bar(stat = "identity") +  
        xlab("Years") + ylab(expression('PM'[2.5]*' in kilotons')) +  
        ggtitle(expression('Total amount of PM'[2.5]*' from coal sources')) +
        geom_label(aes(fill = year), colour = "white", fontface = "bold" )
dev.copy(png, file = "Plot4.png")      
dev.off() 
