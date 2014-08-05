
# My solutions assumes the presence of household_power_consumption.txt
# in the working directory. 

# Read the file, remove NA:s
data<-read.table(file="household_power_consumption.txt",header=T,sep=";",na.strings="?")
data<-data[complete.cases(data),]

# Convert first column to date and subset appropriate dates
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

# Construct the plot in between a png-call. The desired size is the 
# standard value for these graphic devices.
png("plot1.png")
with(data, hist(Global_active_power,col="red",
                xlab="Global Active Power (kilowatts)",ylab="Frequency",
                main="Global Active Power",
                axes=F))
axis(side=1,seq(0,6,2))
axis(side=2,seq(0,1200,200))
dev.off()






