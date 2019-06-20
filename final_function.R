#Pass this function a file of the formate that parameter 
#information is given in from Joshua New, then pass the 
#number of groups you would like (default is 10). Larger
#group number means more runs but more accuracey in reduced
#effects cancelling.

create_grouping_exp <- function(file, num_of_groups = 10){
  m <- make_groups(file, group_size = num_of_groups) 
  n <- make_design(m)
  o <- list(m, n)
  return(o)
}
  
