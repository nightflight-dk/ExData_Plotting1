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

plot2<-function(){
  con<-loadCons()
  png(filename="plot2.png", width=480, height=480)  
  
  plot(con$dt, con$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  dev.off()
}