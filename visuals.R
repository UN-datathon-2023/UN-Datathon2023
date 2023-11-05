library(ncdf4) # package for netcdf manipulation
library(terra) # package for geospatial analysis
library(ggplot2) # package for plotting
require(sf)
require(tidyverse)
require(raster)

setwd("D:/2023/un datacon/UN-Datathon2023/Dataset/Fire_Hotspot/csv_file")
file1 <- read.csv2(file = "fire_archive_M-C61_397859.csv", sep = ",")
setwd("../../Weather/")
file6 <- read.csv2(file = "POWER_Regional_Daily_20120101_20121231_001d10N_007d10N_100d28E_107d28E_LST.csv", sep = ",")
file7 <- read.csv2(file = "POWER_Regional_Daily_20120101_20121231_006d92S_001d10N_094d71E_100d28E_LST.csv", sep = ",")
file8 <- read.csv2(file = "POWER_Regional_Daily_20130101_20131231_001d10N_007d10N_100d28E_107d28E_LST.csv", sep = ",")
file9 <- read.csv2(file = "POWER_Regional_Daily_20130101_20131231_006d92S_001d10N_094d71E_100d28E_LST.csv", sep = ",")



# -- fire_archive_M-C61_xx = MODIS standard quality Thermal Anomalies / Fire locations 
# processed by the University of Maryland with a 3-month
# lag and distributed by FIRMS. These standard data (MCD14ML) 
# replace the NRT (MCD14DL) files when available.

head(file1)
str(file1)
file1$latitude <- as.numeric(file1$latitude)
file1$longitude <- as.numeric(file1$longitude)
file1$brightness <- as.numeric(file1$brightness)
file1$scan <- as.numeric(file1$scan)
file1$track <- as.numeric(file1$track)
file1$confidence <- as.numeric(file1$confidence)
file1$version <- as.numeric(file1$version)
file1$bright_t31 <- as.numeric(file1$bright_t31)
file1$frp <- as.numeric(file1$frp)
file1$acq_date<- as.POSIXct(file1$acq_date, "%Y-%m-%d")

plot(density(file1$scan))
plot(density(file1$track))
table(file1$satellite)
table(file1$type)

plot(file1$latitude,file1$brightness)
plot(file1$longitude,file1$brightness)

plot(file1$latitude,file1$bright_t31)
plot(file1$longitude,file1$bright_t31)

boxplot(file1$brightness ~ file1$daynight)
boxplot(file1$brightness ~ round(file1$longitude))
boxplot(file1$brightness ~ round(file1$latitude))

boxplot(file1$bright_t31 ~ file1$daynight)
boxplot(file1$bright_t31 ~ round(file1$longitude))
boxplot(file1$bright_t31 ~ round(file1$latitude))

plot(density(file1$confidence))
plot(file1$confidence,file1$brightness)
boxplot(file1$brightness ~ round(file1$confidence, -1))
plot(log(file1$frp), file1$brightness)

plot(file1$confidence,file1$bright_t31)
boxplot(file1$bright_t31 ~ round(file1$confidence, -1))
plot(log(file1$frp), file1$bright_t31)

plot(file1$bright_t31, file1$brightness)

#continuous fires analysis, happen in very close proximity and within at most one day of observation (90,000 seconds)
latdiff<-diff(file1$latitude)
londiff<-diff(file1$longitude)
timediff<-diff(file1$acq_date)
diffmat = data.frame(timediff, londiff, latdiff)
#spatial proximity and at least a day apart
diffmat$contfire <- (abs(diffmat$londiff) <= 0.0005) & (abs(diffmat$latdiff) <= 0.0005) & (diffmat$timediff <= 90000)
file1$contfire <- (c(FALSE, diffmat$contfire))
table(file1$contfire)


