#!/bin/bash 
#SBATCH --job-name=rerun_1
#SBATCH --output=/home/wzhu/irt/part1/logs/rb/ne_1e7_gene_1e2/%j_.log
#SBATCH --error=/home/wzhu/irt/part1/logs/rb/ne_1e7_gene_1e2/%j_.err
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --ntasks-per-core=1
#SBATCH --mem-per-cpu=1G
#SBATCH --time=6-0:00:00
##SBATCH --mail-user wenjie.zhu@campus.lmu.de
##SBATCH --mail-type=ALL
#SBATCH --qos=high_prio

# load modules
module load gnu/7
module load boost
module load openmpi

# variables
REP_INDEX=$3
NE=$1
NUM_GENES=$2
NUM_GEN=$4
DIR="/home/wzhu/irt/"


# run revbayes to reconstruct species tree
rb_command="NE = ${NE};
            NUM_GENES = ${NUM_GENES};
            NUM_GEN = ${NUM_GEN};
            TREE_DIR = \"${DIR}/sim/data/sptree/\";
            SIM_DIR = \"${DIR}/sim/data/getree/ne_${NE}_gene_${NUM_GENES}/\";
            OUT_DIR = \"${DIR}/part1/data/sptree/rb/ne_${NE}_gene_${NUM_GENES}/\";
            REP_INDEX = ${REP_INDEX};
            source(\"../joint_MSC.Rev\");"
echo $rb_command | srun -n2 rb-mpi-msc
