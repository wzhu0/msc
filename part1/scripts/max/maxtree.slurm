#!/bin/bash 
#SBATCH --job-name=maxtree
#SBATCH --output=/home/wzhu/irt/part1/logs/rb/ne_1e5_gene_1e3/%A_%a.log
#SBATCH --error=/home/wzhu/irt/part1/logs/rb/ne_1e5_gene_1e3/%A_%a.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-core=1
#SBATCH --mem-per-cpu=1G
#SBATCH --time=24:00:00
##SBATCH --mail-user wenjie.zhu@campus.lmu.de
##SBATCH --mail-type=ALL
##SBATCH --qos=high_prio
##SBATCH --array=1-50%10

# load modules
module load gnu/7
module load boost
module load openmpi

# variables
NE=$1
NUM_GENES=$2
DIR="/home/wzhu/irt/"


# run revbayes to reconstruct species tree
rb_command="TREE_DIR = \"${DIR}/sim/data/sptree/\";
            SIM_DIR = \"${DIR}/sim/data/getree/ne_${NE}_gene_${NUM_GENES}/\";
            OUT_DIR = \"${DIR}/part1/data/sptree/rb/ne_${NE}_gene_${NUM_GENES}/\";
            source(\"./maxtree.Rev\");"
echo $rb_command | rb-msc
