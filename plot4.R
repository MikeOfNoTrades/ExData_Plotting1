setwd(dir = "~/work/data/exploratory_data_analysis/project1")
source("get_data.R")
par(mfrow = c(2,2), mar = c(5,3,2,1))
plot(ePowerConsumption$datetime, ePowerConsumption$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(ePowerConsumption$datetime, ePowerConsumption$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(ePowerConsumption$datetime, ePowerConsumption$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(ePowerConsumption$datetime, ePowerConsumption$Sub_metering_2, type = "l", col = "red")
points(ePowerConsumption$datetime, ePowerConsumption$Sub_metering_3, type = "l", col = "blue")
legend("topright", cex=0.4, bty = "n", legend=c("sub_metering_1", "sub_metering_2", "sub_metering 3"),
col=c("black", "red", "blue"), lwd=1, text.font=.2, inset = 0)
# 
plot(ePowerConsumption$datetime, ePowerConsumption$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()