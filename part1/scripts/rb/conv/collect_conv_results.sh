cd /home/wzhu/irt/part1/data/sptree/rb/ne_${1}_gene_${2}/
grep -lr "ACHIEVED CONVERGENCE" . | sort -V | sed 's/\.\/check_convergence_//' | sed 's/\.txt//' | wc -l
