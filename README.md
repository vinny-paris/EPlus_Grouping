# EPlus_Grouping
This package will layout a scheme to efficiently group variables in the EnergyPlus model idf files to allow for variable selection process to occur.

The main function is in the R file "final_fucntion.R". It needs to be given the name (and location if not in the current working directory) of the parameter information file that Joshua New gave me and the number of groups wanted. It will return a list of 1) a slightly larger information set than the orgiinal file including group assignment and 20th and 80th percentiles and 2) a design matrix to be used to build the IDF files


There are three "background" R files that need to be ran before the main R file. "metric" is just a grab bag of small functions. "make_design" will actually create the factorial design of appropriate size with the 20th and 80th percentile of the parameter's range being used as 0/1 respectively. "make_groups" assigns the groups to each variable based on name overlapping and parameter values using an agglometartive clustering algorithm.

The example file just runs there a small example of what everything looks like using the data file in the "example data" folder (Large_Hospital_New2004.csv). 

The outdate folder is just a random smattering of old code that can be ignored or even deleted (I'm afraid I'll delete something I need)
