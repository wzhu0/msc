cd /home/wzhu/irt/part1/data/sptree/rb/ne_1e${1}_gene_1e2/
grep -L "ACHIEVED CONVERGENCE" check* | sort -V | sed 's/check_convergence_//' | sed 's/\.txt//' | sed -e "s/^/sbatch single.slurm 1e${1} 1e2 /" | sed -e "s/$/ ${2}e4/"
