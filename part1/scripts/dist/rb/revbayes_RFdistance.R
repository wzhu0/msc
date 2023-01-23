library(ape)
library(TreeDist)
library(treeio)

rf <- c()

for (i in 1:REP) {
    
    true_sptree <- read.tree(paste0(SP_DIR, "sp_", i, ".tree"))
    rev_sptree <- as.phylo(read.beast(paste0(REV_DIR, "rev_MAP_", i, ".tree")))

    rf <- c(rf, RobinsonFoulds(true_sptree, rev_sptree, normalize = TRUE))
}

print("RF DISTANCE:")
print(rf)
print("MEAN RF DISTANCE:")
print(mean(rf))
print("CORRECT RATE:")
print(sum(rf == 0) / REP)
