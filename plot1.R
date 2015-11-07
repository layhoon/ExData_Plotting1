library(data.table)

# Retrieve data
dt = fread("household_power_consumption.txt", skip = "1/2/2007", nrow = 2880)
names(dt) = names(fread("household_power_consumption.txt", nrow = 0))

# Plot histogram
png("plot1.png", width = 480, height = 480, bg = "transparent")
hist(
  dt$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency"
)
dev.off()