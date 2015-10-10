setwd(dir = "~/work/data/exploratory_data_analysis/project1")
# for ease of reading, I have used a fifth program, "get_data.R", to get data,
# as all four plots use the same code
source("get_data.R")
par(ps = 10, cex = 1, cex.lab = 1)
plot(ePowerConsumption$datetime, ePowerConsumption$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(ePowerConsumption$datetime, ePowerConsumption$Sub_metering_2, type = "l", col = "red")
points(ePowerConsumption$datetime, ePowerConsumption$Sub_metering_3, type = "l", col = "blue")

legend("topright", legend=c("sub_metering_1", "sub_metering_2", "sub_metering 3"),
       col=c("black", "red", "blue"), lwd=1, cex=0.5)

dev.copy(png, file = "plot3.png")
dev.off()
