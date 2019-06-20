#Assigning metrics to the data based on 1) names and 
#2) the 80th percentile of the parameter values
#80th was choosen as to avoid the extreme values where higher order 
#polynomials might be dominating. Instead I am banking on approx.
#linear in the middle-ish range. I'm unsure if this is reasonable
#but Joshua seems to oppose min/max (which is traditionally seen
#as D-, A-, I- Optimal. 


#Builds a dataframe for every possible combination pairs of rows 
#(i, j). It will assign prop. of "words" overlapping in variable 
#names (word_cors),and for class/object/field_match 1 if the two
#variables match in that category, 0 if not. Lastly, param_match
#is 1 if the two variables have the same 80th percentile
jing <- function(nam, data){
  idx <- combn(1:dim(data)[1], 2)
  i <- idx[1,]
  j <- idx[2,]
  nam <- apply(data.frame(nam), 1, as.character)
  jaxon <- cbind(nam[i], nam[j])
  word_cors <-  apply(jaxon, 1, word_cor)
  param_match <- (data[i, 'p80'] == data[j, 'p80']) + 0
  class_match <- (data[i, 'Class'] == data[j, 'Class']) + 0
  object_match <- (data[i, 'Object'] == data[j, 'Object']) + 0
  field_match <- (data[i, 'Field'] == data[j, 'Field']) + 0
  bb  <- data.frame(i, j, word_cors, class_match, object_match, field_match, param_match)
  return(bb)
}



#Applies the points function to the above dataframe to create
#a rough metric for how closely related the pairs are.
#The metric is 3*word_cor + sum of class/object/field_match +
#6*param_match
points <- function(data){
  pnts <- 6*data[3] + sum(data[4:6]) + 6*data[7]
  data[8] <- pnts
  return(data)
}




#builds a full factorial design based on how many variables you
#passing to it (for us that is the number of groups)
balloon <- function(x) { 
  
  u <- unlist(base::strsplit(R.utils::intToBin(0:(2^x - 1)),
                             split = ""))
  
  v <- matrix(u, byrow = TRUE, ncol = x)
  
  return(v)
}





#finds the proportion of overlap between names of variables
word_cor <- function(j){
  x <- unlist(strsplit(as.character(j[1]), split = "[[:punct:][:space:]]+"))
  y <- unlist(strsplit(as.character(j[2]), split = "[[:punct:][:space:]]+"))
  sum(chmatch(x, y, nomatch = 0) != 0)/max(length(x), length(y))
}






