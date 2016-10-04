plot1 <- function(x) {
  
  library(data.table)
  d_in <- fread('household_power_consumption.txt', sep = ';', na.strings = '?')
  
  hh_data <- d_in[d_in$Date == '1/2/2007' | d_in$Date == '2/2/2007',]
  
  png('plot1.png', width = 480, height = 480)
  hist(hh_data$Global_active_power, col = 'Red', 
       main = 'Global Active Power', xlab = 'Global Active Power (Kilowatts)')
  dev.off()
  
}