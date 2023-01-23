#!/bin/bash
#SBATCH --job-name=conv
#SBATCH --output=/home/wzhu/irt/part1/logs/rb/convergence/ne_1e5_gene_5e2/conv_%A_%a.log
#SBATCH --error=/home/wzhu/irt/part1/logs/rb/convergence/ne_1e5_gene_5e2/conv_%A_%a.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1G
#SBATCH --time=00:10:00
##SBATCH --mail-type=all
##SBATCH --mail-user=wenjie.zhu@campus.lmu.de
#SBATCH --array=1-50%50
#SBATCH --qos=high_prio

# load module
module purge
module load R/4.2.0

NE=$1
NUM_GENES=$2
DIR="/home/wzhu/irt/part1/data/sptree/rb/ne_${NE}_gene_${NUM_GENES}/"

# script to run
Rscript --no-save run_convenience.R ${DIR} ${SLURM_ARRAY_TASK_ID} > ${DIR}check_convergence_${SLURM_ARRAY_TASK_ID}.txt
