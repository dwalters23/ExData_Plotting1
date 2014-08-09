explore_project1_plot4 <- function() {
    
    # Check if the subset data file has already been created
    #  If not, get the orig data file and do the subsetting
    if (!file.exists("./explore_project1_out.csv")) {
        source("./load_explore_project1_data.R")
        load_explore_project1_data()
    }
    subsetMeter <- read.csv("./explore_project1_out.csv", header=TRUE, na.strings="NA", row.names=1)
    subsetMeter$Date <- strptime(subsetMeter$Date, "%Y-%m-%d %H:%M:%S")

    # Create plot 4
    png(file="Project 1 Plot 4.png", type="cairo")
    par(mfrow=c(2,2))
    # Top left
    plot(subsetMeter$Date, subsetMeter$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", pch="")
    lines(subsetMeter$Date, subsetMeter$Global_active_power)
    # Top right
    plot(subsetMeter$Date, subsetMeter$Voltage, xlab="", ylab="Voltage", pch="")
    lines(subsetMeter$Date, subsetMeter$Voltage)
    # Bottom left
    plot(subsetMeter$Date, subsetMeter$Sub_metering_1, xlab="", ylab="Energy Sub metering", pch="")
    lines(subsetMeter$Date, subsetMeter$Sub_metering_1)
    lines(subsetMeter$Date, subsetMeter$Sub_metering_2, col="Red")
    lines(subsetMeter$Date, subsetMeter$Sub_metering_3, col="Blue")
    legend("topright", lwd=1, lty=1, bty="n", col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    # Bottom right
    plot(subsetMeter$Date, subsetMeter$Global_reactive_power, xlab="", ylab="Global_reactive_power", pch="")
    lines(subsetMeter$Date, subsetMeter$Global_reactive_power, lwd=1.1)
    
    dev.off()
    par(mfrow=c(1,1))
}