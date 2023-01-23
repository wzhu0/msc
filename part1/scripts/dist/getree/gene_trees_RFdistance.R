library(ape)
library(TreeDist)


num_diff <- c()
mean_diff <- c()


for (j in 1:REP) {
	true_sptree <- read.tree(paste0(SP_DIR, "sp_", j, ".tree"))
	gene_trees <- read.tree(paste0(GE_DIR, "sim_", j, ".tree"))
        rf <- c()

        for (i in 1:NUM_GENES) {
		rf <- c(rf, RobinsonFoulds(true_sptree, gene_trees[i], normalize = TRUE))
	}

	    # print(sum(rf))
	    # print(rf)
	    # print(sum(rf != 0 ))
	    mean_diff <- c(mean_diff, mean(rf))
	    num_diff <- c(num_diff, sum(rf != 0 ))
}

print("NUMBER OF GENE TREES THAT ARE DIFFERENT FROM SPECIES TREE WITHIN EACH REPLICATE:")
print(num_diff)
print("AVERAGE NUMBER OF GENE TREES THAT ARE DIFFERENT FROM SPECIES TREE WITHIN EACH REPLICATE:")
print(mean(num_diff))
print("AVERAGE RF DISTANCE WITHIN EACH REPLICATE:")
print(mean_diff)
print("AVERAGE RF DISTANCE:")
print(mean(mean_diff))

