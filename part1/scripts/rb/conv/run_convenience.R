# load packages
library(convenience)

# get arguement from outside
args = commandArgs(trailingOnly=TRUE)
DIR = args[1]
GENE_INDEX = args[2]

# change working directory
setwd(DIR)

# check convergence
check_conv <- checkConvergence( list_files = c(paste0("joint_msc_", GENE_INDEX, "_run_1.log"), paste0("joint_msc_", GENE_INDEX, "_run_1.trees"), paste0("joint_msc_", GENE_INDEX, "_run_2.log"), paste0("joint_msc_", GENE_INDEX, "_run_2.trees")) )
print(check_conv)


