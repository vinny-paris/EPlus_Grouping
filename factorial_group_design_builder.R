#Build group factorial experiment design matrix

make_design <- function(data_summary){
  groups <- data_summary$Group
  

  grp_size <- length(unique(groups))
  
  #make the 0/1 factorial design
  fact <- balloon(grp_size)
  
  #expand the factorial design so every variable in the
  # same group has the same column
  exp_01_char <- fact[,groups]
  exp_01      <- apply(exp_01_char, 1:2, as.numeric)

  #transform the 0/1's to p20/p80's
  exp_0big <- sweep(exp_01, 2, data$p80, "*")
  exp_lit1 <- sweep(abs(exp_01 - 1), 2, data$p20, "*")
  exp_correct <- exp_0big + exp_lit1
  
  #name the cols
  namey <- apply(data_summary[,2:4], 1, paste, collapse = "-")
  colnames(exp_correct) <- namey
  
  return(exp_correct)
}
