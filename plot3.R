library(data.table)

# Retrieve data
dt = fread("household_power_consumption.txt", skip = "1/2/2007", nrow = 2880)
names(dt) = names(fread("household_power_consumption.txt", nrow = 0))
dt.Time = strptime(paste(dt$Date, dt$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Plot graphs
png("plot3.png", width = 480, height = 480, bg = "transparent")
plot(
  dt.Time,
  dt$Sub_metering_1,
  type = 'l',
  col = "black",
  xlab = "",
  ylab = "Energy sub metering"
)
lines(
  dt.Time,
  dt$Sub_metering_2,
  col = "red",
  type = "l"
)
lines(
  dt.Time,
  dt$Sub_metering_3,
  col = "blue",
  type = "l"
)
legend(
  "topright",
  lty = c(1, 1, 1),
  col = c("black", "red", "blue"),
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)
dev.off()