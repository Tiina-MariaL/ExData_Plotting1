#download,unzip and read the data.

if(!file.exists('data.zip')){

    url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"

   download.file(url,destfile = "data.zip")

}

unzip("data.zip")

#Name of the data frame = data. Dataset missing values are coded as ?.

data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";", na.strings="?")

#Lets select only the days we need.
RightDays<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

#paste=concatenate vectors and converting Date and Time variables
Time <-strptime(paste(RightDays$Date, RightDays$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

#Lets create dataframe called SelectedData.

SelectedData<-cbind(Time,RightDays)


par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

#Lets draw the first plot

plot(SelectedData$Time, RightDays$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")

#Lets draw second plot below the first

plot(SelectedData$Time, RightDays$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy Sub metering", frame.plot=TRUE)
lines(SelectedData$Time, RightDays$Sub_metering_2,type="l",col="red")
lines(SelectedData$Time, RightDays$Sub_metering_3,type="l",col="blue")
#Lets make the legend to the plot
legend("topright", bty="n",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2, col=c("black","red","blue"))
lines(SelectedData$Time, RightDays$Sub_metering_2,type="l",col="red")
lines(SelectedData$Time, RightDays$Sub_metering_3,type="l",col="blue")

#The third plot is the upper plot at right
plot(SelectedData$Time, SelectedData$Voltage, type="l", xlab="datetime", ylab="Voltage")
# The 4. plot is the lower plot at right
plot(SelectedData$Time, SelectedData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


