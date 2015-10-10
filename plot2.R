setwd(dir = "~/work/data/exploratory_data_analysis/project1")
# for ease of reading, I have used a fifth program, "get_data.R", to get data,
# as all four plots use the same code
source("get_data.R")
par(ps = 10, cex = 1, cex.lab = 1)
plot(ePowerConsumption$datetime, ePowerConsumption$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()