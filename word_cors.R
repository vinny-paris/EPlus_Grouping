


#Finds the proportions of words in variable names that are the same
word_cor <- function(j){
  x <- unlist(strsplit(as.character(j[1]), split = "[[:punct:][:space:]]+"))
  y <- unlist(strsplit(as.character(j[2]), split = "[[:punct:][:space:]]+"))
  sum(chmatch(x, y, nomatch = 0) != 0)/max(length(x), length(y))
}


#same as above but can be applied to a matrix instead of just 
#a vector
word_cor_big <- function(nam, data){
  n <- dim(data)[1]
  k <- 0
  holding <- data.frame(matrix(NA, nrow = n*(n-1)/2, ncol = 4))
  for(i in 1:(length(nam)-1)){
    for(j in (i+1):length(nam)){
      k <- k + 1
      r_hold <- data.frame(i, j, word_cor(nam[[i]], nam[[j]]))
      param_match <- data[i, 'p80'] == data[j, 'p80']
      holding[k,]  <- c(r_hold, param_match)
     
    }
  }
  rownames(holding) <- NULL
  names(holding) <- c("i", "j", "word_cor", "param_match")
  return(holding)
}





















