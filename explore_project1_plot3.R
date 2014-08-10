explore_project1_plot3 <- function() {
    
    # Check if the subset data file has already been created
    #  If not, get the orig data file and do the subsetting
    setwd("C:/Users/Dave/Documents/Davework/datascience/Graphing/")
    if (!file.exists("./explore_project1_out.csv")) {
        source("./load_explore_project1_data.R")
        load_explore_project1_data()
    }
    subsetMeter <- read.csv("./explore_project1_out.csv", header=TRUE, na.strings="NA", row.names=1)
    subsetMeter$Date <- strptime(subsetMeter$Date, "%Y-%m-%d %H:%M:%S")

    # Create plot 3.  Using png() device because having trouble with the results from dev.copy()
    #  This has the side effect of nothing appearing in the R Studio plot window
    png(file="Project 1 Plot 3.png")
    plot(subsetMeter$Date, subsetMeter$Sub_metering_1, xlab="", ylab="Energy Sub metering", pch="")
    lines(subsetMeter$Date, subsetMeter$Sub_metering_1)
    lines(subsetMeter$Date, subsetMeter$Sub_metering_2, col="Red")
    lines(subsetMeter$Date, subsetMeter$Sub_metering_3, col="Blue")
    legend("topright", lwd=1, lty=1, col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
}