plot4 <- function(x) {
  
  #If user does not have data.table package installed, please use
  #command install.packages('data.table') to make sure function 
  #fread is available to use.
  
  library(data.table)
  d_in <- fread('household_power_consumption.txt', sep = ';', na.strings = '?')
  
  p_data <- d_in[d_in$Date == '1/2/2007' | d_in$Date == '2/2/2007',]
  
  dt <- strptime(paste(p_data$Date, p_data$Time, sep = ' '), '%d/%m/%Y %H:%M:%S')
  
  
  
  png('plot4.png', width = 480, height = 480)
  par(mfrow= c(2,2))
  with(
    plot(dt, p_data$Global_active_power, type = 'l', xlab= ' ', ylab = 'Global Active Power (kilowatts)'),
    plot(dt, p_data$Voltage, type = 'l', xlab = 'datetime', ylab= 'Voltage'))
  plot(dt, p_data$Sub_metering_1, type = 'n', xlab= ' ', ylab = 'Energy sub metering')
  lines(dt, p_data$Sub_metering_1, type = 'l', col= 'black')
  lines(dt, p_data$Sub_metering_2, type = 'l', col= 'red')
  lines(dt, p_data$Sub_metering_3, type = 'l', col= 'blue')
  legend('topright', 
         lty = c(1,1,1),
         lwd = c(2.5,2.5, 2.5), 
         col = c('black', 'blue', 'red'), 
         legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
  plot(dt, p_data$Global_reactive_power, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')
  
  dev.off()

  
  
}
