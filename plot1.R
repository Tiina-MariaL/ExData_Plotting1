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

#Lets draw Plot1, histogram:

hist(RightDays$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")