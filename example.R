library(data.table)
library(reshape2)
library(cluster)

data <- read.csv("example data/Large_Hospital_New2004.csv", header = TRUE)

head(data)

my_exp <- create_grouping_exp(file = "example data/Large_Hospital_New2004.csv",
                              num_of_groups = 10)

class(my_exp)
names(my_exp)
head(my_exp[[1]])

#the names have long IDF style names. Here is a small cut from the 
#output for the second element (the design matrix)
small_design <- as.matrix(my_exp[[2]][1:8, 101:105])
colnames(small_design)

#remove the names to make the design matrix readable
colnames(small_design) <- NULL
small_design

