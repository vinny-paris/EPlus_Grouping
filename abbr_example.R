#abbreviated_example
library(data.table)
library(cluster)

g <- make_groups('Large_Hospital_New2004.csv')


f <- make_design(g)
