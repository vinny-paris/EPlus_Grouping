make_groups <- function(file = NULL, group_size = 10, data = NULL){
  
  if(length(data) == 0 & length(file) == 0) {stop("Please pass a file or
  a dataframe to this function")}
  
#read in the file
  if(length(data) == 0){
  fil     <-  read.csv(file, header = TRUE)
  } else {fil <- data}
  
  rs      <- dim(fil)[1]
#attach 20th and 80th percentiles
  fil$p20 <-  (fil$Maximum - fil$Minimum)*.2 + fil$Minimum 
  fil$p80 <-  (fil$Maximum - fil$Minimum)*.8 + fil$Minimum

#combine and then break apart names
  Nam <- data.frame(apply( fil[ , 2:4 ] , 1 , paste , collapse = "_" ))

#For every possible combination of rows, find word correlation, 
#feild/class/boject matriches and if the 80th percentiles are 
#the same
  matching <- jing(Nam, fil) 
  
#give scores to each pair for "closeness" and organize it as a 
#data frame
  cooky <- t(apply(matching, 1, points))
  colnames(cooky)[8] <- 'corr_points'
  cooky <- data.frame(cooky)
  lcook <- cooky[,c(1,2,8)]
  
  
#prepare a similarity matrix for the clustering algorithm
  
#assign to the diagnols the highest possible score
  diags <- data.frame(1:rs, 1:rs, 15)
  names(diags) <- c("i", "j", "corr_points")
  
#Create a *similarity* matrix that is symetric
#The + .001 is for an inversion in the next step
  ook <- rbind(lcook, diags)
  L <- dcast(ook, i ~ j, value.var = "corr_points")[,-1]
  L[is.na(L)] <- 0
  L <- L + t(L) + .001
  
#Create a *disimilarity* matrix by inverting the above
  m <- 1/L
  
#create groups and attach to the original data frame
  agnes(m, diss = TRUE) -> hope
  heep <- as.dendrogram(hope)
  sub_grp <- cutree(as.hclust(heep), k = min(dim(data)[1], group_size))
  fil$Group <- sub_grp
  
#done
  return(fil)
}  
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  