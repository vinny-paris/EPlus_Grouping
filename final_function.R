#Pass this function a file of the formate that parameter 
#information is given in from Joshua New, then pass the 
#number of groups you would like (default is 10). Larger
#group number means more runs but more accuracey in reduced
#effects cancelling.

create_grouping_exp <- function(file, num_of_groups = 10){
  exp_data <- make_groups(file, group_size = num_of_groups) 
  design_matrix <- make_design(exp_data)
  final <- list(exp_data, design_matrix)
  names(final) <- c("param_data", "desgin_matrix")
  return(final)
}
  
