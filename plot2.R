# My solutions assumes the presence of household_power_consumption.txt
# in the working directory. 

# Read the file, remove NA:s
data<-read.table(file="household_power_consumption.txt",header=T,sep=";",na.strings="?")
data<-data[complete.cases(data),]

# Convert first column to date and subset appropriate dates
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

# Construct the plot in between a png-call and dev.off()

png("plot2.png")
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

dev.off()





