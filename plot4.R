loadCons<-function(){
  Sys.setlocale(category = "LC_TIME", locale="us")
  cin <- file("household_power_consumption.txt")
  
  # this is *not* a performance edition
  pow<-read.csv(cin, sep=";", na.strings="?")
  filter<-pow$Date == "1/2/2007" | pow$Date == "2/2/2007"
  pow<-pow[filter,]
  pow<-transform(pow, dt=as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
  
  return(pow)
}

plot4<-function(){
  
  con<-loadCons()
  
  png(filename="plot4.png", width=480, height=480)  
  
  par(mfrow=c(2,2))  
  
  #plot 1, 1
  
  plot(con$dt, con$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  #plot 1, 2
  
  with(con, plot(dt, Voltage, type="l", xlab="datetime"))
  
  #plot 2, 1
  
  with(con, plot(dt, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
  with(con, lines(dt, Sub_metering_2, col="red"))
  with(con, lines(dt, Sub_metering_3, col="blue"))  
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty=c(1,1,1), col=c("black", "red", "blue"))
  
  #plot 2, 2
  
  with(con, plot(dt, Global_reactive_power, type="l", xlab="datetime"))  
  
  dev.off()
}