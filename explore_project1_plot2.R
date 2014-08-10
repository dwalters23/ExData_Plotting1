explore_project1_plot2 <- function() {
    
    # Check if the subset data file has already been created
    #  If not, get the orig data file and do the subsetting
    setwd("C:/Users/Dave/Documents/Davework/datascience/Graphing/")
    if (!file.exists("./explore_project1_out.csv")) {
        source("./load_explore_project1_data.R")
        load_explore_project1_data()
    }
    subsetMeter <- read.csv("./explore_project1_out.csv", header=TRUE, na.strings="NA", row.names=1)
    subsetMeter$Date <- strptime(subsetMeter$Date, "%Y-%m-%d %H:%M:%S")

    # Create plot 2
    plot(subsetMeter$Date, subsetMeter$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", pch="")
    lines(subsetMeter$Date, subsetMeter$Global_active_power)
    dev.copy(png,file="Project 1 Plot 2.png")
    dev.off()
}