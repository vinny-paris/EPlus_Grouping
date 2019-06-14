# EPlus_Grouping
This package will layout a scheme to efficiently group variables in the EnergyPlus model idf files to allow for variable selection process to occur


Right there are two files containing functions that need to be read in. The first is "word_cors" which is used to break down how tightly to variable names are connected. It splits the strings along puncuations and spaces according to regular expressions and then finds the proportion of shared "words" between pairs of names. One function is for vectors and the other is applied to entire dataframes.

The second function file is metric which takes in the original description file (not the building IDF but the pre generated information about the parameters of interest) and manipulates them along different lines to find similarities (mathcing 80th percentiles, same group, same field, etc....). It also folds in teh word_cors functions for it's use. 

The example file just runs there a small example of what everything looks like using the data file here in the project (Large_Hospital_New2004.csv). 

The old_code file is previous work that I will canabalize after getting the groups organized properly