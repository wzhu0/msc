#!/bin/bash
#SBATCH --job-name=conv_s
#SBATCH --output=/home/wzhu/irt/part1/logs/rb/convergence/ne_1e7_gene_1e2/conv_%j.log
#SBATCH --error=/home/wzhu/irt/part1/logs/rb/convergence/ne_1e7_gene_1e2/conv_%j.err
#SBATCH --nodes=1
##SBATCH --ntasks=1
##SBATCH --cpus-per-task=1
##SBATCH --mem-per-cpu=1G
#SBATCH --mem=1G
#SBATCH --time=12:00:00
##SBATCH --mail-type=all
##SBATCH --mail-user=wenjie.zhu@campus.lmu.de
##SBATCH --array=1-100%10
#SBATCH --qos=high_prio

# load module
module purge
module load R/4.2.0

NE=$1
NUM_GENES=$2
DIR="/home/wzhu/irt/part1/data/sptree/rb/ne_${NE}_gene_${NUM_GENES}/"

# script to run
Rscript --no-save --quiet run_convenience.R ${DIR} ${3} > ${DIR}check_convergence_${3}.txt
