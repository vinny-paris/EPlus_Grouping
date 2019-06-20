#background functions for constructor function



#build factorial desgin matrix with 0/1's with number of
#groups as the number of columns
balloon <- function(x) { 
  
  u <- unlist(base::strsplit(R.utils::intToBin(0:(2^x - 1)),
                             split = ""))
  
  v <- matrix(u, byrow = TRUE, ncol = x)
  
  return(v)
}




#converst
definer <- function(x){
  mi <- min(x)
  ma <- max(x)
  x[which(x == mi)] <- 0
  x[which(x == ma)] <- 1
  return(x)
}




#Cuts down the above output into just the two indices (i, j) and 
#and the corresponding closeness metric
grouper <- function(data, strength = 6){
  new <- data[which(data[,8] >= strength), c(1,2,8)]
}







assign_groups <- function(data, groups){
  j <- groups$j
  i <- groups$i
  mx <- length(unique(i))
  data[, 14:(13+mx)] <- 0
  data[j, 13 + i] <- i
  return(data)
}


smalls_calc <- function(x, low_group_size = 20){
  t <- table(x$group) < 20
  smalls <- as.numeric(names(t)[t])
  return(smalls)
}



group_little <- function(x, smalls){
  if(sum(x[4] %in% smalls) == 1){x[4] <- smalls[1]}
  return(x)
}


