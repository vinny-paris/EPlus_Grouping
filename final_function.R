create_grouping_exp <- function(file, num_of_groups = 10){
  m <- make_groups(file, group_size = num_of_groups) 
  n <- make_design(m) 
  return(n)
}
  
