setwd("./course5-2")
getwd()
url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
download.file(url, "StormData.csv.bz2")
library(R.utils)
bunzip2("StormData.csv.bz2", "StormData.csv")
df <- read.csv("StormData.csv.bz2", header=TRUE, sep=",")
str(df)
head(df)
tail(df)
sum(nchar(as.character(df$STATE)[1:570290])==2)
View(df[547363:547365,])
df$END_RANGE[547363]
df1 <- readLines(con="StormData.csv.bz2")
df1[1:2]
grep("547303.00", df1)
df1[884718]
tmp1 = gsub("\"\" ","", df1)
writeLines(tmp1, "StormData1.txt")
df_edited <- read.table("StormData1.txt", sep=",", quote = "\"", header = T)
dim(df_edited)
head(df_edited)
tail(df_edited)

health <- c("EVTYPE", "FATALITIES", "INJURIES")
healthData <- df_edited[,health]
economic <- c("EVTYPE", "CROPDMG", "CROPDMGEXP", "PROPDMG", "PROPDMGEXP")
economicData <- df_edited[,economic]
table(economicData$CROPDMGEXP)
table(economicData$PROPDMGEXP)
str(economicData$CROPDMGEXP)

trans <- function(x){
        if(x=="?"|x=="-"|x=="+"|x==""){
                x <- 1
        }else if(x=="h"|x=="H"){
                x <- 10^2
        }else if(x=="k"|x=="K"){
                x <- 10^3
        }else if(x=="m"|x=="M"){
                x <- 10^6
        }else if(x=="b"|x=="B"){
                x <- 10^9
        }else{
                x <- 10^(as.numeric(x))
        }
}
economicData$CROPDMGEXP_trans <- sapply(as.character(economicData$CROPDMGEXP), trans)
table(economicData$CROPDMGEXP_trans)
economicData$PROPDMGEXP_trans <- sapply(as.character(economicData$PROPDMGEXP), trans)
table(economicData$PROPDMGEXP_trans)
economicData$CROP_total <- economicData$CROPDMGEXP_trans * economicData$CROPDMG
economicData$PROP_total <- economicData$PROPDMGEXP_trans * economicData$PROPDMG

str(healthData)
health_event <- aggregate(cbind(FATALITIES, INJURIES) ~ EVTYPE, data=healthData, FUN=sum, na.rm = TRUE)
health_event$TOTAL <- health_event$FATALITIES + health_event$INJURIES
library(dplyr)
health_event <- arrange(health_event, desc(TOTAL))
top10_health <- health_event[1:10, ]
top10_health
library(reshape2)
top10_health_melt <- melt(top10_health, id.vars = "EVTYPE")

library(ggplot2)
fig_health <- ggplot(top10_health_melt, aes(x = reorder(EVTYPE, -value), y = value)) +
                geom_bar(stat = "identity", aes(fill = variable), position = "dodge") +
                xlab("Events") + theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
                ylab("Total counts") + 
                ggtitle("Top 10 weather events for health effect")
fig_health

str(economicData)
economic_event <- aggregate(cbind(CROP_total, PROP_total) ~ EVTYPE, data = economicData, FUN=sum, na.rm = TRUE)
economic_event$SUM <- economic_event$CROP_total + economic_event$PROP_total
economic_event <- arrange(economic_event, desc(SUM))
top10_economic <- economic_event[1:10, ]
top10_economic
colnames(top10_economic) <- c("EVTYPE", "CROP", "PROPERTY", "TOTAL")
top10_economic_melt <- melt(top10_economic, id.vars = "EVTYPE")
fig_economic <- ggplot(top10_economic_melt, aes(x = reorder(EVTYPE, -value), y = value)) +
        geom_bar(stat = "identity", aes(fill = variable), position = "dodge") +
        xlab("Events") + theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
        ylab("Total counts") + 
        ggtitle("Top 10 weather events for economic effect")
fig_economic
