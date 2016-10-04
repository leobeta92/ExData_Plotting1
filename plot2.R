plot2 <- function(x){
  
  #If user does not have data.table package installed, please use
  #command install.packages('data.table') to make sure function 
  #fread is available to use.
  
  library(data.table)
  d_in <- fread('household_power_consumption.txt', sep = ';', na.strings = '?')
  
  p_data <- d_in[d_in$Date == '1/2/2007' | d_in$Date == '2/2/2007',]
  
  dt <- strptime(paste(p_data$Date, p_data$Time, sep = ' '), '%d/%m/%Y %H:%M:%S')
  
  png('plot2.png', width = 480, height = 480)
  plot(dt, p_data$Global_active_power, type = 'l', xlab= ' ', ylab = 'Global Active Power (kilowatts)')
  dev.off()
  
  
}
