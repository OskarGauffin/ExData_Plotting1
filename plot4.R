# My solutions assumes the presence of household_power_consumption.txt
# in the working directory. 

# Read the file, remove NA:s
data<-read.table(file="household_power_consumption.txt",header=T,sep=";",na.strings="?")
data<-data[complete.cases(data),]

# Convert first column to date and subset appropriate dates
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

# Construct the plot in between a png-call and dev.off()

png("plot4.png")

# Set graphics parameters, to enable four plots in one device
par(mfrow=c(2,2))


# PLOT NR 1
with(data, plot(Global_active_power,
                xlab="",ylab="Global Active Power (kilowatts)",
                axes=F,
                type="l"))
axis(side=1,seq(0,2*1440,1440),labels=F)
axis(side=2,seq(0,6,2))
box()

# A small function for indicing the x-axis
lab=c("Thu","Fri","Sat")
adj=c(0,NA,1)
xNames<-function(lab,adj){
        mtext(side=1,text=lab,adj=adj,padj=0.6)}
xNames(lab,adj)

# PLOT NR 2
with(data, plot(Voltage,
                xlab="datetime",ylab="Voltage",
                xaxt="n",
                type="l"))
axis(side=1,seq(0,2*1440,1440),labels=F)
axis(side=2,seq(0,30,10))
box()

# Use xNames once again
xNames(lab,adj)

# PLOT NR 3
with(data, plot(Sub_metering_1,
                xlab="",ylab="Energy sub metering",
                axes=F,
                type="l"))
with(data, lines(Sub_metering_2,col="red"))
with(data, lines(Sub_metering_3,col="blue"))

axis(side=1,seq(0,2*1440,1440),labels=F)
axis(side=2,seq(0,30,10))
box()

# Use xNames once again
xNames(lab,adj)

# Add the legend
legend("topright",paste0("Sub_metering_",1:3),
       lty=c(1,1,1),
       lwd=c(1,1,1),
       col=c("black","red","blue"),
       bty="n")

# PLOT NR 4
with(data, plot(Global_reactive_power,
                xlab="datetime",ylab="Global_reactive_power",
                xaxt="n",
                type="l"))
axis(side=1,seq(0,2*1440,1440),labels=F)
axis(side=2,seq(0,30,10))
box()

# Use xNames once again
xNames(lab,adj)

dev.off()




