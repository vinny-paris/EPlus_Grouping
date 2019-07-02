#Pass this function a file of the formate that parameter 
#information is given in from Joshua New, then pass the 
#number of groups you would like (default is 10). Larger
#group number means more runs but more accuracey in reduced
#effects cancelling.

create_grouping_exp <- function(file = NULL, num_of_groups = 10, data = NULL){
  if(length(data) == 0 & length(file) == 0) {stop("Please pass a file or
  a dataframe to this function")}
  if(length(data) != 0 & length(file) != 0) {stop("Please pass only a single
  file or dataframe to this function")}
  
  exp_data <- make_groups(file = file, group_size = num_of_groups, data) 
  design_matrix <- make_design(exp_data)
  final <- list(exp_data, design_matrix)
  names(final) <- c("param_data", "design_matrix")
  return(final)
}
  
