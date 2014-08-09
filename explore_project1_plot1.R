explore_project1_plot1 <- function() {
    
    # Check if the subset data file has already been created
    #  If not, get the orig data file and do the subsetting
    if (!file.exists("./explore_project1_out.csv")) {
        source("./load_explore_project1_data.R")
        load_explore_project1_data()
    }
    subsetMeter <- read.csv("./explore_project1_out.csv", header=TRUE, na.strings="NA", row.names=1)
    subsetMeter$Date <- strptime(subsetMeter$Date, "%Y-%m-%d %H:%M:%S")

    # Create plot 1.
    par(mar=c(5,5,3,3))
    hist(subsetMeter$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
    dev.copy(png,file="Project 1 Plot 1.png")
    dev.off()
}