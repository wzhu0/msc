library(ape)
library(TreeDist)


rf <- c()

for (i in 1:REP) {
    
    true_sptree <- read.tree(paste0(SP_DIR, "sp_", i, ".tree"))
    max_sptree <- read.tree(paste0(MAX_DIR, "max_", i, ".tree"))

    rf <- c(rf, RobinsonFoulds(true_sptree, max_sptree, normalize = TRUE))
}

print("RF DISTANCE:")
print(rf)
print("MEAN RF DISTANCE:")
print(mean(rf))
print("CORRECT RATE:")
print(sum(rf == 0) / REP)
