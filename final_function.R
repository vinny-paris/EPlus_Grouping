create_grouping_exp <- function(file, group_size = 10){
  m <- make_groups(file, group_size = group_size) 
  n <- make_design(m) 
  return(n)
}
  
