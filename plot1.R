loadCons<-function(){
  cin <- file("household_power_consumption.txt")
  # this is not a performance solution
  pow<-read.csv(cin, sep=";", na.strings="?")
  filter<-pow$Date == "1/2/2007" | pow$Date == "2/2/2007"
  pow<-pow[filter,]
  pow<-transform(pow, Date=as.Date(Date, format="%d/%m/%Y"))
  return(pow)
}

plot1<-function(data){
  con<-loadCons()
  png(filename="plot1.png", width=480, height=480)
  hist(con$Global_active_power, col="RED", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
  dev.off()
}