library(ape)
library(TreeDist)

rf_tworep <- c()
rf_true <- c()

for (i in 1:REP) {
	true_sptree <- read.tree(paste0(SP_DIR, "sp_", i, ".tree"))
	mp_sptree <- read.nexus(paste0(MP_DIR, "infer_", i, ".trees_besttree.tre"))

        rf_tworep <- c(rf_tworep, RobinsonFoulds(mp_sptree[1], mp_sptree[2], normalize = TRUE))
        rf_true <- c(rf_true, RobinsonFoulds(mp_sptree[1], true_sptree, normalize = TRUE))
}

print("two replicates:")
print(rf_tworep)
print("rep1 vs true species tree:")
print(rf_true)
print("CORRECT RATE:")
print(sum(rf_true == 0) / REP)
