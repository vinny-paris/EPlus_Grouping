#Testing data
library(data.table)

#read in the example file and denote the 20th and 80th percentiles
fil <- read.csv('Large_Hospital_New2004.csv', header = TRUE)
fil$p20 <-  (fil$Maximum - fil$Minimum)*.2 + fil$Minimum 
fil$p80 <-  (fil$Maximum - fil$Minimum)*.8 + fil$Minimum
head(fil)


#create the full variable names
Nam <- data.frame(apply( fil[ , 2:4 ] , 1 , paste , collapse = "_" ))


#Builds a dataframe for every possible combination pairs of rows 
#(i, j). It will assign prop. of "words" overlapping in variable 
#names (word_cors),and for class/object/field_match 1 if the two
#variables match in that category, 0 if not. Lastly, param_match
#is 1 if the two variables have the same 80th percentile
Jess <- jing(Nam, fil) 


#Applies the points function to the above dataframe to create
#a rough metric for how closely related the pairs are.
#The metric is 3*word_cor + sum of class/object/field_match +
#6*param_match
cooky <- t(apply(Jess, 1, points))
colnames(cooky)[8] <- 'corr_points'
cooky <- data.frame(cooky)
head(cooky)


#Cuts down the above matrix into just the two indices (i, j) and 
#and the corresponding closeness metric
cooker <- grouper(cooky)
head(cooker)

