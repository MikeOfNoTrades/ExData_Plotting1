library(base)
library(dplyr)
library(lubridate)

# check out colClasses - 4:21 of vid 3
setwd(dir = "~/work/data/exploratory_data_analysis/project1")
raw_data <- read.csv("household_power_consumption.txt", sep = ";")
# the following did not work, so I tried a different method
# raw_data <- read.csv("household_power_consumption.txt", sep = ";", 
#                     colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "character"))
# get the required range, Feb, 1 & 2, 2007
pro_data_feb <- filter(raw_data, grepl('^1/2/2007|^2/2/2007', Date))
# combine date and time for conversion to proper class
x <- mutate(pro_data_feb, date_str = paste(Date, Time, sep = " "))
# use lubridate function parse_date_time to convert to date class
project_data <- mutate(x, datetime = parse_date_time(x$date_str, "%d%m%Y %H%M%S"))
tb_proj <- tbl_df(project_data)
# remove redundant fields
ePowerConsumption <- select(tb_proj, -Date, -Time, -date_str)
# re-order variables to put datetime first
ePowerConsumption  <- ePowerConsumption[c(8,1,2,3,4,5,6,7)]
# function to change non-date variables to numeric
factorToNumeric <- function(f) as.numeric(levels(f))[as.integer(f)] 
# list of non-date columns
cols <- c(2,3,4,5,6,7)
" apply the function"
ePowerConsumption[cols] <- lapply(ePowerConsumption[cols], factorToNumeric)
