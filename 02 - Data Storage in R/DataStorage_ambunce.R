# set a working directory
setwd("~/Rstats/02 - Data Storage in R")
#check your working directory
getwd()

# importing data
# we're going to call it "data"
data <- read.csv("HWA_DATA.csv")
head(data)  #check out the first 6 line
rm(data)    #remove a data file

# assign just one of the columns to a variable
daycol <- data$Day

# Vectors
point <- seq(1,12)
Point <- 1:12
# charachter vectors
site <- c("A","B","C",
          "A","B","C",
          "A","B","C",
          "A","B","C")
Site <- rep(c("A","B","C"),4)
Location <- rep(c("edge","interior"), each=3, length=12)
Duration <- rep(c("5","10"), each=6)
# And now a numeric vector
species_count <- c(12,10,13,11,13,12,19,10,12,11,21,12)
# check how long your vector is
length(species_count)
# Here's a logical vector
logic <- species_count > 20
species_count[which(species_count >20)]

# Factors, so r knows how many levels in a set of variables
# for analysis of categorical variables
SiteFactor <- factor(Site, levels=c("A","B","C"))
LocationFactor <- factor(Location, levels=c("edge","interior"))
DurationFactor <- factor(Duration, levels=c("5","10"))

#create a table
bird.tablePuppies <- cbind(Point, Site,Location,Duration,species_count)
# note that we're just exporting a table. so don't worry about the factor variables.
as.data.frame(bird.tablePuppies)
write.csv(bird.tablePuppies, "bird.tablePuppies.csv")

# Exporting a data frame
BirdPuppies <- data.frame(Point, Site,Location,Duration,species_count)
write.csv(BirdPuppies, "bird.tablePupies2.csv")

# you can adda  row on to that table we created
last.row <- c(13, "A", "edge", "10", 39)
birdtable.again <- rbind(bird.tablePuppies, last.row)
# note that because you're mixing characters and numerics here
# r will coerce everything into being a chaarcter
