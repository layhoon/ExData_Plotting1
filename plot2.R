library(data.table)

# Retrieve data
dt = fread("household_power_consumption.txt", skip = "1/2/2007", nrow = 2880)
names(dt) = names(fread("household_power_consumption.txt", nrow = 0))
dt.Time = strptime(paste(dt$Date, dt$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Plot graph
png("plot2.png", width = 480, height = 480, bg = "transparent")
plot(
  dt.Time,
  dt$Global_active_power,
  type = 'l',
  col = "black",
  xlab = "",
  ylab = "Global Active Power (kilowatts)"
)
dev.off()