setwd("~/Downloads")
download.file("https://vincentarelbundock.github.io/Rdatasets/csv/carData/MplsStops.csv", 'MplsStops.csv')
MplsStops <- read.csv("MplsStops.csv", header=T)
head(MplsStops)

#Visualize the Number of Vehicle Searched by Race

#Basic Graphic in R
par(mfrow=c(1,2))
barplot(sort(table(MplsStops$race),decreasing=T), main='Distribution of Race')
barplot(sort(table(MplsStops$vehicleSearch),decreasing=T) , main='Distribution of Vehicle Searched')

#lattice package
library(lattice)

White <- table(MplsStops$race == "White")
Black <- table(MplsStops$race == "Black")
Latino <- table(MplsStops$race == "Latino")
Asian <- table(MplsStops$race == "Asian")
Vehicle_Searched <- table(MplsStops$vehicleSearch == "YES")

barchart(~ White | Vehicle_Searched, xlim= c(0, 30000) , xlab='Frequency of Vehicle Searched by the Police ' , ylab='Race = White')
barchart(~ Black | Vehicle_Searched, xlim= c(0, 30000) , xlab='Frequency of Vehicle Searched by the Police ' , ylab='Race = Black')
barchart(~ Latino | Vehicle_Searched, xlim= c(0, 30000) , xlab='Frequency of Vehicle Searched by the Police ' , ylab='Race = Latino')
barchart(~ Asian | Vehicle_Searched, xlim= c(0, 30000) , xlab='Frequency of Vehicle Searched by the Police ' , ylab='Race = Asian')

#ggplot2 package
library(ggplot2)
dat <- data.frame(table(MplsStops$race, MplsStops$vehicleSearch))
names(dat) <- c("Race", "VehicleSearched", "Count")
ggplot(data=dat, aes(x=Race, y=Count, fill=VehicleSearched)) + geom_bar(stat="identity")
