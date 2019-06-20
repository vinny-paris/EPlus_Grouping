#Testing data
library(data.table)
library(cluster)

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

lcook <- cooky[,c(1,2,8)]

diags <- data.frame(1:110, 1:110, 15)
names(diags) <- c("i"   ,        "j"       ,    "corr_points")

ook <- rbind(lcook, diags)
L <- dcast(ook, i ~ j)[,-1]
L[is.na(L)] <- 0
L <- L + t(L) + .001
m <- 1/L


agnes(m, diss = TRUE) -> hope
heep <- as.dendrogram(hope)
sub_grp <- cutree(as.hclust(heep), 10)
fviz_cluster(list(data = m, cluster = sub_grp))

fil$Group <- sub_grp

head(fil)







