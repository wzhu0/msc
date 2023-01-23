cd /home/wzhu/irt/part1/data/sptree/rb/ne_1e${1}_gene_${2}e${3}/
grep -L "ACHIEVED CONVERGENCE" check* | sort -V | sed 's/check_convergence_//' | sed 's/\.txt//' | sed -e "s/^/sbatch conv_single.slurm 1e${1} ${2}e${3} /"
