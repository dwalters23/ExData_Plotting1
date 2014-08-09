load_explore_project1_data <- function() {
    
    # This script loads the data from the web only if needed, unzips if needed,
    #  and puts it in a file for the plotting functions to call
    
    setwd("C:/Users/Dave/Documents/Davework/datascience/Graphing/")
    fileName <- "exdata-data-household_power_consumption.zip"
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

    # Only download and unzip if needed
    if (!file.exists(fileName)) download.file(fileUrl, destfile = fileName)
    if (!file.exists("./exdata-data-household_power_consumption"))  unzip(fileName)

    # Train the classes by reading a couple of rows first.
    tab2row = read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=3)
    classes = sapply(tab2row, class)
    # Overwrite the Date and Time columns because by default they would be factors
    classes[1:2] = "character"
    # Read the table up to and including the desired Date rows
    meter <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, colClasses= classes, sep=";", na.strings="?", nrows=69516)
    # Put the time info into the Date variable, making "Time" no longer a needed column
    meter$Date <- strptime(paste(meter$Date, meter$Time), "%d/%m/%Y %H:%M:%S")
    # Subset to lose the non 2007-2-1 and 2007-2-2 rows
    subsetMeter <- meter[grepl("2007-02-01|2007-02-02", meter$Date),]
    print(str(subsetMeter))
    
    # Write to file
    write.csv(subsetMeter, file="./explore_project1_out.csv", na="NA")
}